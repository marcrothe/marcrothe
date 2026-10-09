import PhotosUI
import SwiftUI

/// Hinzufügen und Bearbeiten in einer Ansicht. Mit `editing` ist es Bearbeiten:
/// Datum, Lauf und Strecke sind dann fest.
struct AddView: View {
    @Environment(BibStore.self) private var store
    @Environment(\.dismiss) private var dismiss

    var editing: Bib?
    var onFinished: (() -> Void)?

    @State private var date: Date
    @State private var dateSet: Bool
    @State private var showDateWheel = false
    @State private var raceID: String?
    @State private var distanceIndex: Int?
    @State private var number: String
    @State private var runner: String
    @State private var hours: String
    @State private var minutes: String
    @State private var seconds: String
    @State private var favorite: Bool
    @State private var flipped = false

    @State private var photoItem: PhotosPickerItem?
    @State private var scanning = false
    @State private var scan: ScanResult?
    @State private var added: Bib?

    init(editing: Bib? = nil, onFinished: (() -> Void)? = nil) {
        self.editing = editing
        self.onFinished = onFinished
        let b = editing
        _date = State(initialValue: b?.race.date ?? .now)
        _dateSet = State(initialValue: b != nil)
        _raceID = State(initialValue: b?.raceID)
        _distanceIndex = State(initialValue: b?.distanceIndex)
        _number = State(initialValue: b?.number ?? "")
        _runner = State(initialValue: b?.runner ?? BibStore.profileName)
        let s = b?.seconds
        _hours = State(initialValue: s.map { $0 >= 3600 ? String($0 / 3600) : "" } ?? "")
        _minutes = State(initialValue: s.map { String(($0 % 3600) / 60) } ?? "")
        _seconds = State(initialValue: s.map { String(format: "%02d", $0 % 60) } ?? "")
        _favorite = State(initialValue: b?.favorite ?? false)
    }

    private var isEdit: Bool { editing != nil }
    private var race: Race? { raceID.flatMap(Catalog.race) }
    private var distance: Distance? {
        guard let race, let i = distanceIndex, race.distances.indices.contains(i) else { return nil }
        return race.distances[i]
    }
    private var racesOnDate: [Race] { dateSet ? Catalog.races(on: date) : [] }

    private var timeInvalid: Bool { (Int(minutes) ?? 0) > 59 || (Int(seconds) ?? 0) > 59 }
    private var totalSeconds: Int? {
        let h = Int(hours) ?? 0, m = Int(minutes) ?? 0, s = Int(seconds) ?? 0
        let t = h * 3600 + m * 60 + s
        return t > 0 && !timeInvalid ? t : nil
    }
    private var complete: Bool { dateSet && race != nil && distance != nil && !number.isEmpty && !timeInvalid }

    private var draft: Bib {
        Bib(id: editing?.id ?? UUID(), raceID: raceID ?? "kh", distanceIndex: distanceIndex ?? 0,
            number: number, runner: runner, seconds: totalSeconds, favorite: favorite)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    preview
                        .frame(maxWidth: .infinity)
                        .frame(height: 190)
                        .listRowBackground(Color.clear)
                }

                Section {
                    dateRow
                    raceRow
                    distanceRow
                    numberRow
                    nameRow
                    timeRow
                    if isEdit { favoriteRow }
                }

                if complete {
                    Section {
                        Button(isEdit ? "Fertig" : "Zur Sammlung hinzufügen", action: save)
                            .font(.headline)
                            .foregroundStyle(Color.bibRed)
                            .frame(maxWidth: .infinity)
                    }
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
                }
            }
            .animation(.default, value: complete)
            .navigationTitle(isEdit ? "Bearbeiten" : "Hinzufügen")
            .toolbar {
                if isEdit {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Abbrechen") { dismiss() }
                    }
                } else {
                    ToolbarItem(placement: .topBarTrailing) {
                        PhotosPicker(selection: $photoItem, matching: .images) {
                            Label("Aus Foto", systemImage: "photo")
                        }
                    }
                }
            }
            .onChange(of: photoItem) { _, item in
                guard let item else { return }
                Task { await readPhoto(item) }
            }
            .overlay {
                if scanning {
                    ProgressView("Wird erkannt …")
                        .padding(24)
                        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 20))
                }
            }
            .sheet(item: $scan) { result in
                ScanResultSheet(result: result)
            }
            .fullScreenCover(item: $added) { bib in
                AddedView(bib: bib) {
                    added = nil
                    reset()
                    onFinished?()
                } another: {
                    added = nil
                    reset()
                }
            }
        }
    }

    // MARK: Vorschau

    @ViewBuilder private var preview: some View {
        if distance?.template != nil {
            FlipCard(bib: draft, flipped: flipped)
                .frame(width: 210)
                .onTapGesture { flipped.toggle() }
        } else {
            GeometryReader { g in
                GlassPlate(u: g.size.width / 108, h: 76)
            }
            .aspectRatio(108 / 76, contentMode: .fit)
            .frame(width: 210)
        }
    }

    // MARK: Zeilen

    private var dateRow: some View {
        Group {
            Button {
                if isEdit { return }
                if !dateSet { dateSet = true }
                withAnimation { showDateWheel.toggle() }
            } label: {
                LabeledContent("Datum") {
                    Text(dateSet ? date.formatted(.dateTime.day().month(.wide).year()) : "Auswählen")
                        .foregroundStyle(showDateWheel ? Color.bibRed : (dateSet ? .primary : Color.bibGrey))
                }
            }
            .foregroundStyle(isEdit ? Color.bibGrey : .primary)
            if showDateWheel && !isEdit {
                DatePicker("Datum", selection: $date, in: ...Date.now, displayedComponents: .date)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                    .environment(\.locale, Locale(identifier: "de_DE"))
                    .onChange(of: date) { _, _ in
                        if let r = race, !Calendar.current.isDate(r.date, inSameDayAs: date) {
                            raceID = nil
                            distanceIndex = nil
                            number = ""
                        }
                    }
            }
        }
    }

    private var raceRow: some View {
        Picker("Lauf", selection: $raceID) {
            Text(racesOnDate.isEmpty ? (dateSet ? "Keiner bekannt" : "Erst Datum wählen") : "\(racesOnDate.count) an diesem Tag")
                .tag(String?.none)
            ForEach(racesOnDate.isEmpty && race != nil ? [race!] : racesOnDate) { r in
                Text(r.name).tag(Optional(r.id))
            }
        }
        .pickerStyle(.menu)
        .disabled(isEdit || racesOnDate.isEmpty)
        .foregroundStyle(isEdit ? Color.bibGrey : .primary)
        .onChange(of: raceID) { old, new in
            guard old != new, !isEdit else { return }
            distanceIndex = race.flatMap { $0.distances.count == 1 ? 0 : nil }
            number = ""
        }
    }

    @ViewBuilder private var distanceRow: some View {
        if let race, race.distances.count > 1 {
            Picker("Strecke", selection: $distanceIndex) {
                Text("Auswählen").tag(Int?.none)
                ForEach(race.distances.indices, id: \.self) { i in
                    let d = race.distances[i]
                    Text(d.template == nil ? "\(d.label), Vorlage folgt" : d.label).tag(Optional(i))
                }
            }
            .pickerStyle(.menu)
            .disabled(isEdit)
            .foregroundStyle(isEdit ? Color.bibGrey : .primary)
        } else {
            LabeledContent("Strecke") {
                Text(distance.map { "\(TimeFormat.km($0.km)) km" } ?? "")
                    .foregroundStyle(isEdit ? Color.bibGrey : .primary)
            }
            .foregroundStyle(isEdit || race == nil ? Color.bibGrey : .primary)
        }
    }

    private var numberRow: some View {
        LabeledContent("Startnummer") {
            HStack(spacing: 2) {
                Text(number.isEmpty ? "" : (distance?.prefix ?? "")).foregroundStyle(Color.bibGrey)
                TextField(distance?.numberPlaceholder ?? "", text: $number)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.trailing)
                    .frame(maxWidth: 110)
                    .onChange(of: number) { _, v in
                        let digits = String(v.filter(\.isNumber).prefix(6))
                        if digits != v { number = digits }
                    }
                    .onTapGesture { flipped = false }
            }
        }
        .disabled(distance == nil)
        .opacity(distance == nil ? 0.4 : 1)
    }

    @ViewBuilder private var nameRow: some View {
        if let race, race.nameOnBib != .none {
            LabeledContent("Name") {
                TextField("Name", text: $runner)
                    .multilineTextAlignment(.trailing)
                    .frame(maxWidth: 160)
            }
        } else {
            LabeledContent("Name") {
                Text(race == nil ? "" : "nicht aufgedruckt").foregroundStyle(Color.bibGrey)
            }
            .opacity(race == nil ? 0.4 : 1)
        }
    }

    private var timeRow: some View {
        VStack(alignment: .trailing, spacing: 6) {
            LabeledContent("Zeit") {
                HStack(spacing: 4) {
                    timeField("h", text: $hours, max: 1)
                    Text(":").foregroundStyle(Color.bibGrey)
                    timeField("mm", text: $minutes, max: 2, bad: (Int(minutes) ?? 0) > 59)
                    Text(":").foregroundStyle(Color.bibGrey)
                    timeField("ss", text: $seconds, max: 2, bad: (Int(seconds) ?? 0) > 59)
                }
            }
            if timeInvalid {
                Text("Minuten und Sekunden gehen nur bis 59.")
                    .font(.caption)
                    .foregroundStyle(.red)
            }
        }
        .disabled(race == nil)
        .opacity(race == nil ? 0.4 : 1)
    }

    private func timeField(_ placeholder: String, text: Binding<String>, max: Int, bad: Bool = false) -> some View {
        TextField(placeholder, text: text)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .frame(width: max == 1 ? 26 : 36)
            .padding(.vertical, 4)
            .background(Color.white.opacity(0.07), in: RoundedRectangle(cornerRadius: 8))
            .foregroundStyle(bad ? Color.red : Color.primary)
            .onChange(of: text.wrappedValue) { _, v in
                let digits = String(v.filter(\.isNumber).prefix(max))
                if digits != v { text.wrappedValue = digits }
            }
            .onTapGesture { flipped = true }
    }

    private var favoriteRow: some View {
        LabeledContent("Favorit") {
            Button {
                withAnimation(.spring(duration: 0.35, bounce: 0.5)) { favorite.toggle() }
            } label: {
                Image(systemName: favorite ? "star.fill" : "star")
                    .font(.title3)
                    .foregroundStyle(favorite ? Color.white : Color.bibGrey)
                    .contentTransition(.symbolEffect(.replace))
            }
            .buttonStyle(.plain)
            .accessibilityLabel(favorite ? "Favorit, an" : "Favorit, aus")
        }
    }

    // MARK: Aktionen

    private func save() {
        if isEdit {
            store.update(draft)
            dismiss()
        } else {
            let bib = draft
            store.add(bib)
            added = bib
        }
    }

    private func reset() {
        date = .now
        dateSet = false
        showDateWheel = false
        raceID = nil
        distanceIndex = nil
        number = ""
        runner = BibStore.profileName
        hours = ""; minutes = ""; seconds = ""
        flipped = false
    }

    private func readPhoto(_ item: PhotosPickerItem) async {
        scanning = true
        defer { scanning = false; photoItem = nil }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        let lines = (try? await TextRecognizer.recognize(data)) ?? []
        let guess = BibParser.guess(lines: lines, captureDate: TextRecognizer.captureDate(data))
        if let id = guess.raceID, let r = Catalog.race(id) {
            date = r.date
            dateSet = true
            raceID = id
            distanceIndex = guess.distanceIndex ?? (r.distances.count == 1 ? 0 : nil)
        } else if let d = guess.printedDate ?? guess.captureDate {
            date = d
            dateSet = true
        }
        if let n = guess.number { number = n }
        scan = ScanResult(lines: lines, guess: guess)
    }
}

/// Karte mit vorgegebener Seite (für die Vorschau, die sich bei der Zeit selbst umdreht).
struct FlipCard: View {
    let bib: Bib
    let flipped: Bool

    var body: some View {
        ZStack {
            BibView(bib: bib).opacity(flipped ? 0 : 1)
            BibView(bib: bib, back: true)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .opacity(flipped ? 1 : 0)
        }
        .rotation3DEffect(.degrees(flipped ? 180 : 0), axis: (x: 0, y: 1, z: 0), perspective: 0.4)
        .animation(.spring(duration: 0.6), value: flipped)
    }
}

// MARK: Ergebnis des Fototests

struct ScanResult: Identifiable {
    let id = UUID()
    let lines: [OCRLine]
    let guess: BibGuess
}

struct ScanResultSheet: View {
    let result: ScanResult
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            List {
                Section("Was die App daraus macht") {
                    LabeledContent("Lauf", value: result.guess.raceID.flatMap(Catalog.race)?.name ?? "nicht gefunden")
                    LabeledContent("Strecke", value: result.guess.raceID.flatMap(Catalog.race).flatMap { r in result.guess.distanceIndex.map { r.distances[$0].label } } ?? "nicht sicher")
                    LabeledContent("Startnummer", value: result.guess.number ?? "nicht gefunden")
                    LabeledContent("Datum auf der Startnummer", value: result.guess.printedDate?.formatted(date: .numeric, time: .omitted) ?? "keins")
                    LabeledContent("Aufnahmedatum des Fotos", value: result.guess.captureDate?.formatted(date: .numeric, time: .omitted) ?? "keins")
                }
                Section("Erkannter Text, größter zuerst") {
                    if result.lines.isEmpty {
                        Text("Kein Text erkannt.").foregroundStyle(.secondary)
                    }
                    let maxH = result.lines.first?.height ?? 1
                    ForEach(result.lines) { line in
                        HStack(spacing: 12) {
                            Capsule()
                                .fill(Color.bibRed.opacity(0.8))
                                .frame(width: max(4, 60 * line.height / maxH), height: 6)
                                .frame(width: 60, alignment: .leading)
                            Text(line.text)
                            Spacer()
                            Text("\(Int(line.confidence * 100)) %")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Fototest")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Fertig") { dismiss() }
                }
            }
        }
    }
}

// MARK: Nach dem Hinzufügen

struct AddedView: View {
    let bib: Bib
    let toCollection: () -> Void
    let another: () -> Void
    @State private var shown = false
    @State private var flipped = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Circle()
                .fill(AngularGradient(colors: Holo.colors, center: .center))
                .frame(width: 380, height: 380)
                .blur(radius: 50)
                .opacity(shown ? 0.32 : 0)
                .scaleEffect(shown ? 1 : 0.3)
                .offset(y: -90)
            VStack(spacing: 26) {
                Spacer()
                FlipCard(bib: bib, flipped: flipped)
                    .frame(width: 280)
                    .scaleEffect(shown ? 1 : 0.6)
                    .offset(y: shown ? 0 : -300)
                    .shadow(color: .black.opacity(0.5), radius: 20, y: 18)
                VStack(spacing: 6) {
                    Image(systemName: "checkmark")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(Color.bibRed)
                        .frame(width: 34, height: 34)
                        .background(Color.bibRed.opacity(0.14), in: Circle())
                    Text("IN DEINER SAMMLUNG")
                        .font(.footnote.weight(.semibold))
                        .foregroundStyle(Color.bibGrey)
                    Text("\(bib.distance.label) \(bib.race.city)")
                        .font(.system(size: 22, weight: .black).width(.expanded))
                    Text([bib.line, bib.timeText].compactMap { $0 }.joined(separator: " | "))
                        .foregroundStyle(Color.bibGrey)
                }
                .opacity(shown ? 1 : 0)
                Spacer()
                VStack(spacing: 6) {
                    Button(action: toCollection) {
                        Text("Zur Sammlung").font(.headline).frame(maxWidth: .infinity).padding(.vertical, 14)
                    }
                    .buttonStyle(.bordered)
                    .tint(Color.bibRed)
                    Button("Noch eine hinzufügen", action: another)
                        .foregroundStyle(Color.bibGrey)
                        .padding(.vertical, 8)
                }
                .padding(.horizontal, 20)
                .opacity(shown ? 1 : 0)
            }
        }
        .task {
            withAnimation(.spring(duration: 0.9, bounce: 0.3)) { shown = true }
            try? await Task.sleep(for: .seconds(1.1))
            flipped = true
            try? await Task.sleep(for: .seconds(0.8))
            flipped = false
        }
    }
}
