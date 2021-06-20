int[] grid;
Longcat s;
int timer;
PImage Bobaimg;
PImage Catimg;

void setup() {
  background(140, 203, 108);
  size(700, 600);
  s = new Longcat();
  grid = new int[15 * 20];
  Bobaimg = loadImage("boba.png");
  Catimg = loadImage("catfr-removebg-preview.png");
  
  timer = 0;
  for(int i = 0; i < 15; i++) {
    for(int j = 0; j < 20; j++) {
      grid[(i * 20) + j] = 0;
    }
  }
  grid[144] = 1;
  grid[150] = 2;
}

void keyPressed() {
  if(keyCode == UP) {
    s.turn("UP");
  } 
  
  if(keyCode == DOWN) {
    s.turn("DOWN");
  } 
  
  if(keyCode == LEFT) {
    s.turn("LEFT");
  } 
  
  if(keyCode == RIGHT) {
    s.turn("RIGHT");
  }
}

void draw() {
  drawGrid();
  if(timer % 20 == 0) {  
    s.checkMove(grid);
  }
  
  timer++;
}

void drawGrid() {
  
  for(int i = 0; i < grid.length; i++) {
    if(grid[i] == 1) {
      pushStyle();
      fill(140, 203, 108);
      rect(100 + ((i % 20) * 25), 125 + (i / 20) * 25, 25, 25);
      image(Catimg, 100 + ((i % 20) * 25), 125 + (i / 20) * 25);
      popStyle();
    } else if(grid[i] == 0) {
      pushStyle();
      fill(140, 203, 108);
      rect(100 + ((i % 20) * 25), 125 + (i / 20) * 25, 25, 25);
      popStyle();
    } else if(grid[i] == 2) {
      image(Bobaimg, 100 + ((i % 20) * 25), 125 + (i / 20) * 25);
    }
  }
  
  for(int i = 100; i <= 600; i += 25) {
    pushStyle();
    stroke(0);
    line(i, 125, i, 500);
    popStyle();
  }
  
  for(int i = 125; i <= 500; i += 25) {
    pushStyle();
    stroke(50);
    line(100, i, 600, i);
    popStyle();
  }
}
