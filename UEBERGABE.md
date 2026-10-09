# Übergabe an Claude Code auf dem Mac

Dieser Ordner enthält alles zur **Startnummern App** (Sammeln von Lauf Startnummern, nur iPhone, Apple Stil).
Er wurde in einer Cloud Sitzung erarbeitet. Diese Datei sagt einer neuen Claude Sitzung auf Marcs Mac, wo was liegt und was als Nächstes kommt.

## Hinweise für Claude

* Marc spricht Deutsch. Immer auf Deutsch antworten, kurz und gegliedert.
* In Texten **keine Gedankenstriche**. Zahlenbereiche mit „bis“ schreiben.
* Marc legt viel Wert darauf, dass sich alles wie eine Apple App anfühlt (Liquid Glass nur auf Bedienelementen, SF Symbols, native Menüs).

## Was wo liegt

| Pfad | Inhalt |
|---|---|
| `APP-KONZEPT.md` | Das komplette Konzept mit allen Entscheidungen. **Zuerst lesen.** |
| `STARTNUMMERN.md` | Wie Startnummern als Vorlagen nachgebaut werden |
| `design/` | Der klickbare Entwurf als `.dc.html` Dateien (Start, Sammlung, Hinzufügen, Erfolge, Baustein Startnummer). Er ist die Vorlage für Aussehen und Verhalten. Online: https://claude.ai/artifact/7DQeT3dr8ngjfDXX2cXVDm |
| `ios/Startnummern/` | Erste SwiftUI Fassung der App (noch nie kompiliert) |
| `ios/README.md` | Anleitung, wie die Swift Dateien in ein Xcode Projekt kommen |
| `reports/`, `research_notes/` | Recherche „Gutes minimalistisches App Design“ |

## Nächste Schritte

1. **Xcode Projekt anlegen** in `ios/`: iOS App „Startnummern“, SwiftUI, Mindestversion iOS 18, die Dateien aus `ios/Startnummern/` übernehmen (die von Xcode erzeugten `ContentView.swift` und `StartnummernApp.swift` ersetzen). Alternativ ein Projekt per Kommandozeile erzeugen, zum Beispiel mit XcodeGen.
2. **Bauen und Fehler beheben.** Der Code wurde ohne Mac geschrieben. Unsicher sind vor allem die neue Vision API (`RecognizeTextRequest`, `perform(on:orientation:)`, `boundingBox.height`) und einzelne SwiftUI Details.
3. **Im Simulator zeigen**, damit Marc sieht, wie die App aussieht.
4. **Fototest auf dem iPhone:** Hinzufügen, „Aus Foto“, Startnummer Foto wählen. Die App zeigt danach alle erkannten Texte nach Größe. Ziel: prüfen, ob Apples Texterkennung ohne KI reicht.
5. Danach schrittweise den Entwurf nachziehen: eigene Schrift HN Black Ext (Datei bei Marc), Holo bei Favoriten, Glanz mit festem Lichtwinkel, Wippen beim langen Drücken, Wackelmodus, Animation nach dem Hinzufügen, Speichern mit SwiftData.

## Wichtige Entscheidungen in Kürze

* Tab Bar mit fünf Reitern: Start, Sammlung, Hinzufügen, Erfolge, Profil. Einstellungen als Zahnrad oben rechts.
* Favorit: Startnummer nach oben ziehen oder im Menü beim langen Drücken. Holo Rand, Holo Stern hinten, Zeile in zarter Holo Schrift.
* Rückseite aller Startnummern gleich: Laufname, große Zeit in HN Black Ext, „offizielle Zeit“.
* Hinzufügen: Formular, zuerst Datum (Räder), dann Lauf des Tages, Strecke, Startnummer (Präfix aus der Vorlage), Name aus dem Profil, Zeit in drei Feldern. Knopf erscheint erst, wenn alles Nötige da ist.
* Bearbeiten: dieselbe Ansicht, Datum, Lauf und Strecke grau und fest.
* Erfolge: Bestzeiten 5K, 10K, Halbmarathon, Marathon als Startnummern, darunter Startnummern, Wettkampf km, Städte. Viertelmarathon zählt nicht als 10K.
* Erkennung per Foto zuerst ohne KI Dienst, nur mit Apples Texterkennung auf dem Gerät.
