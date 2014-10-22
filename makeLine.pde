// maak voor elk stukje data een lijn

void makeLines(float _data[], float[] _gem) {
  
  // start_c, start_p is het beginpunt (positie in array)
  int start_c = int(random(inner_space, circles.length)); // 4 tot 10
  int start_p = int(random(0, partities)); // 0 tot 31

  // rCrP, previousPoint en prevPoint bevatten point posities in arrays
  int[] startPoint = new int[2];
  int[] prevPoint = new int[0];

  int[][] prevPoints = new int[1][2];
  int[][] minPoints = new int[1][2];
  int[][] plusPoints = new int[1][2];

  // start, stop bevatten pixelwaardes   
  float[] start = new float[2];
  float[] stop = new float[2];

  boolean min_plus;

  // voeg het beginpunt toe

  minPoints[0][0] = start_c;
  minPoints[0][1] = start_p;
  plusPoints[0][0] = start_c;
  plusPoints[0][1] = start_p;
  prevPoints[0][0] = start_c;
  prevPoints[0][1] = start_p;

  // maak een twee verschillende paden aan gebaseerd op beginpunt
  for (int i = 0; i < _data.length; i++) {

    // de random wordt dalijk vervangen door een vergelijking van data
    float random = random(-1, 1);
    if (_data[i] < gem[i]) {
      println("MIN");
      // als het negatief is:
      for (int j = 0; j < minPoints.length; j++) { 
        // pak het laatste minpunt     
        startPoint[0] = minPoints[j][0];
        startPoint[1] = minPoints[j][1];
        // vertaal naar pixels
        start = allPoints[startPoint[0]][startPoint[1]];
      }
      min_plus = false;
    } else {         
      println("PLUS");    
      for (int j = 0; j < plusPoints.length; j++) { 
        startPoint[0] = plusPoints[j][0];
        startPoint[1] = plusPoints[j][1];          
        start = allPoints[startPoint[0]][startPoint[1]];
      }
      min_plus = true;
    }

    if (min_plus == false) {
      colour = 2;
      prevPoint = minPoints[minPoints.length - 1];
    } else {
      colour = 0;
      prevPoint = plusPoints[plusPoints.length - 1];
    }

    // bereken advh beginpunt een nieuw punt
    int[] rCrP = make_new_point(prevPoint[0], prevPoint[1], allPoints);

    // kijk of het punt in de prevPoints array of het punt al een keer gebruikt is
    for (int p = 0; p < prevPoints.length; p++) {
      println("prevPoints" + p + ": " +prevPoints[p][0] + ", " + prevPoints[p][1]);
      println("rCrP:        " + rCrP[0] + ", " + rCrP[1]);

      // kijk per vorig punt of het gebruikt wordt in rCrP
      if (rCrP[0] == prevPoints[p][0] && rCrP[1] == prevPoints[p][1]) {
        boolean check_prev = true;
        println("-----------------------true");
        int whileCount = 0;

        while (check_prev == true) {
          println("attemd");
          // maak nieuw punt aan
          rCrP = make_new_point(prevPoint[0], prevPoint[1], allPoints);
          boolean exists = false;

          // kijk per vorig punt of dit gelijk is, retoerneer true als het al bestaat
          for (int k = 0; k < prevPoints.length; k++) {
            if (prevPoints[k][0] == rCrP[0] && prevPoints[k][1] == rCrP[1]) {
              exists = true;
            }
          }
          println(exists);

          // als het niet bestaat mag je uit de whileloop
          if (exists == false) {
            check_prev = false; 
            println("-----------------------cleaned-----------------------");
          }
        // bepaal een maximum, anders blijft hij hangen als er geen andere mogelijkheden zijn.
          if (whileCount > 20) {
            check_prev = false; 
            println("-----------------------Aborted-----------------------");
          }          
          whileCount++;
        }
      } else {
        println("-----------------------false");
      }
    }

    stop = allPoints[rCrP[0]][rCrP[1]];
    prevPoints = (int[][])append(prevPoints, rCrP);

    // voeg dit toe aan de juiste array
    if (min_plus == false) {
      minPoints = (int[][])append(minPoints, rCrP);
    } else {
      plusPoints = (int[][])append(minPoints, rCrP);
    }

    println("van: " + startPoint[0] + ", " + startPoint[1] + " || naar: " + rCrP[0] + ", " + rCrP[1]);  
    println(" ");


    // lijn uiterlijk
    strokeWeight(start_c - 2);
    stroke(colours[colour][0], colours[colour][1], colours[colour][2]);

    // trek de lijn!
    line(start[0], start[1], stop[0], stop[1]);

    // zet een eindpunt
    strokeWeight(start_c + 4);
    point(stop[0], stop[1]);
    point(start[0], start[1]);
  }

  // reset startpoint
  start = allPoints[start_c][start_p];
  // voeg beginpunt toe boven op alles    
  stroke(colours[1][0], colours[1][1], colours[1][2]);
  strokeWeight(start_c * 2);
  point(start[0], start[1]);
}

