class Circle {

  // GLOBAL VARIABLES
  float r, posX, posY;
  int id;

  // CONTSTRUCTOR
  Circle(float _r, float _posX, float _posY, int _id) {
    r = _r;
    posX = _posX;
    posY = _posY;
    id = _id;
  }

  // FUNCTIONS
  void build() {
    // doe alles
    makePoints();
  }

  void makePoints() {
    for (int  i=0; i < partities; i++) {
      x = (r/2)*sin(angle*i) + width/2; 
      y = (r/2)*cos(angle*i) + height/2;
      float[] points = {
        x, y
      };
      
      allPoints[id][i] = points;
      
      // display points
      stroke(244,0,80);
      strokeWeight(stroke_point);
      point(x, y);
    }
    stroke_point++;
  }
}

