# Startnummern App für das iPhone (erste Fassung)

Diese Fassung überträgt den Entwurf in eine echte iPhone App, geschrieben in Swift mit SwiftUI.
Sie ist vor allem dafür da, **den Fototest** auf dem echten iPhone auszuprobieren.

## Was schon drin ist

* Tab Bar mit Start, Sammlung, Hinzufügen, Erfolge, Profil (unter iOS 26 automatisch in Liquid Glass)
* Start: Startnummern zum Durchwischen, antippen dreht sie um
* Sammlung: Raster nach Jahr, Sortieren über das Menü oben rechts
* Lange drücken auf eine Startnummer: Apples echtes Menü mit Favorit, Bearbeiten, Teilen, Löschen
* Hinzufügen und Bearbeiten in einer Ansicht: Datum mit Rädern, Lauf, Strecke, Startnummer, Name, Zeit
* Die Vorschau oben zeigt live die eigene Nummer, beim Tippen der Zeit dreht sie sich um
* **Aus Foto** (oben rechts bei Hinzufügen): Foto aus der Mediathek wählen, Apples Texterkennung liest es,
  die App füllt Lauf, Strecke, Nummer und Datum aus und zeigt danach, was sie erkannt hat
* Erfolge: Bestzeiten 5K, 10K, Halbmarathon, Marathon und drei Zahlen

Noch nicht drin: Speichern über einen Neustart hinaus, Holo Effekte, Wippen, Glanz, Wackelmodus,
die eigene Schrift HN Black Ext (bis dahin die breite Systemschrift).

## Einrichten in Xcode (etwa 5 Minuten)

1. Xcode öffnen, **File > New > Project**, dann **iOS > App**.
2. Product Name: `Startnummern`, Interface: **SwiftUI**, Language: **Swift**, Storage: **None**.
   Bei Team deine Apple ID wählen (Personal Team reicht zum Testen).
3. Im neuen Projekt die beiden Dateien `ContentView.swift` und `StartnummernApp.swift` löschen
   (Move to Trash).
4. Alle `.swift` Dateien aus dem Ordner `ios/Startnummern` dieses Repos in den Projektordner in Xcode ziehen.
   Im Dialog **Copy items if needed** anhaken.
5. Oben beim Projekt unter **General > Minimum Deployments** iOS **18.0** oder neuer einstellen.
6. iPhone per Kabel anschließen, oben als Ziel auswählen und auf **Run** (das Dreieck) drücken.
   Beim ersten Mal auf dem iPhone unter **Einstellungen > Allgemein > VPN und Geräteverwaltung**
   dem eigenen Entwicklerzertifikat vertrauen. Falls verlangt, unter **Datenschutz und Sicherheit**
   den **Entwicklermodus** einschalten.

## Der Fototest

1. In der App auf **Hinzufügen**, oben rechts **Aus Foto**.
2. Ein Foto einer Startnummer wählen.
3. Es erscheint **Fototest** mit
   * dem, was die App daraus macht (Lauf, Strecke, Startnummer, Datum),
   * allen erkannten Texten, der größte zuerst, mit Balken für die Größe und der Sicherheit in Prozent.

Erkannt werden im Moment nur die drei Läufe, für die es Vorlagen gibt:
Kulturhauptstadt-Marathon Chemnitz 2025, Citylauf Dresden 2025, Dresden Marathon 2024.
Bei anderen Startnummern siehst du trotzdem den erkannten Text. Genau das ist für den Test spannend.

## Wenn Xcode Fehler zeigt

Der Code wurde ohne Mac geschrieben und konnte nicht kompiliert werden.
Kleine Fehler beim ersten Bauen sind also möglich. Am schnellsten geht es mit **Claude Code direkt auf dem Mac**
im Projektordner: dann kann Claude bauen, die Fehler sehen und selbst beheben.
Sonst die Fehlermeldung kopieren und in den Chat schicken.

## Dateien

| Datei | Inhalt |
|---|---|
| `StartnummernApp.swift` | Start der App, Tab Bar, Farben |
| `Models.swift` | Läufe und Vorlagen, Startnummern, Speicher |
| `BibView.swift` | Zeichnung der Vorlagen, Rückseite, Glasplatte, Umdrehen |
| `StartView.swift` | Startseite |
| `CollectionView.swift` | Sammlung mit Menü beim langen Drücken |
| `AddView.swift` | Hinzufügen, Bearbeiten, Fototest, Ansicht nach dem Hinzufügen |
| `TextRecognizer.swift` | Apples Texterkennung und die Regeln, die daraus Lauf und Nummer machen |
| `AchievementsView.swift` | Erfolge |
