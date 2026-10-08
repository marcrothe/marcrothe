# Startnummern nachbauen: Regeln

Gesammelt aus den Runden für Dresden Marathon 2024, Kulturhauptstadt Halbmarathon 2025 und Citylauf Dresden 2025. Vor jeder neuen Startnummer lesen.

## Ablauf
1. Foto prüfen. Ist es schief oder unscharf, zuerst um ein gerades Foto bitten (eins von jemand anderem reicht für das Design).
2. Das Foto Stück für Stück zerlegen und kurz aufschreiben, bevor gebaut wird:
   Bänder und Flächen, Verläufe, Linien und Kanten, Schriften mit Farbe und Größe, Punkte und Symbole, Lage der Löcher, Bereich mit Sponsoren.
3. Erst im Plaketten Studio zeigen (auf Weiß und auf Schwarz), dann ins Dashboard übernehmen.
4. Immer Marcs eigene Daten verwenden: Name, Nummer, Datum, Lauf und Distanz von seiner Startnummer, nie die vom Beispielfoto.
5. Ergebnis aus Strava holen. Die offizielle Zeit steht oft im Titel des Laufs (z. B. "Citylauf Dresden 18:54"), die Uhrzeit des Laufs kann abweichen. Bei Zweifel nachfragen.

## Form
- Kein Sticker, sondern eine Papierkarte: kein Stanzrand, vier gestanzte Löcher in den Ecken.
- Die Variante "Nachbau" verwenden: flach, ohne Papierstruktur und ohne Neigung. Die realistische Variante wurde verworfen.
- Antippen dreht die Karte um. Auf der Wand in der Mitte packen und verschieben.

## Design
- Layout, Farben und Verläufe so genau wie möglich wie im Original, auch die Lage kleiner Elemente (z. B. grüner Punkt rechts unten im gelben Feld).
- Flächen sauber aneinander: keine weißen Spalten zwischen einem Band und einer Linie.
- Linien, die das Original hat, übernehmen (z. B. schwarzer Strich oben und unten am Hauptfeld).
- Name und Nummer per Fit Funktion skalieren, damit sie nie in andere Elemente laufen.
- Auf Startnummern bleibt "KM" stehen, der Umbau von km zu k gilt dort nicht.
- Schriften: Barlow Condensed für schmale Schriften, Work Sans sonst. In SVG die Schrift mit !important setzen.

## Logos und Sponsoren
- Veranstalter Logo nur, wenn es sich sauber übernehmen lässt (Hintergrund wirklich transparent, sonst sieht man ein weißes Kästchen). Sonst den Namen als Schrift setzen, in den Farben des Logos (Citylauf: "CITYLAUF" schwarz, "DRESDEN" gelb).
- Sponsoren nie andeuten, keine grauen Kästchen oder Balken als Logo Ersatz.
- Stattdessen ruhige Elemente, zum Beispiel drei Paare feiner grauer Striche gleichmäßig zwischen den unteren Löchern, oder eine kurze passende Textzeile.
- Keine Angabe doppeln: steht das Datum schon oben, kommt es unten nicht noch einmal.

## Rückseite
- Hintergrund #f2f2ee, oben "Ergebnis", groß die Zeit, darunter "Distanz | Datum", darunter grau "Nr. … | Lauf".

## Dashboard und Studio
- Neue Karte in BIBS in dashboard.html eintragen (type wählt den Nachbau, z. B. 'kh' oder 'city').
- Startplatz auf der Wand unten, mehrere Karten versetzt. Am Handy kleinere Breite, Karten bleiben ganz auf der Wand.
- Im Studio die Karte auf Weiß und auf Schwarz zeigen.
