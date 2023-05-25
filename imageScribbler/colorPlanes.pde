public class ColorPlanes {
  
  void printBit(int x) {
    if (x == 0) {
      print(0);
    } else {
      print(1);
    }
  }
  
  void printBinary(int x) {
    printBit(x&128);
    printBit(x&64);
    printBit(x&32);
    printBit(x&16);
    printBit(x&8);
    printBit(x&4);
    printBit(x&2);
    printBit(x&1);
    println();
  }
   
  void greenPlane(PImage img) {
    img.loadPixels();
    
    for (int i = 0; i < img.pixels.length; i++) {
      color pixel =img.pixels[i];
      int g = (int) green(pixel);
      img.pixels[i] = color(0,g,0);
    }
    img.updatePixels();
  }
  
  void bluePlane(PImage img) {
    img.loadPixels();
    
    for (int i = 0; i < img.pixels.length; i++) {
      color pixel =img.pixels[i];
      int b = (int) blue(pixel);
      img.pixels[i] = color(0,0,b);
    }
    img.updatePixels();
  }
  
  void redPlane(PImage img) {
    img.loadPixels();
    
    for (int i = 0; i < img.pixels.length; i++) {
      color pixel =img.pixels[i];
      int r = (int) red(pixel);
      img.pixels[i] = color(r,0,0);
    }
    img.updatePixels();
  }
  
  void blackAndWhitePlane(PImage img) {
    img.loadPixels();
    
    for (int i = 0; i < img.pixels.length; i++) {
      color pixel =img.pixels[i];
      int r = (int) red(pixel);
      int g = (int) green(pixel);
      int b = (int) blue(pixel);
      int a = (r+g+b)/3;
      img.pixels[i] = color(a,a,a);
    }
    img.updatePixels();
  }
  
  void inversionPlane(PImage img) {
    img.loadPixels();
    
    for (int i = 0; i < img.pixels.length; i++) {
      color pixel =img.pixels[i];
      int r = (int) red(pixel);
      r = r ^ 255 ;
      int g = (int) green(pixel);
      g = g ^ 255;
      int b = (int) blue(pixel);
      b = b ^ 255;
      img.pixels[i] = color(r,g,b);
    }
    img.updatePixels();
  }
  
  // green 5
  void greenBitPlane(PImage img, int plane) {
    
    if (plane >= 0 && plane <= 7){
      img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      color pixel =img.pixels[i];
      int g = (((int) green(pixel)) >> plane) & 1;
      int gbit = color(g * 255);
      img.pixels[i] = gbit;
    }
    img.updatePixels();
    }
  }
  
  void redBitPlane(PImage img, int plane) {
    
    if (plane >= 0 && plane <= 7){
      img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      color pixel =img.pixels[i];
      int g = (((int) red(pixel)) >> plane) & 1;
      int gbit = color(g * 255);
      img.pixels[i] = gbit;
    }
    img.updatePixels();
    }
  }
  
  void blueBitPlane(PImage img, int plane) {
    
    if (plane >= 0 && plane <= 7){
      img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      color pixel =img.pixels[i];
      int g = (((int) blue(pixel)) >> plane) & 1;
      int gbit = color(g * 255);
      img.pixels[i] = gbit;
    }
    img.updatePixels();
    }
  }
  
  void alphaBitPlane(PImage img, int plane) {
    
    if (plane >= 0 && plane <= 7){
      img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      color pixel =img.pixels[i];
      int g = (((int) alpha(pixel)) >> plane) & 1;
      int gbit = color(g * 255);
      img.pixels[i] = gbit;
    }
    img.updatePixels();
    }
  }
  
  void randomBitPlane(PImage img, int plane) {
    plane = 3;
    if (plane >= 0 && plane <= 7){
      img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      color pixel =img.pixels[i];
      int g = (((int) green(pixel)) >> plane) & 1;
      int r = (((int) red(pixel)) >> plane) & 1;
      int b = (((int) blue(pixel)) >> plane) & 1;
      //int gbit = color(g * 255);
      img.pixels[i] = color(r,g,b);
    }
    img.updatePixels();
    }
  }

}
