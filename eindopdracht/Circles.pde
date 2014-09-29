class Circle {

  // GLOBAL VARIABLES
  float r, posX, posY;

  // CONTSTRUCTOR
  Circle(float _r, float _posX, float _posY) {
    r = _r;
    posX = _posX;
    posY = _posY;
  }

  // FUNCTIONS
  void build() {
    // doe alles
    display();
  }

  void display() {
   // maak een nieuwe circle
    noFill();
   stroke(255);
   ellipseMode(CENTER);
   ellipse(posX, posY, r, r);
  }
}

