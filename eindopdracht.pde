import processing.pdf.*;

Table table;                                               

float[] financieelVermogen = new float[0];              // hoger = beter
float[] langetermijnWerkeloosheid = new float[0];       // hoger = slechter
float[] persoonlijkeBezittingen = new float[0];         // hoger = beter
float[] langeUren = new float[0];                       // hoger = slechter
float[] gem = {4.8 , 4.7, 4.8, 4.8};

int stroke_point = 2;
int colour = 0;

int textsize = 52;
int[] textAndCircleColour = {223,44,80};

int[][] colours = {{43, 90, 100}, {39, 75, 70}, {142, 43, 76}, {151, 74, 57}, {40, 54, 98}};

Circle[] circles = new Circle[10];
int partities = 32;
int inner_space = 5;

int grid = 50;
float grad_grid = 22.5; // 360 graden / 16 partities
float radius, angle, x, y;
float[][][] allPoints = new float[circles.length][partities][2];


void setup() {
  smooth();
  size(700, 700);
  beginRecord(PDF, "exported_logo4.pdf"); 
  background(255); 
  colorMode(HSB, 360, 100, 100);
  angle = TWO_PI/(float)partities;
  
  table = loadTable("Data_final_percentage.csv", "header"); 
  loadData();

  if(loadData()){
    for (int i = inner_space; i < circles.length; i++) {
      radius = i * grid;
      circles[i] = new Circle(radius, width/2, height/2, i);
      circles[i].build();
    }
    // maak per land een lijn aan met 4 punten: 
    for(int i = inner_space; i < financieelVermogen.length; i++){
       float[] data = {financieelVermogen[i], langetermijnWerkeloosheid[i], persoonlijkeBezittingen[i], langeUren[i]};
       makeLines(data, gem); 
    }
  }
  
  // maak titel
  PFont myFont = createFont("Helvetica-Bold", 32);
  textFont(myFont);
  fill(textAndCircleColour[0], textAndCircleColour[1], textAndCircleColour[2]);
  textAlign(CENTER);
  textSize(textsize);
  text("OECD", width/2, height/2 + textsize/3);
  
}

// lees de data uit:
boolean loadData() {    
  for (TableRow row : table.rows ()) {
    financieelVermogen = append(financieelVermogen, row.getFloat("financieelVermogen"));
    langetermijnWerkeloosheid = append(langetermijnWerkeloosheid, row.getFloat("langetermijnWerkeloosheid"));
    persoonlijkeBezittingen = append(persoonlijkeBezittingen, row.getFloat("persoonlijkeBezittingen"));
    langeUren = append(langeUren, row.getFloat("langeUren"));    
  }
  return true;
}

void draw(){
   endRecord(); 
}

