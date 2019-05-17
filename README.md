# slides_html
Presentation on HTML

Author: Stefani Gerber

## Install reveal-md:
_npm install -g reveal-md_

## Show slides:
-   `reveal-md slides.md`
-   for author's view press `s` (in browser window)
-   press `esc` for overview
-   zoom using alt (option on mac) + click
-   pause using `b` or `.`

## Write slides:
-   using markdown (see <https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet> for help)
-   separate slides using dashes
    - 3 dashes `---` to start a new column (i.e. place the next slide to the right of the previous one)
    - 4 dashes `----` to separate in same column (i.e. place the next slide below the previous one)

## Export slides:
`reveal-md slides.md --print slides.pdf`


## Timing 28.3.2019
_Bereich abgeschlossen nach total X Minuten_


- Einführung und Grundlagen: 12min
- Weird Things: 25min
- Eigenimplementationen: 30min
- Tolle Beispiele: 38min

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
- zu langweilig
- HTML kommt niemand schauen, weil alle denken, dass sie HTML schon können

#### Vorschläge
- HTML -> HTLM5
- Bezug auf SPAs
- Titel _Frontend-Tipps für Backender_

#### meine Entscheide
- will HTML nicht nach HTML5 umbenennen, weil ich nicht spezifisch auf die neusten Features eingehe sondern generell über HTML rede. Auch gibt es HTML5 schon seit 2014, ist also nicht neu und hip
- will nicht _Frontend-Tipps_ im Titel, beziehe mich nur auf Markup, nicht auf CSS, JS, Performance, Browser-compliance, Barrierefreiheit, etc.
