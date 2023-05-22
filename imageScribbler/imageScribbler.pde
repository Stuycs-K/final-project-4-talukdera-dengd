PImage img;
//import colorPlanes.pde;

void setup() {
  size(1200, 600);
  img = loadImage("modifiedCat.png");
  img.loadPixels();

  //for (int i = 0; i < img.pixels.length; i++) {

  //  color pixel =img.pixels[i];
  //  int g = (int) green(pixel);
  //  img.pixels[i] = color(0,g,0);

  //}

  //img.updatePixels();
  ColorPlanes ref = new ColorPlanes();
  ref.inversionPlane(img);

  //img.save("modifiedCat.png");
  image(img, 0, 0);
}

void draw() {
  image(img, 0, 0);
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
