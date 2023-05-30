PImage img;
ColorPlanes ref = new ColorPlanes();
boolean drawing = false;
//import colorPlanes.pde;

void setup() {
  img = loadImage("modifiedCat.png");
  size(1200, 600);
  img.loadPixels();

  //for (int i = 0; i < img.pixels.length; i++) {

  //  color pixel =img.pixels[i];
  //  int g = (int) green(pixel);
  //  img.pixels[i] = color(0,g,0);

  //}

  //img.updatePixels();
  ref.redBitPlane(img,3);
  
  //img.save("modifiedCat.png");
  image(img, 0, 0);
  //draw();
}

void draw() {
  //image(img, 0, 0);
  //stroke(color(0,0,0));
  if (mousePressed) {
    if (!drawing){
      background(255);
      drawing = true;
    }
    stroke(color(0,0,0));
    //noStroke();
    fill(0,0,0);
    ellipse(mouseX,mouseY,10,10);
  }
  //ref.sketch(img);
  //rect(0,0,20,20);
    //update(mouseX,mouse
    //line(mouseX, mouseY, 20, 20);
  //println(mouseX + " : " + mouseY);
}

void mouseDragged() 
{
  stroke(color(0,0,0));
    //noStroke();
  fill(0,0,0);
  ellipse(mouseX,mouseY,10,10);
}

//PImage img;

//void setup() {
//  size(400,400);
//  img = loadImage("modifiedCat.png");
//}

//void draw() {
//  image(img, 0, 0, width, height);
//  //image(img, 0, 0, width/2, height/2);
//}
