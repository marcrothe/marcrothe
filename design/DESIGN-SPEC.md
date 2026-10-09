# Design Spezifikation für die iPhone App

Ziel: die App sieht **genau** aus wie der Entwurf (`design/*.dc.html`, online https://claude.ai/artifact/7DQeT3dr8ngjfDXX2cXVDm).
Referenzbilder in `design/screens/` (iPhone Breite 390 pt, doppelte Auflösung).
Bei jedem Bildschirm: Simulator Screenshot neben das Referenzbild legen und angleichen.

Alle Werte stammen direkt aus dem CSS und SVG des Entwurfs.

## Grundlagen

| Was | Wert |
|---|---|
| Hintergrund | reines Schwarz #000000 |
| Akzent | #FF123E (aktiver Tab, Haken, Knopfschrift) |
| Grau für Nebentext | #8A8A99 (nur auf Schwarz, ab 12 pt) |
| dunkles Grau | #5A5A66 (leere Zustände), #3A3A44 (Linien, Punkte) |
| Flächen | #111114 mit 0.5 pt Rand weiß 8 Prozent, Radius 16 |
| Titel | HN Black Ext (Helvetica Neue LT Std Black Extended), 26 pt, Laufweite -0.01 em |
| Abschnittsüberschrift | HN Black Ext 18 pt, #8A8A99 |
| Text | Work Sans, Bedienelemente SF Pro (System) |
| Zeile unter Startnummern | 12 pt, halbfett, #8A8A99, mittig, Format „18.05.2025 \| 21,1 km“ |

## Glas (nur Bedienelemente, nie auf Inhalt, nie Glas auf Glas)

* Unter iOS 26 echtes Liquid Glass (`.glassEffect()`), für Tab Bar, Zahnrad, Sortierknopf, Menüs, Abbrechen und Fertig.
* Werte aus dem Entwurf als Anhalt: Hintergrund rgba(44, 44, 52, 0.62), Unschärfe 22, Sättigung 180 Prozent, Rand 0.5 pt weiß 18 Prozent.
* Tab Bar schwebend, 14 pt Abstand links und rechts, 24 pt unten, Kapselform, fünf gleich breite Felder. Aktiver Tab: Fläche weiß 13 Prozent, Symbol und Schrift #FF123E. Beim Scrollen nach unten schrumpft sie (Höhe 40 statt 52, Beschriftung weg).

## Startnummern

* Vorlagen als Bild: `ios/Startnummern/Startnummern.xcassets` (bib-kh-front, bib-cl-front, bib-dm-front, dazu die Rückseiten). Löcher sind transparent.
* Variable Texte werden in der App gesetzt, Positionen in Einheiten der 108 breiten Vorlage (siehe `BibView.swift`).
* Lange Nummern und Namen werden kleiner (feste Feldbreite). Nummern bleiben dabei mittig zwischen ihren Begrenzungen.
* Rückseite bei allen gleich: helles Papier #F2F2EE, Block mittig: Laufname HN Black Ext 4.6, Zeit HN Black Ext 19, „offizielle Zeit“ Work Sans 5.4 #8A8A99 (Einheiten). Favorit: Holo Stern oben.
* Ecken: Radius 1.6 Einheiten.

### Umdrehen
* Antippen dreht um die senkrechte Achse, 0.6 s, Kurve (0.3, 0.7, 0.2, 1), Perspektive 900.

### Favorit
* Hochziehen über 44 pt macht zum Favoriten (oder entfernt). Über der Karte erscheint ein Stern, beim Ziehen von 60 auf 110 Prozent wachsend:
  * Favorit setzen: Stern leer, ab der Schwelle weiß gefüllt.
  * Favorit entfernen: Stern voll, ab der Schwelle leer.
* **Holo Wisch** beim Setzen: Verlauf 115 Grad über die Karte, Farben siehe `Holo.sweep`, Mischmodus hard light, 1.15 s, Kurve (0.4, 0, 0.2, 1), läuft von rechts nach links und blendet aus.
* **Holo Rand**: 1 pt entlang der Papierkante, bunter Kegelverlauf, 50 Prozent. Der Verlauf dreht sich leicht mit dem Scrollen (nicht von selbst).
* Zeile darunter: zarte, fast weiße Holo Schrift (#E3F4FC, weiß, #ECE4FF, #DCFFF6), Verlauf verschiebt sich nur beim Scrollen. Davor ein kleiner Holo Stern (13 pt), der beim Setzen von 20 auf 100 Prozent wächst und sich von -90 Grad aufdreht (0.45 s, Kurve 0.3, 1.6, 0.5, 1), Text gleitet mit (0.4 s).

### Glanz
* Schräger Lichtstreifen, höchstens 10 Prozent Weiß, Richtung wie Vektor (64, 34) in Vorlagen Einheiten, Mitte 24 Einheiten links der Kartenmitte.
* **Fester Lichtwinkel:** liegt die Karte schräg (Stapel, Wischen, Wackeln), wird der Streifen um denselben Winkel zurückgedreht. Nicht vom Scrollen oder Hovern abhängig.
* Beim Wippen gleitet er im selben Takt von -54 auf +6 Einheiten (siehe Wippen).

## Langes Drücken

* Nach etwa 0.5 s: Karte gibt auf 95 Prozent nach, dann hebt sie sich auf 108 Prozent, Rest abgedunkelt (schwarz 42 Prozent) und unscharf (14).
* Glasmenü (in SwiftUI `contextMenu` mit Vorschau nutzen): Zu Favoriten oder Aus Favoriten entfernen, Umdrehen, Bearbeiten, Teilen, Sammlung bearbeiten, Abstand, Löschen in Rot #FF453A.
* **Wippen** der gehobenen Karte: um die senkrechte Achse von -7 auf +7 Grad, 1.8 s, Kurve (0.37, 0, 0.63, 1), hin und her ohne Stocken.
* Weiter gedrückt halten (etwa 0.9 s länger) oder „Sammlung bearbeiten“: **Wackelmodus** wie Home Bildschirm. Jede Karte dreht sich -1.2 bis +1.2 Grad, 0.15 bis 0.18 s, versetzt. Oben links an jeder Karte ein Glas Minus (26 pt). Beenden mit „Fertig“ oder Tipp daneben.
* Löschen zeigt unten eine Glas Meldung „Startnummer gelöscht“ mit „Rückgängig“ (4.5 s).

## Hinzufügen

* Formular wie „Neues Ereignis“, zuerst leer. Reihenfolge: Datum (Räder), Lauf des Tages, Strecke, Startnummer (Präfix erst ab erster Ziffer), Name (aus Profil), Zeit (h : mm : ss, über 59 rot).
* Oben klare Glasplatte mit vier Löchern, nichts darauf. Sie wippt wie oben. Kanten Verlauf weiß 42, 14, 30 Prozent; Glanz läuft über Kanten und Lochränder mit.
* Sobald Lauf und Strecke eine Vorlage haben: echte Startnummer (Breite 200), wippt ebenso. Beim Tippen der Zeit dreht sie auf die Rückseite.
* Knopf „Zur Sammlung hinzufügen“ erscheint erst, wenn alles Nötige da ist: dunkle Fläche weiß 8 Prozent, Schrift #FF123E.
* Animation danach (Referenz `08-nach-dem-hinzufuegen.png`):
  1. Liste und Knopf ziehen sich nach oben zusammen und verschwimmen (0.45 s).
  2. Die Vorschau Startnummer gleitet **ohne zu verschwinden** von ihrer Stelle in die Bildmitte und wird größer (Breite 280), 0.95 s, Kurve (0.2, 0.9, 0.25, 1.12). In SwiftUI mit `matchedGeometryEffect`.
  3. Holo Schein dahinter (Kegelverlauf, Unschärfe 46, 32 Prozent), 14 Funken fliegen heraus.
  4. Nach der Landung einmal auf die Rückseite und zurück.
  5. Darunter: Haken im roten Kreis (34 pt), „IN DEINER SAMMLUNG“, Lauf in HN Black Ext 22, Datum, Strecke, Zeit.
  6. „Zur Sammlung“ (dunkel, rote Schrift), „Noch eine hinzufügen“ (grau).

## Bearbeiten

* Dieselbe Ansicht, Titel „Bearbeiten“, Datum, Lauf und Strecke grau und fest, Zeile Favorit mit SF Symbol star oder star.fill (weiß), Knopf „Fertig“.

## Erfolge

* Raster wie Sammlung: Bestzeiten 5K, 10K, HALBMARATHON, MARATHON (graue Überschrift über jeder Karte), Startnummer Vorderseite, darunter „18:54 | Dresden“. Fehlend: leere Glasplatte und „noch offen“.
* Darunter drei Werte ohne Kästen: Startnummern, Wettkampf km, Städte (HN Black Ext 26, Beschriftung 12 grau).

## Bewegung reduzieren

Bei „Bewegung reduzieren“ alle Wipp, Wackel, Wisch und Flug Animationen aus.
