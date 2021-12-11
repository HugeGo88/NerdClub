---
marp: true
title: Programmieren für Anfänger 1
author: CVJM Walheim
paginate: true
theme: cvjmSlides
_class: lead
footer: 03.11.2021
backgroundImage: url('../themes/image1.png')
---
![bg](../themes/image2.png)
<style scoped>
h1{
    color: white
}
</style>
# Programmieren für Anfänger

---

# Umfang des Kurses
- Was ist ein Computer und wie funktioniert er (Basics)?
- Kleine Programme zum üben und reinkommen
- Datentypen, Kontrolstrukturen, etc.
- Programmieren eines kleinen Spiels

---
![bg right:40% 180%](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/X-4_with_Female_Computer_%289467782468%29.jpg/1920px-X-4_with_Female_Computer_%289467782468%29.jpg)

# Was ist ein Computer?

- Früher Rechner:innen in den USA
- Haben Steuererklärungen oder Flugbahnen berechnet
- Hilfsmittel der Informatik
- Ein Computer ist nur so schlau wie sein Progammierer

---

# Es geht um Informationen
- Merkmale
    - Informationen sind immateriell. Ist zwar an einen Träger gebunden, aber für die Information egal. Wiegt nichts!
    - Kann gespeichert oder übertragen werden
    - Wird neben Grundbegriffe wie Materie und Energie gestellt
-  Daten entstehen durch formalisierung
    - Formalisierung einer Information
    - Formalisierung ist immer mit Informationsverlust verbunden.

---

# Was machen wir mit den Daten?

- Einlesen
- Ändern
- Aufbereiten
- Anzeigen
- Abspeichern

---

# Wie können wir mit Daten arbeiten?

- Wir geben dem Computer Anweisungen
    - Diese Anweisungen nennen wir Algorithmus
    - Bsp. Zauberwürfel
    - Matheformeln
- Diese Algorithmen schreiben wir in Code nieder
- Anschließen fühert der Computer den Code aus den wir geschrieben haben.

---
![bg right:50% 100% grayscale vertical](https://www.lifewire.com/thmb/Kly9L2drgPKTKr6tmgJdGXce0jY=/1250x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/what-is-binary-and-how-does-it-work-4692749-4-5dd91a9060db4505a99591efd5db103b.png)
![bg right:50% 100% grayscale](https://d1g9li960vagp7.cloudfront.net/wp-content/uploads/2018/10/Ergebnis-2_SEO-1024x576.jpg)
# Wie werden Daten dargestellt?

- Binär
    - nur Nuller und einser
- In Textform
    - Ist auch nur Null und eins, aber für Menschen lesbar

---
![bg right:50% 100% grayscale:1](https://2018media.idtech.com/2021-05/computer-parts-diagram.png?f9a309a218)

# Aus was besteht ein Computer?

- CPU
- Mainboard
- RAM
- Grafikkarte

--- 
![bg right:60% 170% grayscale:1](https://im-praxistipps.chip.de/architektur-eines-prozessors_65890c4f.jpg?im=AspectCrop%2Csize%3D%2816%2C9%29%2Cgravity%3DCenter%2CallowExpansion%2CBackgroundColor%2Ccolor%3Dtransparent&hash=eeb709e593fb6c18c2abac5d3542f52f89d85c89d5089f7b572475ac231341ff)
# Wo geschieht die Magie?
- In der CPU (central processing unit)

---
# Wie bringe ich Code in meinen Prozessor?
- Code erstellen
    - Hierfür brauchen wir eine IDE (Entwicklungsumgebung)
- Unser Menschenlesbarer Code muss nun "Übersetzt" werden
    - Das macht der Complier für uns
- Jetzt können wir den Code ausführen

---
# Kleines Vokabular
- Vaiable = Speichert Werte
- Datentypen = Jede Variable enthält einen bestimmten Datentypen
  - Zahl (int, double) 1, 2, 3, 3.14
  - Zeichenkette (String), "CVJM Walheim"
  - Wahrheitswert (bool), true oder false
- Funktion = Ein Algorithmus der immer wieder die gleiche Aufgabe ausführt
- Parameter = werden Funktionen übergeben


---
# Was muss ich machen bevor ich loslegen kann?

- Visual Studio Code runterladen
- flutter runterladen
- Android Studio runterladen
- Ein Projekt erstellen
    - Das erste Projekt ist immer ein "Hello World" :D 
- Und das machen wir jetzt...

---
# Hello world

- Wir öffnen die Kommandozeile
- hier tippen wir jetzt folgender rein `dart create lesson_01`
- dart --> Programmiersprache
- create --> erstellt ein neues Projekt
- lesson_01 --> name des Projects

---
![bg](../themes/image3.png)
<style scoped>
h1{
    color: white
}
h2{
    color: white
}
a{
    color: white
}
ul {
  list-style-type: none !important;
  font-size: 28pt;
  color: white
}
</style>
# Hello world
## Start Code
```dart
print("Hello World!"); 
```
- `print` schreibt alles was in der Klammer ist in die Console
  - Print ist eine Funktion, Funktionen haben Klammern
- `"Hello World"` wird in Anführungszeichen geschrieben weil es ein String ist

---
![bg](../themes/image3.png)
<style scoped>
h1{
    color: white
}
h2{
    color: white
}
a{
    color: white
}
ul {
  list-style-type: none !important;
  font-size: 28pt;
  color: white
}
</style>

# Erweiterung des "Hello World" #1

```dart
  print("Enter your name?");
  // Reading name of the Nerd
  String? name = stdin.readLineSync();
```
- `stdin.readLineSync()` wir warten bis der Nutzer seine Eingabe mit einem Return abgeschlossen hat
- Nach der Eingabe speichern wir die eingabe in eine Variable vom Type `String?` und Namen `name`

---
![bg](../themes/image3.png)
<style scoped>
h1{
    color: white
}
h2{
    color: white
}
a{
    color: white
}
ul {
  list-style-type: none !important;
  font-size: 28pt;
  color: white
}
</style>

# Erweiterung des "Hello World" #2

```dart
  // Printing the name
  print("Hello, $name! \nWelcome to NerdClub!!");
```
- jetzt "drucken" wir die Variable in einem String aus
- Da die Variable in einem String Verwendet wird, nurtzen wir das `$` um klar zumachen, dass das eine Variable ist.
---
![bg](../themes/image2.png)
<style scoped>
h1{
    color: white
}
h2{
    color: white
}
h3{
    color: white
}
a{
    color: white
}
</style>
# Vielen Dank <br/> für eure Aufmerksamkeit
### Bei Fragen meldet euch unter <br/> webmaster@cvjm-walheim.de
