# HTML: das Wichtigste für Nicht-Frontender

Stefani Gerber, 17. Oktober 2019 BaselOne

<!-- Ziel
  - was muss man über HTML wissen?
  - low-hanging fruits
    - wie vermeidet man viel Arbeit, wenn man von Anfang an das richtige Markup verwendet
  - was sehe ich oft falsch gemacht

  Publikum: Backendentwickler
  Titelvorschläge:
  - HTML, das Wichtigste für Nicht-Frontender
-->

<!-- Checkliste vor dem Talk
  - Little Snitch abgestellt
  - Genügend Strom
  - Leinwand
    - funktioniert
    - Helligkeit
    - Schriftgrösse
-->

<!-- TODO
  - Style Slides
  - welchen Browser verwenden?
  - Beispiele: Inline, Wechsel in Tabs, Wechsel in total anderes Fenster? Links in Slides, falls ich ein fixes Set an Tabs öffnen kann?
-->

----

## Einleitung

----

### Agenda

- Einleitung
- Grundlagen
- Antipatterns
- Eigenimplementationen
- Tolle Beispiele

----

### Über mich

Stefani Gerber

Frontend Engineer bei Bluesky IT-Solutions in Basel

Note:
- 14 Jahre Entwicklung, hauptsächlich Frontend

----

### Don't do weird things

Note:
- Habe lange Tai Chi gemacht
- Kung Fu in Zeitlupe
- Unterschiedliche Bewegungen, die gleich lang dauern sollen
- sah beim Lehrer immer einfach aus
- wenn wir uns abkämpften, sagte er manchmal _don't do weird things_
- Satz ist geblieben, denke ihn oft, wenn ich seltsames HTML sehe

----

### Der Preis von schlechtem HTML

- fehleranfälliger
- schwieriger zu stylen
- erschwertes Verständnis für andere Entwickler
- erschwert automatisiertes Testing

Note:
- Hack -> Fix für den Hack in Browser X -> Fix für den Fix für den Hack...

----

### Spezifikation

<!-- TODO add image of multiple standards XKCD -->

- W3C: <https://www.w3.org/TR/html52/>
- WhatWG: <https://html.spec.whatwg.org>

Note:
> This specification should be read like all other specifications. First, it should be read cover-to-cover, multiple times. Then, it should be read backwards at least once. Then it should be read by picking random sections from the contents list and following all the cross-references.
- habe ein bisschen Angst, dass sie es ernst meinen
- Hier ein paar Punkte, von jemandem, der sie wenigstens einmal cover-to-cover gelesen hat.

---

## Grundlagen

Note:
- um sicherzustellen, dass wir vom selben reden

----

### Minimal HTML

```
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>valides HTML Dokument</title>
  </head>
  <body>

  </body>
</html>
```

Note:
- DOCTYPE für Version, HTML5 wenn immer möglich
- language -> hilft Browsern, beim übersetzen und Screenreadern beim vorlesen
- charset: erstes Element in head wegen parsen des Dokuments
- Titel nicht leer (Body darf lustigerweise schon leer sein TODO wieso?)

----

### HTML vs DOM

- HTML: Markup Sprache um DOM darzustellen
- DOM: Dokumentenmodell mit zugehörigem API

Note:
- In Browser zeigen (view source, DevTools)
  - Tag, möglichst sprechender Name (früher möglichst kurz, z.B. a=anchor)
- property (HTML) vs attribute (DOM)
- DOM kann sich ändern, ohne dass es in HTML reflektiert wird

----

### Tags

- Elemente in HTML
- z.T. eigenständig, z.T. in Kontext

Note:
- Dokumentation zeigen, z.B. <input>, das nur im Form Sinn macht

----

### Events

- werden im DOM gefeuert
- bubblen
- einige haben Default-Verhalten

Note:
TODO
- Beispielabfolge
- gibt es bei Formularen noch was anderes als reset und submit? Z.B. Files im Hintergrund hochladen? -> Non-standard https://developer.mozilla.org/en-US/docs/Web/Events
- https://eloquentjavascript.net/15_event.html
- https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener

----

### Barrierefreiheit

<!-- TODO Definition suchen -->
>  kann von allen genutzt und wahrgenommen werden

assistive Technologien

Note:
- auf Englisch Accessiblity
- soll kein Vortrag über Barrierefreiheit werden
- assistive Technologien helfen, die entsprechende Hürde zu überbrücken
  - Screenreader für Sehbehinderte oder Analphabeten
  - Joystick für motorisch behinderte Menschen
- parsen von Webseiten
- viel kommt schon von selber mit, wenn man das HTML richtig braucht
- Tipp von ARIA, ARIA möglichst nicht zu verwenden (TODO raussuchen)

----

### block vs inline

<!-- TODO
  - Beispiel zeigen, grafisch
  - zeigen, wie man in Doku nachschaut
  - TODO evtl. mit div/span zusammenziehen? -->
relevant beim Verschachteln von Elementen

Note:
- betrifft Darstellung und somit ausserhalb des Scopes von diesem Talk
- trotzdem erwähnt, weil es später beim stylen viel Mühe spart, wenn im Markup schon sinnvoll gewählt

---

## Antipatterns

Allgemein: das verwenden der falschen Elemente

-> sematisches HTML

> Semantic HTML or semantic markup is HTML that introduces meaning to the web page rather than just presentation.

Source: <https://www.lifewire.com/why-use-semantic-html-3468271>

Note:
- das verwenden von den falschen Elementen (es gibt andere / bessere)
- das falsche verwenden von Elementen (den Zweck des benutzten Elements entfremden)

----

### Buttons und Links

<!-- TODO bessere Defintion finden, was die Elemente können -->
Klickt man, und dann passiert etwas
- Link: springt auf eine andere Seite
- Button: löst eine Aktion aus

Note:
- nicht vermischen
  - wenn was wohin leiten soll, dann soll es auch wie ein Link aussehen und nicht wie ein Button
  - Erwartungen der Benutzer
- Link kann auch was anderes enthalten als Text, z.B. ein Bild.

----

#### Weird buttons

```
<!-- falsch -->
<button onclick="location.href='http://baselone.ch'">
  ich wäre besser ein Link
</button>

<!-- richtig -->
<a href="http://baselone.ch">richtig so</a>
<a href="http://baselone.ch"><img src="logo.svg"></a>
```

<!-- TODO einen Weg finden, um falsches durchzustreichen -->

Note:
- Zusatzinformationen gehen verloren
  - siehe z.B. Linkvorschau links unten im Browser
- Unklar für assistive Technologien

----

#### Weird links

```
<!-- falsch -->
<a href="" id="buttonImpersonator">ich wäre besser ein Button</a>
<script>
  document.querySelector('#buttonImpersonator')
    .addEventListener('click', // hier wird die Aktion ausgeführt);
</script>
```

Note:
- habe ich in letzter Zeit weniger gesehen, war aber eine zeitlang recht angesagt

----

### Focus

- Buttons, links
- Form-Elemente
- alles mit keyindex!=-1

Note:
- alle Elemente, mit denen der Benutzer interagieren können soll, müssen erreichbar sein
- nicht grafisch ausblenden

----

### div, span

> The div element has *no special meaning at all*. It represents its children. It can be used with the _class_, _lang_, and _title_ attributes to mark up semantics common to a group of consecutive elements.

> Authors are strongly encouraged to view the div element as an element of last resort, for when no other element is suitable.

Note:
- Authors are strongly encouraged to view the div element as an element of last resort, for when no other element is suitable. Use of more appropriate elements instead of the div element leads to better accessibility for readers and easier maintainability for authors.

----

#### Weird divs

```
  <div onclick="tueIrgendwas()">Inhalt</div>
```

Note:
- ok, als Wrapper für Styling

----

#### Weird forms

```
  <div>
    <input type="text" />
    <button onclick="sendTheFormSomehow()">Send</button>
  </div>
```

Note:
- kein form-Tag
- was, wenn der User nicht klicken kann? -> submit Event verwenden
- geht auch für JS-Lösungen

---

## Eigenimplementationen

wenn es das Element nicht gibt, das man braucht

Note:
- verschiedene Gründe, wieso
  - existiert nicht
  - funktioniert nicht wie man es möchte
  - sieht nicht aus wie gewollt

----

### Demo

Note:
- Select kann
  - Fokus
  - Bedient mit Maus
    - öffnen
    - Option anklicken
    - schliessen (wegklicken)
  - Tastatur
    - Space-Taste
    - Navigieren mit Cursor
    - Textsuche
    - Auswahl mit Space oder Enter
- Shadow DOM zeigen, TODO rausfinden, wie ich Styles manipulieren kann

----

### aber ...

> ... select sieht Sch* aus und passt nicht in unser Design

<!-- TODO finde bessere Formulierung als Tradeoff -->
Tradeoff
- Jedesmal, wenn wir so ein Element nachbauen, müssen alle diese Features stimmen.
- in allen Browsern
- Performance-Einbusse

Note:
- Ist in der Spez seit (TODO nachschauen)
- Ländereingabe -> Switzerland -> Kann nicht tippen *aaaaah*


----

### Beispiel

<https://material.angular.io/components/select/overview>

Note:
- Angular Material gewählt, weil ich viel damit zu tun habe
- eigenes Markup
- offenes Dropdown in CDK-Layer, ganz unten in DOM

----

### WebComponents / Custom Elements

- vorhin gesehen in Angular DEMO

<!-- TODO richtige Terminologie finden -->

---

## Tolle Beispiele


----

### HTML5 Inputs

- neue Typen
- spezielle Keyboard-Unterstütung (z.B. für Zahlen)
- Vorvalidierung

----

### Details

Note:
- all die jQuery-Accordeon

----

### Dialog

Note:
- wichtig, wie der Fokus gehandhabt wird

----

### Data-list

Note:
- unterstützt den Benutzer bei der Eingabe
- kein Ersatz für Select, da es nicht enforcen kann, dass einer der ausgewählten Werte gewählt wird

----

### Picture Element

Note:
- entstanden aus Polyfill
----

### Word Break Opportunities

Note:
- vermisst von LateX her
- &shy; viel schöner
- bleibt die Frage, wie Autoren dies gut eingeben können
---

## Links

- DevTips <https://umaar.com/dev-tips/>
- MDN <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details>
- w3Schools <https://www.w3schools.com/tags/tag_details.asp>
- can I use <https://caniuse.com>
- Spec <https://www.w3.org/TR/html52/>, <https://html.spec.whatwg.org>

Note:
- wie verwendet
- welche Attribute
- Browser Support
