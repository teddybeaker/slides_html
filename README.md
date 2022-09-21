# slides_html
Präsentation über semantisches HTML

Autorin: Stefani Gerber

## Ziel
-   was muss man über HTML wissen?
-   low-hanging fruits
    -   wie vermeidet man viel Arbeit, wenn man von Anfang an das richtige Markup verwendet
    -   was sehe ich oft falsch gemacht

Publikum: Softwareentwickler:innen

## Präsentation - technisch
Diese Präsentation funktioniert mit [reveal-md](https://github.com/webpro/reveal-md) (einer Markdown-Erweiterung von [reveal.js](https://github.com/hakimel/reveal.js/)).

### reveal-md installieren
_npm install -g reveal-md_
optional; ansonsten Präsentation mit `npx` ausführen

### Präsentieren
-   `reveal-md slides.md`
-   Autorenansicht: `s` (im Präsentationsfenster im Browser)
-   Übersicht: `esc`
-   Zoom: `alt` (`option` on mac) + `click`
-   Pause: `b` or `.`

### Folien erstellen
-   mit markdown (siehe <https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet>)
-   Folien separieren mit Bindestrichen
    -   `reveal.js` ordnet Folien in einer Matrix an
    -   3 Bindestriche `---` um eine neue Spalte zu starten (d.h. um die Folie rechts neben der vorherigen zu platzieren)
    -   4 Bindestriche `----` um eine neue Folie in der selben Spalte anzulegen (d.h. um die neue Folie unterhalb der vorherigen zu platzieren)
-   Speaker-Notes mit `Note:` auf den Folien einbinden -> sind in der Autorenansicht sichtbar

### Folien exportieren

#### Als PDF
`reveal-md slides.md --print slides.pdf`
Falls nur eine Seite gedruckt wird in `slides.md` die theme-Deklaration entfernen.

#### Als HTML
`sh export.sh`
