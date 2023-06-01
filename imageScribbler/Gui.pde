int rectX, rectY;
int rectWidth = 300;
int rectHeight = 70;

void setup() {
  size(1000, 600);
  //PImage img = loadImage("");
  //background(img);
  background(51);
  rectX = width / 2 - rectWidth / 2;
  rectY = height / 2 - rectHeight / 2;
  rect(rectX, rectY, rectWidth, rectHeight);
  text("Select Image", rectX + 10, rectY + rectWidth / 2);
  selectInput("Select Image...", "folderSelected");
}
  
