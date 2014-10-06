// maak voor elk stukje data een lijn

void makeLines() {

  colour = -1;
  
    // start_c, start_p is het beginpunt (positie in array)
    int start_c = int(random(inner_space, circles.length)); // 4 tot 10
    int start_p = int(random(0, partities)); // 0 tot 31
    
    // rCrP, previousPoint en firstpoint zijn point posities in arrays
    int[] startPoint = new int[2];
    int[] firstPoint = new int[2];
    int[] previousPoint = new int[2];
    
    // start, stop en prev zijn pixelwaardes   
    float[] start = new float[2];
    float[] prev = new float[2];
    float[] stop = new float[2];
    
    start = allPoints[start_c][start_p];

  // maak een twee verschillende paden aan gebaseerd op beginpunt
  for (int i = 0; i < 2; i++) {
    // verander de kleur van het pad
      colour++;
      
    // maak twee verschillende partities in paden
      int[] rCrP = make_new_point(start_c, start_p, allPoints);
      stop = allPoints[rCrP[0]][rCrP[1]];
      
    // check of ie al bestaat!
      if(i == 1){
        boolean check_prev = false;
        println(firstPoint[0] + ", " + firstPoint[1]+ " || " + rCrP[0] + ", " + rCrP[1]);
        if(firstPoint[0] == rCrP[0] && firstPoint[1] == rCrP[1]){
          println("true");
          check_prev = true;    
          while (check_prev == true) {
            rCrP = make_new_point(start_c, start_p, allPoints);
            stop = allPoints[rCrP[0]][rCrP[1]];
            println("yes1");
            if(prev[0] != start_c && prev[1] != start_p){
                check_prev = false;
                println("cleaned1");
            }
          }
        }
      }else{
        firstPoint = rCrP;
      }
    
    // maak verschillende punten in paden
      
    // check of dit punt al bezet is
    
    // trek de lijn
    strokeWeight(start_c - 2);
    stroke(colours[colour][0], colours[colour][1], colours[colour][2]);
    line(start[0], start[1], stop[0], stop[1]);

    strokeWeight(start_c + 4);
    point(stop[0], stop[1]);

    // zet de previous op vorig eindpunt
    previousPoint[0] = rCrP[0];
    previousPoint[1] = rCrP[1];
    
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

    //println(start[1]+" : " + start[0] + " | " + prev[1] + " : " + prev[0]);
    
    boolean check_prev = false;
    
    if(stop == start){
      check_prev = true;    
      while (check_prev == true) {
        rCrP = make_new_point(previousPoint[0], previousPoint[1], allPoints);
        stop = allPoints[rCrP[0]][rCrP[1]];
        if(prev[0] != start_c && prev[1] != start_p){
            check_prev = false;
            println("cleaned");
        }
      }
    }
    
    strokeWeight(rCrP[0] - 1);
    stroke(colours[colour][0], colours[colour][1], colours[colour][2]);
    line(prev[0], prev[1], stop[0], stop[1]);

    strokeWeight(rCrP[0]* 1.5);
    point(stop[0], stop[1]);
    point(prev[0], prev[1]);
     
  }
  colour++;
  stroke(colours[colour][0], colours[colour][1], colours[colour][2]);
  strokeWeight(start_c * 2);
  point(start[0], start[1]);

}

