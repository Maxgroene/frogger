//import processing.video.*;
//Movie fisch;

PImage[] cars = new PImage[5];
PImage[] wasser = new PImage[5];
PImage frog;
PImage lunten;
PImage wasser2;
PImage froglive;
PImage oben;


Vehicle[] vehicle; // Array zum Speichern von Auto-Objekten´
Water[] water; // Array zum Speichern von water-Objekten´

float frogX = 350; // Forsch X koordinate
float frogY = 675; // Forsch Y koordinate

// anzeigen
int live = 4;
int time = 50 * 60;
int rt = 0;
int besetzt[] = new int[5];

void setup() {
  size(1000, 700);
  noStroke();
  smooth();

  //Bilder den Imagearray Cars zuordnen
  for (int i = 0; i < cars.length; i ++ ) {
    cars[i] = loadImage( "vehicle" + i + ".png" );
  }
  //Bilder den Imagearray Wasser zuordnen
  for (int i = 0; i < wasser.length; i ++ ) {
    wasser[i] = loadImage( "wasser" + i + ".png" );
  }

  frog = loadImage("frog.png");
  lunten = loadImage("lilaunten.png");
  wasser2 = loadImage("obenbereich.png");
  froglive = loadImage("froglive.png");
  oben = loadImage("obenä.png");

  //fisch = new Movie(this, "funkytown.mp4");
  //fisch.loop();



  // Anzahl der Autos, die erstellt werden sollen
  vehicle = new Vehicle[10]; // Erstelle ein Array mit der Anzahl der Autos
  water = new Water[15]; // Erstelle ein Array mit der Anzahl der Water

  // Schleife zum Erstellen jedes Vehicle-Objekts der Klasse Vehicles
  for (int i = 0; i < 5; i++) {
    float xv = random(-100, 700); // Zufällige x-Position
    float yv = 700 - 100 - i * 50; // Berechne y-Position basierend auf der Reihenfolge des Autos
    float speedv = random(2, 4); // Zufällige Geschwindigkeit
    for (int q = 0; q < 2; q++) {
      vehicle[i*2 + q] = new Vehicle(xv + q*470, yv, speedv); // Erstelle ein neues Auto-Objekt und füge es zum Array hinzu
    }
  }
  // Schleife zum Erstellen jedes Water-Objekts der Klasse Vehicles
  for (int i = 0; i < 5; i += 1) {
    float xw = random(-50, 200); // Zufällige x-Position
    float yw = 350 - 50 - i * 50; // Berechne y-Position basierend auf der Reihenfolge des water
    float speedw = random(2, 4);
    for (int q = 0; q < 3; q++) {
      water[i*3 + q] = new Water(xw + q* 433, yw, speedw); // Erstelle ein neues Auto-Objekt und füge es zum Array hinzu
    }
  }
}


void draw() {
  background(0);
  ground();

  // Lässt Objekte der Klasse Vehicles abwechselnd nach links un rechts fahren
  for (int q = 0; q < 2; q++) {
    for (int i = 0; i < 5; i += 2) {
      vehicle[i*2 + q].driveLeft();
    }
    for (int i = 1; i < 5; i += 2) {
      vehicle[i*2 + q].driveRight();
    }
  }

  for (int i = 0; i < vehicle.length; i++) {
    vehicle[i].display(); // Zeigt Fahrzeuge an
  }

  // Lässt Objekte der Klasse water abwechselnd nach links un rechts fahren
  for (int i = 0; i < 3; i++) {
    water[0 + i].driveLeft();
    water[9 + i].driveLeft();
  }

  for (int i = 0; i < 3; i++) {
    water[3 + i].driveRight();
    water[6 + i].driveRight();
    water[12 + i].driveRight();
  }


  for (int i = 0; i < water.length; i++) {
    water[i].display(); // Zeige das water an
  }

  // Setze bild des Frosches auf die  frogX und frogY position
  image(frog, frogX - 25, frogY -20);
  // Abfragen ob der Frosch ein Auto Berührt


  touched(); // Fragt ab ob der Frosch etwas berührt

  fill(0);
  rect(700, 0, 300, 700); // Rechteck um rechts Aus dem bild fahrende Fahrzeuge zu verstecken
  scoreBoard(); // Zeigt die Lebens sowie zeit anzeige an




  for (int i = 0; i < 5; i++) {
    if (frogY < 100 && besetzt[i] == 0) {
      if (frogX > 25 + i * 150 && frogX < 75 + i * 150) {
        besetzt[i] = 1;
        resetFrog();
      }
    }
    if (besetzt[i] == 1) {
      image(frog, 25 + i * 150, 45);
    }
  }
  if (frogY < 100) {
    resetFrog();
    live--;
  }
}
