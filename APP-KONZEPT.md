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

## Hinzufügen per Foto

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
