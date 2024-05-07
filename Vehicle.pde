class Vehicle {
  // Variablen zur Steuerung des Autos
  float x, y, size; // Position des Autos
  float speed; // Geschwindigkeit des Autos
  float[] sizeVehicle = {58, 60, 76, 60, 133};


  // Konstruktor zum Erstellen eines neuen Auto-Objekts
  Vehicle(float x_, float y_, float speed_) {
    x = x_;
    y = y_;
    speed = speed_;
  }

  // Methode zum Zeichnen des Autos
  void display() {
    for (int i = 0; i < 5; i++) {
      if (this == vehicle[i * 2] || this == vehicle[i * 2 + 1]) {
        image(cars[i], x, y);
        size = sizeVehicle[i];
      }
    }
  }

  // Methode zum Bewegen des Autos
  void driveRight() {
    x += speed;
    // Wenn das Auto aus dem Bildschirm geht, setze es auf die andere Seite
    if (x > 700 + 120) {
      x = -60;
    }
  }
  void driveLeft() {
    x -= speed;
    // Wenn das Auto aus dem Bildschirm geht, setze es auf die andere Seite
    if (x < -120) {
      x = 700 + 20;
    }
  }
}
