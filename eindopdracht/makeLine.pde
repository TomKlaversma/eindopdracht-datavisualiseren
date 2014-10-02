// maak voor elk stukje data een lijn

void makeLines() {
 if(colour >= 2){
    colour = 0; 
 }else{
   colour++;
 }
  
  // absolute beginpunt is allPoints[inner_space][0];
  
  int random_c = int(random(0, circles.length-inner_space)); // 0 tot 6
  int random_p = int(random(0, partities)); // 0 tot 31
  
  println(random_c);
  println("---");
  
  // Zet beginpunt

  float[] start = new float[2];
  start = allPoints[random_c + inner_space][random_p];
 
  
  // bereken eindpunt
  
  float[] stop = new float[2];
 
  // trek de lijn
  strokeWeight(random_c + 4);
  stroke(colours[colour][0], colours[2][1], colours[2][2]);

  fill(colours[0][0], colours[0][1], colours[0][2]);
  strokeWeight(random_c + 6);
  point(start[0], start[1]);
}

