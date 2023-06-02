int drawRectX, drawRectY;
int drawRectWidth = 200;
int drawRectHeight = 70;
boolean overDraw;

int compressRectX, compressRectY;
int compressRectWidth = 200;
int compressRectHeight = 70;
boolean overCompress;

int selectAnotherImageRectX, selectAnotherImageRectY;
int selectAnotherImageRectWidth = 250;
int selectAnotherImageRectHeight = 50;
boolean overAnotherImage;

int leftRectX, leftRectY;
int leftRectSize = 50;
boolean overLeft;

int rightRectX, rightRectY;
int rightRectSize = 50;
boolean overRight;

int saveRectX, saveRectY;
int saveRectWidth = 150;
int saveRectHeight = 50;
boolean overSave;

int modifyRectX, modifyRectY;
int modifyRectWidth = 150;
int modifyRectHeight = 50;
boolean overModify;

boolean draw_mode; //0 for not drawing, 1 for drawing

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
  
  selectAnotherImageRectX = selectAnotherImageRectWidth / 2;
  selectAnotherImageRectY = height - selectAnotherImageRectHeight / 2;
  overAnotherImage = false;
  
  leftRectX = width / 2 - leftRectSize / 2;
  leftRectY = height - leftRectSize / 2;
  overLeft = false;
  
  rightRectX = width / 2 + rightRectSize / 2;
  rightRectY = height - rightRectSize / 2;
  overRight = false;
  
  saveRectX = width - modifyRectWidth - saveRectWidth / 2; //replace with draw/stop button width later
  saveRectY = height - saveRectHeight / 2;
  overSave = false;
  
  modifyRectX = width - modifyRectWidth / 2;
  modifyRectY = height - modifyRectHeight / 2;
  overModify = false;
  
  page = 0;
  draw_mode = false;
}
  
void draw() {
  background(255);
  stroke(255);
  if (page == 0) {
    update(mouseX, mouseY);
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
    update1(mouseX, mouseY);
    if (overAnotherImage) {
      fill(highlightColor);
    }
    else {
      fill(rectColor);
    }
    rect(selectAnotherImageRectX, selectAnotherImageRectY, selectAnotherImageRectWidth, selectAnotherImageRectHeight);
    if (overLeft) {
      fill(highlightColor);
    }
    else {
      fill(rectColor);
    }
    rect(leftRectX, leftRectY, leftRectSize, leftRectSize);
    if (overRight) {
      fill(highlightColor);
    }
    else {
      fill(rectColor);
    }
    rect(rightRectX, rightRectY, rightRectSize, rightRectSize);
    if (overSave) {
      fill(highlightColor);
    }
    else {
      fill(rectColor);
    }
    rect(saveRectX, saveRectY, saveRectWidth, saveRectHeight);
    if (overModify) {
      fill(highlightColor);
    }
    else {
      fill(rectColor);
    }
    rect(modifyRectX, modifyRectY, modifyRectWidth, modifyRectHeight);
    fill(255);
    text("SELECT ANOTHER IMAGE", selectAnotherImageRectX, selectAnotherImageRectY);
    text("<", leftRectX, leftRectY);
    text(">", rightRectX, rightRectY);
    text("SAVE", saveRectX, saveRectY);
    text("DRAW", modifyRectX, modifyRectY); //add conditional here for draw mode
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

void update1(int x, int y) {
  if ( overRect(selectAnotherImageRectX - selectAnotherImageRectWidth / 2, selectAnotherImageRectY - selectAnotherImageRectHeight / 2, selectAnotherImageRectWidth, selectAnotherImageRectHeight) ) {
    overAnotherImage = true;
    overLeft = false;
    overRight = false;
    overSave = false;
    overModify = false;
  }
  else if ( overRect(leftRectX - leftRectSize / 2, leftRectY - leftRectSize / 2, leftRectSize, leftRectSize) ) {
    overAnotherImage = false;
    overLeft = true;
    overRight = false;
    overSave = false;
    overModify = false;
  }
  else if ( overRect(rightRectX - rightRectSize / 2, rightRectY - rightRectSize / 2, rightRectSize, rightRectSize) ) {
    overAnotherImage = false;
    overLeft = false;
    overRight = true;
    overSave = false;
    overModify = false;
  }
  else if ( overRect(saveRectX - saveRectWidth / 2, saveRectY - saveRectHeight / 2, saveRectWidth, saveRectHeight) ) {
    overAnotherImage = false;
    overLeft = false;
    overRight = false;
    overSave = true;
    overModify = false;
  }
  else if ( overRect(modifyRectX - modifyRectWidth / 2, modifyRectY - modifyRectHeight / 2, modifyRectWidth, modifyRectHeight) ) {
    overAnotherImage = false;
    overLeft = false;
    overRight = false;
    overSave = false;
    overModify = true;
  }
  else {
    overAnotherImage = false;
    overLeft = false;
    overRight = false;
    overSave = false;
    overModify = false;
  }
}
void mousePressed() {
  if (page == 0) {
    if (overDraw) {
      selectInput("Select Image...", "imageSelected");
    }
  }
  else if (page == 1) {
    if (overAnotherImage) {
      selectInput("Select Another Image...", "imageSelected");
    }
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
