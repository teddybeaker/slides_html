---
title: Markup-Tipps für Backender
theme: theme/bluesky-dark.css
css: css/font-awesome.min.css,css/bluesky-it.css
---
<base target="_blank">

<!-- .slide: data-background="./images/background.jpg" -->
<!-- .slide: class="slide-title" -->
# Markup-Tipps für Backender

Stefani Gerber, 17. Oktober 2019 BaselOne

<!-- Ziel
  - was muss man über HTML wissen?
  - low-hanging fruits
    - wie vermeidet man viel Arbeit, wenn man von Anfang an das richtige Markup verwendet
  - was sehe ich oft falsch gemacht

  Publikum: Backendentwickler
-->

<!-- Checkliste vor dem Talk
  - Little Snitch abgestellt
  - Clipboard-History geleert
  - Browser: pinned tabs geschlossen
  - Genügend Strom
  - Leinwand
    - funktioniert
    - Helligkeit
    - Schriftgrösse
-->

----

### Agenda ☑️

- Einleitung
- Wichtige Begriffe
- Antipatterns
- Eigenimplementationen
- Tolle Beispiele

----

### Über mich

Stefani Gerber

Frontend Engineer bei Bluesky IT-Solutions in Basel

Note:
- 14 Jahre Entwicklung, hauptsächlich Frontend
- mache etwas Backend (SpringBoot)
- sehe viele Entwicklerinnen in der umgekehrten Rolle
- > Aus großer Kraft folgt grosse Verantwortung.

----

> Don't do weird things
> <br>
> -- <cite>John Lash</cite>

Note:
- Habe lange Tai Chi gemacht
- Kung Fu in Zeitlupe
- Unterschiedliche Bewegungen, die gleich lang dauern sollen
- sah beim Lehrer immer einfach aus
- wenn wir uns abkämpften, sagte er manchmal _don't do weird things_
- Satz ist geblieben, denke ihn oft, wenn ich seltsames HTML sehe

----

### Der Preis von schlechtem HTML

- fehleranfällig
- schwierig zu stylen
- schlecht verständlich für andere Entwickler
- erschwert automatisiertes Testing

Note:
- Hack -> Fix für den Hack in Browser X -> Fix für den Fix für den Hack...

----

### Spezifikation

- W3C: <https://www.w3.org/TR/html52/>
- WhatWG: <https://html.spec.whatwg.org>

Note:
> This specification should be read like all other specifications. First, it should be read cover-to-cover, multiple times. Then, it should be read backwards at least once. Then it should be read by picking random sections from the contents list and following all the cross-references.
- habe ein bisschen Angst, dass sie es ernst meinen
- Hier ein paar Punkte, von jemandem, der sie wenigstens einmal cover-to-cover gelesen hat.

---

## Wichtige Begriffe 💡

Note:
- um sicherzustellen, dass wir vom selben reden

----

### HTML vs DOM

- *HTML*: Markup Sprache um DOM darzustellen
- *DOM*: Dokumentenmodell mit zugehörigem API

Note:
- In Browser zeigen (view source, DevTools)
  - Tag, möglichst sprechender Name (früher möglichst kurz, z.B. a=anchor)
- property (HTML) vs attribute (DOM)
- DOM kann sich ändern, ohne dass es in HTML reflektiert wird

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
- Titel nicht leer
- Body darf leer sein (weil evtl. per JS gefüllt?)

----

### Tags

- Elemente in HTML
- eigenständig versus in Kontext [&lt;option&gt;](https://www.w3.org/TR/html52/sec-forms.html#the-option-element)

Note:
- Dokumentation zeigen, z.B. <input>, das nur im Form Sinn macht

----

### Events

- werden im DOM gefeuert
- bubblen
- einige haben Default-Verhalten

Note:
- bubblen von Kind zu Parent
- Default-Verhalten: z.B. für Accessibility, oder submit oder click auf einem Button in einem Form
- Beispielabfolge (keydown, keypress, keyup)
- gibt es bei Formularen noch was anderes als reset und submit?  Z.B. Files im Hintergrund hochladen? Jein, gibt es beim File API <https://developer.mozilla.org/en-US/docs/Web/API/File/Using_files_from_web_applications>
- https://eloquentjavascript.net/15_event.html
- https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener
- https://developer.mozilla.org/en-US/docs/Web/Events#Keyboard_events
- https://developer.mozilla.org/en-US/docs/Web/Events#Form_events

----

### Barrierefreiheit

- kann von allen genutzt und wahrgenommen werden
- mithilfe von assistiven Technologien

Note:
- auf Englisch Accessiblity
- soll kein Vortrag über Barrierefreiheit werden
- assistive Technologien helfen, die entsprechende Hürde zu überbrücken
  - Screenreader für Sehbehinderte oder Analphabeten
  - Joystick für motorisch behinderte Menschen
- parsen von Webseiten
- viel kommt schon von selber mit, wenn man das HTML richtig braucht
- Tipp von ARIA, ARIA möglichst nicht zu verwenden (TODO raussuchen)

Prinzipen
- wahrnehmbar
- bedienbar
- verständlich
- robust

----
<!-- .slide: class="block-vs-inline" -->
### block vs inline
relevant beim Verschachteln von Elementen

<div class="wrapper fragment">
  <div class="block">block</div>
  <span class="inline">inline<span>
  <div class="block">block</div>
</div>

Note:
- betrifft Darstellung und somit ausserhalb des Scopes von diesem Talk
- trotzdem erwähnt, weil es später beim stylen viel Mühe spart, wenn im Markup schon sinnvoll gewählt
- mdn inline-elements

---

## Antipatterns 😡

Note:
- das verwenden von den falschen Elementen (es gibt andere / bessere)
- das falsche verwenden von Elementen (den Zweck des benutzten Elements entfremden)

----

### Semantisches HTML

> Semantic HTML or semantic markup is HTML that introduces meaning to the web page rather than just presentation.

Quelle: <https://www.lifewire.com/why-use-semantic-html-3468271>

----
<!-- .slide: class="slide-buttons-vs-links" -->

### Buttons vs Links

Klickt man, und dann passiert etwas
-  <a href="#/2/1">link</a>: springt auf eine andere Seite
- <button type="button" onclick="alert('Hallo Welt');">button</button>: löst eine Aktion aus

Note:
- nicht vermischen
  - wenn was wohin leiten soll, dann soll es auch wie ein Link aussehen und nicht wie ein Button
  - Erwartungen der Benutzer
- Link kann auch was anderes enthalten als Text, z.B. ein Bild.

----

#### Weird buttons

```
<!-- falsch 👿 -->
<button onclick="location.href='http://baselone.ch'">
  ich wäre besser ein Link
</button>

<!-- richtig 👼 -->
<a href="http://baselone.ch">richtig so</a>
<a href="http://baselone.ch"><img src="logo.svg"></a>
```
<button class="hidden-unless-questioned" onclick="location.href='http://baselone.ch'">
  ich wäre besser ein Link
</button>

Note:
- Zusatzinformationen gehen verloren
  - siehe z.B. Linkvorschau links unten im Browser
- Unklar für assistive Technologien

----

#### Weird links

```
<!-- falsch 👿 -->
<a href="" onclick="/*Aktion*/">ich wäre besser ein Button</a>

<!-- richtig 👼 -->
<button id="some-action">richtig so</button>
<script>
  document.querySelector('#some-action')
    .addEventListener('click', () => { /* Action */ } );
</script>
```
<form class="hidden-unless-questioned" action="index.html" method="post">
  <a href="" onclick="event.preventDefault();document.querySelector('.formToSubmit').submit();">ich wäre besser ein Button</a>
</form>

Note:
- habe ich in letzter Zeit weniger gesehen, war aber eine zeitlang recht angesagt

----
<!-- .slide: class="slide-focus" -->

### Focus

- <button>Button</button>, <a href="https://baselone.ch">link</a>
- Form-Elemente <input placeholder="Name"> <select><option>1</option><option>2</option></select>
- alles mit keyindex!=-1

Note:
- alle Elemente, mit denen der Benutzer interagieren können soll, müssen erreichbar sein
- nicht grafisch ausblenden
- FF https://stackoverflow.com/questions/11704828/how-to-allow-keyboard-focus-of-links-in-firefox

----

### div, span

> The div element has *no special meaning at all*.

Quelle: https://www.w3.org/TR/html52/grouping-content.html#the-div-element

Note:
- It represents its children. It can be used with the _class_, _lang_, and _title_ attributes to mark up semantics common to a group of consecutive elements.
- Authors are strongly encouraged to view the div element as an element of last resort, for when no other element is suitable. Use of more appropriate elements instead of the div element leads to better accessibility for readers and easier maintainability for authors.

----

#### Weird divs

```
  <!-- falsch 👿 -->
  <div onclick="tueIrgendwas()">Inhalt</div>
```

Note:
- ok, als Wrapper für Styling

----

#### Weird forms
<!-- .slide: class="slide-weird-forms" -->

```
  <!-- falsch 👿 -->
  <div>
    <input type="text" />
    <button onclick="sendTheFormSomehow()">Send</button>
  </div>

  <!-- richtig 👼 -->
  <form onsubmit="sendTheFormSomehow()">
    <input type="text" />
    <button type="submit">Send</button>
  </form>
```
<div class="hidden-unless-questioned">
  <form action="/action_page.php" method="get">
    <input type="text" />
    <button type="submit">Send</button>
  </form>
  <form onsubmit="sendTheFormSomehow()">
    <input type="text" />
    <button type="submit">Send</button>
  </form>
</div>

Note:
- kein form-Tag
- was, wenn der User nicht klicken kann? -> submit Event verwenden
- geht auch für JS-Lösungen

---

## Eigenimplementationen 👷‍♀️

wenn es das Element nicht gibt, das man braucht

Note:
- verschiedene Gründe, wieso
  - existiert nicht
  - funktioniert nicht wie man es möchte
  - sieht nicht aus wie gewollt
- analysieren wir mal, was die Kosten für ein reines Styling sind

----
<!-- .slide: class="slide-select" -->

#### Analyse existierendes HTML Element

<select>
  <option>1</option>
    <option>2</option>
  <optgroup label="zwanziger">
    <option>21</option>
    <option>22</option>
  </optgroup>
  <optgroup label="Rest">
    <option>42</option>
  </optgroup>
</select>

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
    - Auswahl mit Space? oder Enter

----

#### Beispiel

<https://material.angular.io/components/select/overview>

Note:
- Angular Material gewählt, weil ich viel damit zu tun habe
- eigenes Markup
- offenes Dropdown in CDK-Layer, ganz unten in DOM

----

#### Fazit

- Jedesmal, wenn wir so ein Element nachbauen, müssen alle diese Features stimmen.
- in allen Browsern
- Performance-Einbusse

Note:
- Ist in der Spez mindestens seit HTML 2.0 1995, denke eher seit HTML 1.0, aber konnte ich nicht finden
- Ländereingabe -> Switzerland -> Kann nicht tippen *aaaaah*

----

### WebComponents
- Standard
- wiederverwendbar

Note:
- bzw. Set von Standards
- wiederverwendbar im Sinn von mit anderen Technologien als mit der Ersteller

---

## Tolle Beispiele 🥰


----

### HTML5 Inputs
<!-- .slide: class="slide-html-inputs" -->

```
<input type="text|number|color|tel">
```

- neue Typen
- spezielle Keyboard-Unterstützung (z.B. für Zahlen)
- Vorvalidierung

<div class="wrapper fragment">
  <label>Color <input type="color"></label><br>
  <label>Range <input type="range"></label>
</div>


Note:
- über 20 types

----

### Details

<details>
 <summary>Zusammenfassung</summary>
 <p>Hier stehen die ganzen Details</p>
</details>

Note:
- all die jQuery-Accordeon

----

### Dialog

<https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dialog#Examples>

Note:
- wichtig, wie der Fokus gehandhabt wird
  - wo ist er, wenn geöffnet
- schliessen mit esc

----

### Datalist

<https://developer.mozilla.org/en-US/docs/Web/HTML/Element/datalist#Examples>

Note:
- unterstützt den Benutzer bei der Eingabe
- kein Ersatz für Select, da es nicht enforcen kann, dass einer der ausgewählten Werte gewählt wird

----

### Picture Element
<https://developer.mozilla.org/en-US/docs/Web/HTML/Element/picture>

Note:
- entstanden aus Polyfill
- Selektiv Bilder anzeigen basierend auf Viewport
- neue Bildformate -> Fallback für alte Browser

----

### Word Break Opportunities
<!-- .slide: class="slide-word-break-opportunities" -->

```
<p>Pippi Langstrumpf kommt aus dem Taka&shy;tukaland</p>
```

<div lang="de" class="narrow-container fragment">ohne: Takatukaland</div>
<div lang="de" class="narrow-container fragment">mit: Taka&shy;tukaland</div>

Note:
- vermisst von LateX her
- &shy; viel schöner
- bleibt die Frage, wie Autoren dies gut eingeben können
---

## Links

- MDN <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details>
- w3Schools <https://www.w3schools.com/tags/tag_details.asp>
- can I use <https://caniuse.com>
- Spec <https://www.w3.org/TR/html52/>, <https://html.spec.whatwg.org>
- DevTips <https://umaar.com/dev-tips/>

Note:
- wie verwendet
- welche Attribute
- Browser Support
