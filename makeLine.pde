// maak voor elk stukje data een lijn

void makeLines() {

  colour = -1;

  // maak beginpunt
  int start_c = int(random(inner_space, circles.length)); // 4 tot 10
  int start_p = int(random(0, partities)); // 0 tot 31

  float[] start = new float[2];
  float[] next = new float[2];
  int[] prev_c_p = new int[2];
  float[] prev = new float[2];
  float[] firstPoint = new float[2];
  
  start = allPoints[start_c][start_p];

  // maak een volgend punt aan gebaseerd op beginpunt
  for (int i = 0; i < 2; i++) {
    
    // check of dit punt al bezet is
    colour++;
    
    int[] rCrP = make_new_point(start_c, start_p, allPoints);
    float[] stop = new float[2];
    stop = allPoints[rCrP[0]][rCrP[1]];

    // trek de lijn
    strokeWeight(start_c - 2);
    stroke(colours[colour][0], colours[colour][1], colours[colour][2]);
    line(start[0], start[1], stop[0], stop[1]);

    fill(colours[colour][0], colours[colour][1], colours[colour][2]);
    strokeWeight(start_c + 4);
    point(stop[0], stop[1]);
    
    if(i == 0){
      firstPoint = stop;
    }

    // zet de previous op vorig eindpunt
    prev_c_p[0] = rCrP[0];
    prev_c_p[1] = rCrP[1];
    
    prev[0] = allPoints[rCrP[0]][rCrP[1]][0];
    prev[1] = allPoints[rCrP[0]][rCrP[1]][1];
    //////////////////////////////////////////////////////////
    //   maak de tweede lijn gebaseerd op het vorige punt   //
    //////////////////////////////////////////////////////////

    colour++;

    // trek de lijn

    // maak nieuwe eindpunten
    rCrP = make_new_point(rCrP[0], rCrP[1], allPoints);
    stop = allPoints[rCrP[0]][rCrP[1]];

    println(start[1]+" : " + start[0] + " | " + prev[1] + " : " + prev[0]);
    
    boolean check_prev = false;
    
    if(stop == start){
      check_prev = true;    
      while (check_prev == true) {
        rCrP = make_new_point(prev_c_p[0], prev_c_p[1], allPoints);
        stop = allPoints[rCrP[0]][rCrP[1]];
        println("yes");
        if(prev[0] != start_c && prev[1] != start_p){
            check_prev = false;
            println("cleaned");
        }
      }
    }
    
    strokeWeight(rCrP[0] - 2);
    stroke(colours[colour][0], colours[colour][1], colours[colour][2]);
    line(prev[0], prev[1], stop[0], stop[1]);

    strokeWeight(rCrP[0] + 4);
    point(stop[0], stop[1]);
    point(prev[0], prev[1]);
    
  }
  
  colour++;
  stroke(colours[colour][0], colours[colour][1], colours[colour][2]);
  strokeWeight(start_c + 8);
  point(start[0], start[1]);
}

