
////////////////////////////////////////////////////////////////////////////////////////////
//   voer deze functie uit om een array terug te krijgen met daarin een x en een y punt   //
////////////////////////////////////////////////////////////////////////////////////////////

int[] make_new_point(int random_c, int random_p, float[][][] allPoints) {

  // bereken een punt dat in de buurt ligt van dat punt:
  int random_c2 = random_c;
  int random_p2 = random_p;

  if (random_c2 == (circles.length -1)) {
    random_c2--;
  } else if (random_c2 == inner_space) {
    random_c2++;
  } else {
    if (random(-1, 1) > 0) {
      random_c2++;
    } else {
      random_c2--;
    }
  }
  if (random_p2 == (partities - 1)) {
    random_p2--;
  } else if (random_p2 == 0) {
    random_p2++;
  } else {
    if (random(-1, 1) > 0) {
      random_p2++;
    } else {
      random_p2--;
    }
  }
  int[] rPrC = {
    random_c2, random_p2
  };
  return rPrC;
}

