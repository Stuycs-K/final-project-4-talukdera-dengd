int drawRectX, drawRectY;
int drawRectWidth = 200;
int drawRectHeight = 70;
boolean overDraw;

int compressRectX, compressRectY;
int compressRectWidth = 200;
int compressRectHeight = 70;
boolean overCompress;

int rectColor;
int highlightColor;

int page;

void setup() {
  size(1200, 600);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  rectColor = color(0);
  highlightColor = color(51);
  drawRectX = width / 2 - 200; 
  drawRectY = height / 2;
  overDraw = false;
  compressRectX = width / 2 + 200;
  compressRectY = height / 2;
  overCompress = false;
  
  page = 0;
}
  
void draw() {
  update(mouseX, mouseY);
  background(255);
  if (page == 0) {
    stroke(255);
    if (overDraw) {
      fill(highlightColor);
    }
    else {
      fill(rectColor);
    }
    rect(drawRectX, drawRectY, drawRectWidth, drawRectHeight);
    
    if (overCompress) {
      fill(highlightColor);
    }
    else {
      fill(rectColor);
    }
    rect(compressRectX, compressRectY, compressRectWidth, compressRectHeight);
    fill(255);
    text("DRAW", drawRectX, drawRectY);
    text("COMPRESS", compressRectX, compressRectY);
  }
  else if (page == 1) {
    
  }
}

void update(int x, int y) {
  if ( overRect(drawRectX - drawRectWidth / 2, drawRectY - drawRectHeight / 2, drawRectWidth, drawRectHeight) ) {
    overDraw = true;
    overCompress = false;
  } 
  else if ( overRect(compressRectX - compressRectWidth / 2, compressRectY - compressRectHeight / 2, compressRectWidth, compressRectHeight) ) {
    overDraw = false;
    overCompress = true;
  } 
  else {
    overDraw = false;
    overCompress = false;
  }
}

void mousePressed() {
  if (overDraw) {
    selectInput("Select Image...", "imageSelected");
  }
}

void imageSelected(File selection) {
  if (selection == null) {
    println("An image was not selected");
  }
  else {
    page = 1;
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
    return true;
  } 
  else {
    return false;
  }
}
