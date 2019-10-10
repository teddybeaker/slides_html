# slides_html
Präsentation über HTML

Autorin: Stefani Gerber

## Ziel
-   was muss man über HTML wissen?
-   low-hanging fruits
    -   wie vermeidet man viel Arbeit, wenn man von Anfang an das richtige Markup verwendet
    -   was sehe ich oft falsch gemacht

Publikum: Backendentwickler

## Präsentation - technisch
Diese Präsentation funktioniert mit [reveal-md](https://github.com/webpro/reveal-md) (einer Markdown-Erweiterung von [reveal.js](https://github.com/hakimel/reveal.js/)).

### reveal-md installieren
_npm install -g reveal-md_

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
`reveal-md slides.md --print slides.pdf`

### Theming
-   `reveal.js` selber ausgecheckt und eigenes Theme (basierend auf `dark`) erstellt mit den Farben von Bluesky > `theme/bluesky-dark.css`

### Styling
-   siehe `css/bluesky-it.css`


## Präsentation - organisatorisch

### Checkliste Vorbereitung
-   Weiternavigierungsdings
-   Adapter
-   Shortcuts auf Spickzettel

### Checkliste vor dem Talk
-   Wasser
-   Little Snitch abgestellt
-   Clipboard-History geleert
-   Lautsprecher gemuted
-   Browser -> Chrome
    -   pinned tabs geschlossen
    -   Bookmark-Bar ausgeblendet
    -   Zoom in den Dev Tools ist einfach machbar (Keyboard auf Englisch wechseln, `command` + `+`)
    -   Präsentation Fullscreen
    -   Bildschirm-Wechsel zwischen Autorenansicht und Präsentation ist eingeübt
-   Genügend Strom
-   Leinwand
    -   funktioniert
    -   Helligkeit
    -   Schriftgrösse


## Probeläufe
_Bereich abgeschlossen nach total X Minuten_


### Timing 28.3.2019
-   Einführung und Grundlagen: 12min
-   Weird Things: 25min
-   Eigenimplementationen: 30min
-   Tolle Beispiele: 38min

### Timing 3.10.2019
-   Weird Things: 25min
-   Tolle Beispiele: 54min

### Timing 4.10.2019
-   Einleitung: 7min
-   Begriffe: 18min
-   Antipattern: ?
-   Eigenimplementationen: Antipattern +6min
-   Tolle Beispiele: Antipattern +17min

### Timing 9.10.2019
-   Einleitung: 6:30min
-   Begriffe: 18min
-   Antipattern: 28:30min
-   Eigenimplementationen: 35:30
-   Tolle Beispiele: 46:30

### Fragen an Eve / JC
-   worauf achten
    -   roter Faden erkennbar?
    -   fehlen Illustrationen?

-   Agenda
    -   allgemein bessere Bezeichnungen?
    -   `Wichtige Begriffe` -> `Grundlagen`? Oder ist das abwertend?

#### Feedback
-   Dauer: 42:30
-   Wichtige Begriffe
    -   abstrakt und konktret gemischt
        -   Barrierefreiheit -> nach Preis von schlechtem HTML (kann auch schon auf der Folie stehen)
        -   Block vs Inline -> integrieren in "Tags" oder verschieben in "Antipatterns"
    -   Mnimal HTML -> `lang="de"`
    -   Events: nicht `blur` verwenden oder im Zusammenhang mit `focus` (Alternativen: `click`)
-   Antipattern
    -   allgemein: erwähnen, wieso nicht so machen (auch wenn bei "Preis von schlechtem Markup" schon erwähnt)
        -   assistive Technologien
        -   SEO
        -   automatisierung
-   Eigententwicklung
    -   Titel korrekt trennen oder kleiner machen
    -   Aufbau schürt die Erwartung auf mehr Tipps
    -   Folie zu Webcomponents zuerst
-   Tolle Beispiele
    -   Input Types -> `range` in CodeSample aufnehmen; Beispiele grösser machen
-   Präsentation allgemein
    -   Links sind schlecht lesbar, Kontrast zu tief (besonders wenn Licht blendet) -> Hintergrund heller?
    -   DevTools wieder schliessen (lenken ab)
    -   Zoom vorher einstellen (auch Keyboard-Wechsel)
    -   Links nur klicken, nicht rechts-klick
    -   `ctrl` + `tab` um innerhalb einer Applikation zwischen den Tabs zu wechseln

## TODO
-   Punkte aus Feedback umsetzen
-   Finde ich Alternativen, in den DevTools zu zoomen? Gestures auf Trackpad

## Call for Paper

### Titel

Markup-Tipps für Backender


### Bio

Ich bin seit 14 Jahren in der Entwicklung tätig, hauptsächlich im Bereich Frontend. Ich habe den klassischen Werdegang von statischem HTML über jQuery-gesteuerte Webseiten hin zu Single-Page-Applications (hauptsächlich Angular). Wenn nötig wage ich mich an Backend-Entwicklungen, z.B. in Python oder Java.

Ich arbeite bei Bluesky IT-Solutions in Basel, vorwiegend in der Frontend-Entwicklung. Des Weiteren bin ich Co-Organizer des Angular Meetup Basel.

### Abstract

Immer mehr Leute, die nicht direkt aus der Webentwicklung kommen, entwickeln Single Page Applications (SPAs). HTML ist eine vielseitige Markup-Sprache, die sich in den Jahren ihrer Existenz stark entwickelt hat und viel mächtiger geworden ist. Dennoch haben nicht alle Zeit und Motivation die ganzen Spezifikationen und Dokumentation zu lesen. Und so kommt es, dass ich immer wieder auf Beispiele stosse, die mir Tränen in die Augen treiben und zu vermeidbaren Problemen führen.

Was ist wichtig zu wissen über HTML? Was macht die Entwicklung einfacher und das resultierende Produkt stabiler? In meinem Vortrag gebe ich euch wichtige Inputs dazu, die ganz nebenbei auch der Benutzbarkeit, Wartbarkeit und Erweiterbarkeit des Produkts dienen. Des Weiteren stelle ich euch ein paar weniger bekannte HTML5-Elemente vor, deren Verwendung die eine oder andere Thirdparty Library ersetzen kann.


#### Entwurf 2 - Eve

Immer mehr Leute, die nicht direkt aus der Webentwicklung herkommen, entwickeln - manchmal auch notgedrungen - Single Page Applications (SPAs). HTML ist eine vielseitige Markup-Sprache, die sich in den Jahren ihrer Existenz stark entwickelt hat und viel mächtiger geworden ist. Dennoch haben nicht alle Zeit und Motivation die ganzen Spezifikationen und Dokumentation einer Sprache zu lesen. Und so kommt es dazu, dass ich immer wieder auf Beispiele stosse, die mir Tränen in die Augen treiben und schlichtweg zu Problemen führen.

In meinem Vortrag gebe ich euch wichtige Inputs, die das Entwickeln einfacher machen und ganz nebenbei der Benutzbarkeit, Wartbarkeit und Erweiterbarkeit der SPA dienen. Desweiteren stelle ich euch ein paar weniger bekannte HTML-Elemente vor, deren Verwendung die eine oder andere Thirdparty Library ersetzen kann.

#### Entwurf 2.1 Eve provokativ

"HTML kann doch jedes Kind!” Wieso treffe ich dennoch immer wieder auf Beispiele in Single Page Applications (SPAs) die mir Tränen in die Augen treiben? HTML ist eine vielseitige Markup-Sprache, die sich in den Jahren ihrer Existenz stark entwickelt hat. Mit ein bisschen fundiertem Wissen könnte man ein paar Fehler in Punkto Benutzbarkeit, Wartbarkeit und Erweiterbarkeit vermeiden. Gerade wenn man nicht direkt aus der Webentwicklung herkommt.  

In meinem Vortrag gebe ich euch wichtige Inputs, die das Entwickeln einfacher machen und ganz nebenbei der Stabilität der SPA dienen. Desweiteren stelle ich euch ein paar weniger bekannte HTML-Elemente vor, deren Verwendung die eine oder andere Thirdparty Library ersetzen kann.

#### Entwurf 1

Single Page Applications (SPAs) ermöglichen neue Entwicklungsmöglichkeiten. Sie basieren immer noch auf HTML, einer Technologie mit einer langen Geschichte.

Ich sehe immer mehr Leute SPAs entwickeln, deren Hintergrund nicht in der Webentwickung ist. Was ist wichtig zu wissen über HTML? Was macht die Entwicklung einfacher und das resultierende Produkt stabiler? Auf diese Fragen werde ich in diesem Vortrag eingehen.


### Feedback
#### Kritik
-   zu langweilig
-   HTML kommt niemand schauen, weil alle denken, dass sie HTML schon können

#### Vorschläge
-   HTML -> HTLM5
-   Bezug auf SPAs
-   Titel _Frontend-Tipps für Backender_

#### meine Entscheide
-   will HTML nicht nach HTML5 umbenennen, weil ich nicht spezifisch auf die neusten Features eingehe sondern generell über HTML rede. Auch gibt es HTML5 schon seit 2014, ist also nicht neu und hip
-   will nicht _Frontend-Tipps_ im Titel, beziehe mich nur auf Markup, nicht auf CSS, JS, Performance, Browser-compliance, Barrierefreiheit, etc.
