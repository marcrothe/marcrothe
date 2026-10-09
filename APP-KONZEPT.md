# sub20 Startnummern App: Konzept

Stand 09.10.2026. Festgehalten aus dem Gespräch zwischen Marc und Claude.
Entwurf der Screens: https://claude.ai/artifact/7DQeT3dr8ngjfDXX2cXVDm
Regeln für den Nachbau einzelner Startnummern: `STARTNUMMERN.md`

## Idee in einem Satz

Eine iPhone App, in der Läufer alle ihre Startnummern sammeln, als schöne, einheitliche Nachbauten. Neue und alte Startnummern kommen per Foto hinein, das Erkennen geht fast von selbst.

## Was schon feststeht (Design)

- Hintergrund komplett schwarz, alles sehr clean. Grauer Text in #8a8a99.
- Unter jeder Startnummer nur eine graue Zeile, mittig: Datum und Distanz, zum Beispiel „23.03.2025 | 5 km“.
- Antippen dreht die Startnummer um. Rückseite: helles Papier mit vier Löchern, Name des Laufs, groß die offizielle Zeit.
- Kategorien heißen 5k, 10k, 21k, 42k (k klein, wie überall).

### Navigation

- Schwebende Leiste unten im Apple Stil (Glaskapsel, Variante A) mit zwei Reitern:
  - **Start:** der Stapel, die Startseite der App
  - **Sammlung:** das Raster mit allen Startnummern
- Rechts daneben ein eigener runder Plus Knopf zum Hinzufügen.
- Beim Runterscrollen schrumpft die Leiste, beim Hochscrollen kommt sie zurück.
- Kein Training, kein Coach, keine Sticker in dieser App. Es geht nur um Startnummern.

### Start (Stapel)

- Startnummern liegen schräg übereinander wie ein Stapel auf dem Tisch.
- Seitlich wischen blättert, darunter die graue Zeile, Punkte und Pfeile.

### Sammlung (Raster)

- Zwei Spalten, immer alle Startnummern sichtbar.
- Oben rechts die aktuelle Sortierung mit Sortiersymbol (drei kürzer werdende Striche), auf einer Linie mit der Anzahl.
- Sortieren nach:
  - **Datum:** neueste zuerst, graue Überschriften pro Jahr
  - **Favoriten:** zeigt nur Favoriten, sonst nichts
  - **Laufkategorie:** Überschriften 5k, 10k, 21k, 42k
  - **Kilometer:** längste Strecke zuerst, ohne Überschriften
- Überschriften grau in der dicken Schrift.
- Ganz unten ein gestrichelter Platz „Startnummer hinzufügen“.

### Favoriten

- Startnummer nach oben ziehen macht sie zum Favoriten. Über der Karte erscheint ein Stern:
  - Favorit setzen: Stern erst leer, ab der Schwelle weiß gefüllt
  - Favorit entfernen: Stern erst voll, ab der Schwelle wieder leer
- Beim Setzen läuft einmal ein bunter Holo Schimmer über die Startnummer.
- Favoriten haben:
  - einen 1 Pixel Holo Rand genau entlang der Papierkante (halbe Farbstärke)
  - auf der Rückseite oben mittig einen Holo Stern
  - in der Zeile darunter einen kleinen Holo Stern vor dem Datum, Stern und Text zusammen mittig
  - die Zeile in einer zarten, fast weißen Holo Schrift
- Holo bewegt sich nie von selbst, nur leicht beim Scrollen.
- Entfernen ist animiert: Stern schrumpft und dreht sich weg, Text gleitet zurück in die Mitte, Holo blendet aus.

### Menü bei langem Drücken (09.10.2026)

- Lange auf eine Startnummer drücken (im Stapel und in der Sammlung, am Rechner auch Rechtsklick) öffnet ein Glasmenü wie bei Apple.
- Beim Drücken gibt die Startnummer leicht nach, dann hebt sie sich an, der Rest wird abgedunkelt und unscharf.
- Solange das Menü offen ist, wippt die angehobene Startnummer flüssig und langsam um die senkrechte Achse, etwa 7 Grad nach links und rechts, ohne Stocken.
- Einträge: Zu Favoriten bzw. Aus Favoriten entfernen, Umdrehen, Bearbeiten, Teilen, Löschen (rot, mit Abstand darunter).
- Löschen zeigt unten kurz eine Glas Meldung mit „Rückgängig“.
- Das Menü ist auch der sichtbare zweite Weg zum Favoriten, neben dem Hochziehen.
- Bearbeiten und Teilen haben noch keinen eigenen Bildschirm.

### Wackelmodus in der Sammlung (wie bei den Apps auf dem iPhone)

- Hält man nach dem Aufgehen des Menüs weiter gedrückt (oder tippt „Sammlung bearbeiten“), wackeln alle Startnummern der Sammlung leicht.
- Jede Startnummer bekommt oben links ein kleines Glas Minus zum Entfernen, danach kommt die Glas Meldung mit „Rückgängig“.
- Beenden wie bei Apple: einfach irgendwo neben eine Startnummer tippen, oder oben rechts auf „Fertig“ (Glasknopf statt Zahnrad).

### Glanz auf den Startnummern

- Über jeder Startnummer liegt ein schräger Lichtstreifen mit höchstens 10 Prozent Weiß, genau in der Papierform (Löcher bleiben frei).
- Das Licht fällt immer aus derselben Richtung: Der Streifen hat auf dem Bildschirm immer denselben Winkel, egal wie schräg die Karte liegt (im Stapel, beim Wischen, beim Wackeln). Er dreht sich also nicht mit der Karte mit.
- Er hängt nicht am Hovern oder Scrollen, sondern liegt fest an einer Stelle, vorne wie hinten.
- Nur wenn die Karte im Menü um die senkrechte Achse wippt, gleitet der Glanz leicht mit, wie eine echte Spiegelung.

### Erfolge (dritter Reiter, Idee vom 09.10.2026)

- Die Leiste unten bekommt einen dritten Reiter, zum Beispiel „Erfolge“ mit Pokal Symbol: Start, Sammlung, Erfolge, daneben das Plus.
- Keep it simple. Oben groß die Zahl aller Läufe, darunter je Kategorie:
  - Marathons (42k)
  - Halbmarathons (21k)
  - 10k
  - 5k
- Darunter Trophäen für Meilensteine, zum Beispiel erste Startnummer, 10 Startnummern, erster Halbmarathon, erster Marathon, Läufe in 5 Städten. Noch nicht erreichte Trophäen grau, erreichte mit Holo.
- Alles wird aus der Sammlung berechnet, nichts muss extra eingetragen werden.

### Statistik auf der Startseite (getestet und vorerst verworfen, 09.10.2026)

- Getestet: über dem Stapel groß die Zahl aller Läufe, darunter 42k, 21k, 10k, 5k, alles mittig. Hat Marc nicht gefallen und ist wieder raus.
- Vor dem nächsten Versuch erst recherchieren, was gute App Gestaltung ausmacht, und die Startseite dann von Grund auf durchdenken.

### Läufe in der Nähe (Idee für später, 09.10.2026)

- Die App empfiehlt passende Läufe in der Region, zum Beispiel „Nächster Lauf in Dresden: Citylauf am 21.03.2027“.
- Die Region ergibt sich aus den Städten der gesammelten Startnummern, ganz ohne Standortfreigabe. Optional zusätzlich der Standort.
- Passend zur Sammlung: Wer viele 10k hat, sieht eher 10k Läufe.
- Vor allem für Partnerläufe gedacht, also als Teil einer Kooperation. Klar als Empfehlung gekennzeichnet, ruhig gestaltet und nie auf den Startnummern selbst (dort bleibt es ohne Sponsoren Hinweise, siehe `STARTNUMMERN.md`).
- Möglicher Ablauf mit Partner: Anmeldung zum Lauf direkt verlinken, nach dem Lauf Startnummer per QR Code importieren.

### Feier nach dem Scannen (Idee vom 09.10.2026)

- Ist eine neue Startnummer erkannt, kommt erst eine große Vorschau über den ganzen Bildschirm.
- Die Startnummer fliegt herein, dreht sich einmal um sich selbst (Vorderseite, Rückseite, wieder Vorderseite) und landet groß in der Mitte.
- Dazu richtig Feier: „Glückwunsch!“, Konfetti oder Holo Funken, und eine Zeile wie „Startnummer Nr. 12 in deiner Sammlung“ oder „Dein erster Halbmarathon“.
- Wenn eine Trophäe neu erreicht wurde, erscheint sie direkt mit.
- Ein Tipp auf „Zur Sammlung“ lässt die Startnummer in den Stapel fliegen.
- Muss sich vom Holo der Favoriten und von der Enthüllung einer fertigen Vorlage unterscheiden.

## Hinzufügen (eigene Seite, Entwurf vom 09.10.2026, zweite Fassung)

- Der Reiter „Hinzufügen“ ist eine ganz normale Seite. Sie zeigt sofort ein Formular wie „Neues Ereignis“ im Apple Kalender, zuerst leer.
- Oben steht als Platzhalter eine **klare, glatte Glasplatte mit vier Löchern** in Startnummernform (keine Körnung), mit Glanzstreifen. Die Ränder der vier Löcher sind Glaskanten wie der Außenrand: oben links heller, und wenn der Glanz vorbeizieht, leuchten Außenrand und Lochränder an dieser Stelle mit auf. Auf dem Glas erscheint nur der Lauf. Datum und Strecke stehen dort nicht. Die Platte wippt dabei langsam um die senkrechte Achse wie eine lange gedrückte Startnummer, der Glanz gleitet im selben Takt mit. Sobald ein Lauf mit Vorlage gewählt ist, wird sie durch den echten Nachbau ersetzt, der live die eigene Nummer, den Namen und die Zeit zeigt. Antippen dreht ihn um. Beim Tippen der Zeit dreht er sich von selbst auf die Rückseite, wo die Zeit steht, beim Tippen von Nummer oder Name wieder nach vorn.
- Die Startnummer erscheint erst, wenn man eine Ziffer tippt. Auch das Präfix (zum Beispiel H) kommt erst mit der ersten Ziffer.
- **Schrift passt sich an:** Jedes Feld der Vorlage hat eine feste Breite (Nummer, Name, Zeit auf der Rückseite, Strecke). Je länger der Text, desto kleiner die Schrift, damit er immer hineinpasst und auf derselben Grundlinie bleibt. Beispiel Citylauf: MARC groß, MAXIMILIAN kleiner.
- Start und Sammlung zeigen immer die fertigen Startnummern. Die einsetzbaren Felder gibt es nur beim Hinzufügen.
- Zeilen von oben nach unten, die späteren sind ausgegraut, bis das Datum und dann der Lauf feststehen:
  1. **Datum:** Antippen öffnet Scrollräder wie bei Apple (Tag, Monat, Jahr). Kein Kalender.
  2. **Lauf:** zeigt gleich „1 Lauf an diesem Tag“. Antippen klappt die Läufe dieses Tages auf. Darunter „Lauf nicht dabei? Vorlage anfragen“.
  3. **Strecke:** automatisch, wenn es nur eine gibt, sonst Auswahl mit Haken.
     Beispiel: Beim Europäischen Kulturhauptstadt-Marathon Chemnitz (18.05.2025) gibt es Halbmarathon und Marathon. Beide teilen sich eine Grundvorlage, nur Streckenname, Laufband Text und Präfix der Nummer (H oder M) ändern sich. Nummer und Schrift bleiben mittig.
  4. **Startnummer:** direkt in der Zeile tippen, das Präfix der Vorlage (zum Beispiel H) steht schon davor.
  5. **Name:** automatisch aus dem Profil, nur wenn die Vorlage einen Namen zeigt (MARC oder Marc), sonst „nicht aufgedruckt“.
  6. **Zeit:** optional, drei kleine Felder für Stunden, Minuten und Sekunden (h : mm : ss), Ziffern eintippen, nach zwei Ziffern springt der Cursor ins nächste Feld. Minuten oder Sekunden über 59 werden rot, dann lässt sich nicht speichern. Beim Tippen dreht sich die Vorschau auf die Rückseite mit der Zeit.
  - Das Jahr ergibt sich aus dem Datum.
- „Zur Sammlung hinzufügen“ wird aktiv, sobald Datum, Lauf, Strecke und Startnummer da sind. Der Knopf ist dunkel mit roter Schrift (#FF123E), keine rote Fläche.
- Auch der fertige Nachbau in der Vorschau wippt langsam um die senkrechte Achse, mit mitlaufendem Glanz, genau wie beim langen Drücken.
- **Aus Foto:** Glasknopf oben rechts. Foto aus Fotos wählen, „Wird erkannt …“, danach dasselbe Formular schon ausgefüllt und mit „erkannt“ markiert.
- Technik: Apples Texterkennung (Vision und VisionKit, Live Text) läuft auf dem Gerät, mit der Kamera und mit Fotos aus der Mediathek, und kostet nichts.

## Hinzufügen per Foto (Technik im Hintergrund)

1. Plus antippen, Kamera öffnet sich.
2. Apples Dokumentenscanner (VisionKit) erkennt die Kanten und richtet die Startnummer gerade. Kostenlos, auf dem Gerät.
3. Apples Texterkennung liest Nummer, Lauf, Datum, Distanz, Name. Kostenlos, auf dem Gerät.
4. Die App sucht die passende **Vorlage**. Oft reicht der Text dafür schon.
5. Nur wenn es unklar ist: ein kleines KI Modell (Claude Haiku) bekommt Foto und eine kurze Liste möglicher Vorlagen und antwortet mit Vorlage und Feldern. Kosten etwa 0,02 Cent pro Foto.
6. Die Zeit kommt aus Apple Health (Training an diesem Tag) oder wird kurz eingetippt.
7. Bestätigen, fertig. Die neue Startnummer landet im Stapel.
8. Eintragen von Hand bleibt immer möglich.

## Vorlagen System

- Die KI gestaltet nie selbst. Marc baut jede Vorlage, damit alle Nutzer denselben Nachbau sehen.
- **Eine Vorlage pro Lauf und Jahr** (Designs ändern sich oft jährlich):
  - festes Design: Aufbau, Farben, Logo Ersatz
  - Felder: Startnummer, Name, Datum, Strecke, Startblock
- **Logo Ersatz:** Schrift ungefähr wie im Original, das Logo wird durch eine eigenständige geometrische Form ersetzt (zum Beispiel die bunten Striche beim Kulturhauptstadt Halbmarathon). Echte Logos erst nach Erlaubnis der Veranstalter.
- **Vorlage gibt es noch nicht:**
  - Hinweis „Diese Startnummer kennen wir noch nicht. Vorlage anfragen?“, das Foto geht an Marc.
  - Der Nutzer geht nicht leer aus: Seine Startnummer liegt sofort als **neutraler grauer Platzhalter** mit seinen Daten in der Sammlung, Hinweis „Vorlage in Arbeit“.
  - Versprechen: Vorlage innerhalb von 1 bis 2 Tagen.
  - Ist die Vorlage fertig, wird der Platzhalter automatisch ausgetauscht, mit Mitteilung und einer eigenen Enthüllungs Animation (siehe offene Punkte). Jeder spätere Scan dieses Laufs bekommt die Vorlage sofort.
- Die Anfragen zeigen, welche Läufe gefragt sind. Gebaut wird, was gewünscht wird.
- Werkzeug für Marc: Nachbau zusammen mit Claude nach `STARTNUMMERN.md`, später das Plaketten Studio als Vorlagen Editor.

## Kooperationen mit Läufen

- Vor großen Läufen (zum Beispiel in Dresden) den Veranstalter fragen: echtes Logo erlaubt? Zusammenarbeit?
- Dann ist die Vorlage schon vor dem Start fertig.
- Noch besser: QR Code im Startbeutel, scannen, und die Startnummer ist sofort in der App.
- Für Teilnehmer von Partnerläufen kostenlos. Gutes Argument für Veranstalter, bringt Nutzer.

## Testphase mit Athletics Team Dresden

Idee (Marc, 09.10.2026): Ein junger Laufclub in Dresden als erste Testgruppe. Viele Mitglieder haben schon viele Startnummern.

1. **Phase 1, noch ohne App:** 5 bis 10 Läufer schicken Fotos ihrer Startnummern (gerade von vorn). Marc baut daraus mit Claude die Vorlagen. Jeder bekommt seine Sammlung als Webseite zum Durchwischen und gibt Rückmeldung.
2. **Phase 2, App im Test:** Über TestFlight (Apples kostenlose Testverteilung) scannen die Tester selbst. Hier zeigt sich, wie gut das Erkennen wirklich klappt.
3. **Was wir lernen:** welche Läufe am häufigsten vorkommen (Startbibliothek für Dresden und Sachsen), wie lange eine Vorlage dauert, wie gut die Erkennung ist, ob Favoriten und Holo ankommen, ob jemand für den Scan zahlen würde.
4. **Dank an die Tester:** Scan dauerhaft kostenlos, Nennung als erste Tester in der App.
5. **Datenschutz:** Auf den Fotos stehen Namen. Vorher kurz zustimmen lassen, Fotos nur für die Vorlagen nutzen und danach löschen.

## Bezahlmodell

Grundsatz (Marc, 09.10.2026): Die App ist kostenlos. Bezahlt wird nur der Komfort, eine Startnummer per Foto automatisch einzuscannen. Damit unterstützen Nutzer die laufenden Kosten. Botschaft nach außen: „Ich will hier nicht das große Geld machen. Alles ist frei, nur der Scan kostet ein bisschen.“

- **Kostenlos, für alle:**
  - Startnummern von Hand eintragen, unbegrenzt
  - alle Vorlagen nutzen, unbegrenzt
  - Vorlagen anfragen (Foto hochladen), denn jede neue Vorlage hilft allen
  - Stapel, Sammlung, Sortieren, Favoriten, Umdrehen, alles
  - Vorschlag: 3 Scans zum Ausprobieren, damit jeder den Wow Moment einmal erlebt
- **Bezahlt, nur der Scan:**
  - Foto machen, alles wird automatisch erkannt und eingetragen
  - besonders praktisch für den Import vieler alter Startnummern
- **Preis:** klein halten. Zum Beispiel Jahresabo für etwa 10 €, oder Scan Pakete zum einmaligen Kauf (etwa 20 Scans für 3 €) für alle, die kein Abo wollen. Abwicklung über den App Store.
- Ehrlich kommunizieren: Der einzelne Scan ist günstig, die Beiträge decken alles zusammen, also Entwicklerkonto, Vorlagen bauen, Server für die Vorlagen und Weiterentwicklung.
- Teilnehmer von Partnerläufen können per QR Code ohnehin kostenlos importieren.

## Kosten

- Dokumentenscanner und Texterkennung: 0 €, laufen auf dem iPhone.
- KI pro unklarem Foto: etwa 0,02 Cent (Haiku). 100 Fotos etwa 2 Cent.
- Apple Entwicklerkonto: 99 $ im Jahr.
- Daten möglichst lokal auf dem iPhone und in iCloud, kein eigener Server für Nutzerdaten nötig. Nur die Vorlagen liegen zentral.

## Recht und Datenschutz

- Logo Ersatz eigenständig gestalten, nicht zu nah am Original. Namen von Läufen können Marken sein.
- Früh mit großen Veranstaltern sprechen.
- Auf Startnummern stehen Namen: Wenn die KI in der Cloud läuft, einmal Zustimmung einholen. Scanner und Texterkennung bleiben auf dem Gerät.
- Impressum, Datenschutz, AGB vor dem Verkauf. Kein Ersatz für Rechtsberatung.

## Offene Punkte

- **Enthüllungs Animation**, wenn eine Vorlage fertig wird. Sie soll sich vom Holo der Favoriten unterscheiden. Vorschlag: wie ein Sofortbild, das sich entwickelt. Der graue Platzhalter färbt sich über etwa zwei Sekunden von unten nach oben in das echte Design ein. Alternative: Der Platzhalter dreht sich um, und auf der anderen Seite ist die fertige Startnummer.
- Screens für den Scan Ablauf: Kamera, „Erkannt: Citylauf Dresden 2025“, Bestätigen, Fall „Vorlage gibt es noch nicht“, grauer Platzhalter.
- Hinweis „Noch 1 Scan diesen Monat“ und eine schlichte Seite für die Bezahlvariante.
- Favoriten zwischen Start und Sammlung verbinden (im Entwurf noch getrennt).
- Format der Vorlagen festlegen, damit die App sie laden kann.
