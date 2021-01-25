int cols, rows;
int scl = 20;
int w = 1200;
int h = 900;
int tcols, trows;
int tscl = 15;
int tw = 1200;
int th = 900;

float flying = 0;
float tflying = 0;

float[][] terrain;
float[][] tterrain;

void setup() {
  size(600, 600, P3D);

  cols = w/scl;
  rows = h/scl;
  terrain = new float[cols][rows];
  tcols = tw/scl;
  trows = th/scl;
  tterrain = new float[tcols][trows];

}

void draw() {
  flying -= 0.01;
  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -300, 200);
      xoff += .1;
       fill(0,255,0);
    }
    yoff += .1;
  }
  background(0);
  translate(width/2, height/2);
  rotateX(PI/3); 
  translate(-w/2, -h/2);


    tflying -= 0.01;
  float tyoff = tflying;
  for (int ty = 0; ty < trows; ty++) {
    float txoff = 0;
    for (int tx = 0; tx < tcols; tx++) {
      terrain[tx][ty] = map(noise(txoff, tyoff), 0, 1, -150, 150);
      txoff += .1;
      fill(255,0,0);
    }
    tyoff += .1;
  }
     for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      stroke(0);
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
 
  for (int ty = 0; ty < rows-1; ty++) {
    beginShape(TRIANGLE_STRIP);
    for (int tx = 0; tx < cols; tx++) {
      vertex(tx*tscl, ty*tscl, terrain[tx][ty]);
      vertex(tx*tscl, (ty+1)*tscl, terrain[tx][ty+1]);
    }
   endShape();
  }

}
