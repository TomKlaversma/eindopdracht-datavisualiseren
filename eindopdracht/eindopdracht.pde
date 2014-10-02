Table table;                                               
String[] land = new String[0];
int[] financieelVermogen = new int[0];              // hoger = beter
float[] langetermijnWerkeloosheid = new float[0];   // hoger = slechter
int[] persoonlijkeBezittingen = new int[0];         // hoger = beter
float[] langeUren = new float[0];                   // hoger = slechter
int stroke_point = 2;
int colour = 0;


int[][] colours = {{5, 80, 89},{70, 95, 92},{159, 96, 92}};

Circle[] circles = new Circle[10];
int partities = 32;
int inner_space = 4;

int grid = 50;
float grad_grid = 22.5; // 360 graden / 16 partities
float radius, angle, x, y;
float[][][] allPoints = new float[circles.length][partities][2];


void setup() {
  smooth();
  size(700, 700);
  background(0); 
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
    
    for(int i = inner_space; i < land.length; i++){
       makeLines(); 
    }
  }
}

boolean loadData() {    
  for (TableRow row : table.rows ()) {
    land = append(land, row.getString("land"));
    financieelVermogen = append(financieelVermogen, row.getInt("financieelVermogen"));
    langetermijnWerkeloosheid = append(langetermijnWerkeloosheid, row.getFloat("langetermijnWerkeloosheid"));
    persoonlijkeBezittingen = append(persoonlijkeBezittingen, row.getInt("persoonlijkeBezittingen"));
    langeUren = append(langeUren, row.getFloat("langeUren"));
  }
  return true;
}

