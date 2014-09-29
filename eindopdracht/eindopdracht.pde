Circle[] circles = new Circle[10];

int grid = 50;
float grad_grid = 22.5; // 360 graden / 16 partities
float radius, angle, x, y;
int col;
void setup(){
   smooth();
   size(700,700);
   background(0); 
   for(int i = 0; i < circles.length;i++){
     circles[i] = new Circle(i * grid, width/2, height/2);
     circles[i].build();
   }
   
   radius = 9 * grid;
   col = 32;
    
    int numPoints = 16;
    float angle = TWO_PI/(float)numPoints;
    
    for(int i=0; i < numPoints;i++){
      line(width/2, height/2, radius*sin(angle*i) + width/2, radius*cos(angle*i)+ height/2); 
      
      /*
      // bereken 1 punt
        x = radius*sin(angle*i) + width/2; 
        y = radius*cos(angle*i)+ height/2;
      */
    }
}
