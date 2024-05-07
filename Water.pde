class  Water {
  // Variablen zur Steuerung des water
  float x, y, size; // Position des water
  float speed; // Geschwindigkeit des water
  float[] sizeWater = {200, 200, 280, 150, 280};


  // Konstruktor zum Erstellen eines neuen Water-Objekts
  Water(float x_, float y_, float speed_) {
    x = x_;
    y = y_;
    speed = speed_;
  }
  void display() {


    for (int i = 0; i < 5; i++) {
      if (this == water[i * 3] || this == water[i * 3 + 1] || this == water[i * 3 + 2]) {
        image(wasser[i], x, y - 3);
        size = sizeWater[i];
      }
    }
  }

  void driveRight() {
    x += speed;
    // Wenn das water aus dem Bildschirm geht, setze es auf die andere Seite
    if (x > 700 + 300) {
      x = -300;
    }
  }
  void driveLeft() {
    x -= speed;
    // Wenn das water aus dem Bildschirm geht, setze es auf die andere Seite
    if (x < -300) {
      x = 700 + 300;
    }
  }
}
