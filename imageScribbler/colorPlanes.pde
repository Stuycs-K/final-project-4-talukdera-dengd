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
    PImage copy = img.copy();
    copy.loadPixels();
    
    for (int i = 0; i < copy.pixels.length; i++) {
      color pixel =copy.pixels[i];
      int g = (int) green(pixel);
      copy.pixels[i] = color(0,g,0);
    }
    copy.updatePixels();
    image(copy,0,0);
  }
  
  void bluePlane(PImage img) {
    PImage copy = img.copy();
    copy.loadPixels();
    
    for (int i = 0; i < copy.pixels.length; i++) {
      color pixel =copy.pixels[i];
      int g = (int) blue(pixel);
      copy.pixels[i] = color(0,0,g);
    }
    copy.updatePixels();
    image(copy,0,0);
  }
  
  void redPlane(PImage img) {
    PImage copy = img.copy();
    copy.loadPixels();
    
    for (int i = 0; i < copy.pixels.length; i++) {
      color pixel =copy.pixels[i];
      int g = (int) red(pixel);
      copy.pixels[i] = color(g,0,0);
    }
    copy.updatePixels();
    image(copy,0,0);
  }
  
  void greyPlane(PImage img) {
    PImage copy = img.copy();
    copy.loadPixels();
    
    for (int i = 0; i < copy.pixels.length; i++) {
      color pixel =copy.pixels[i];
      int r = (int) red(pixel);
      int g = (int) green(pixel);
      int b = (int) blue(pixel);
      int a = (r+g+b)/3;
      float bVal = brightness(pixel);
      int blackOrWhite = bVal > 127 ? color(255) : color(0);
      
      
      copy.pixels[i] = blackOrWhite;
    }
    copy.updatePixels();
    image(copy,0,0);
  }
  
  void inversionPlane(PImage img) {
    PImage copy = img.copy();
    copy.loadPixels();
    
    for (int i = 0; i < copy.pixels.length; i++) {
      color pixel =copy.pixels[i];
      int r = (int) red(pixel);
      r = r ^ 255 ;
      int g = (int) green(pixel);
      g = g ^ 255;
      int b = (int) blue(pixel);
      b = b ^ 255;
      copy.pixels[i] = color(r,g,b);
    }
    copy.updatePixels();
    image(copy,0,0);
  }
  
  // green 5
  void greenBitPlane(PImage img, int plane) {
    PImage copy = img.copy();
    if (plane >= 0 && plane <= 7){
      copy.loadPixels();
    for (int i = 0; i < copy.pixels.length; i++) {
      color pixel =copy.pixels[i];
      int g = (((int) green(pixel)) >> plane) & 1;
      int gbit = color(g * 255);
      copy.pixels[i] = gbit;
    }
    copy.updatePixels();
    image(copy,0,0);
    }
  }
  
  void blueBitPlane(PImage img, int plane) {
    PImage copy = img.copy();
    if (plane >= 0 && plane <= 7){
      copy.loadPixels();
    for (int i = 0; i < copy.pixels.length; i++) {
      color pixel =copy.pixels[i];
      int g = (((int) blue(pixel)) >> plane) & 1;
      int gbit = color(g * 255);
      copy.pixels[i] = gbit;
    }
    copy.updatePixels();
    image(copy,0,0);
    }
  }
  
  void redBitPlane(PImage img, int plane) {
    PImage copy = img.copy();
    if (plane >= 0 && plane <= 7){
      copy.loadPixels();
    for (int i = 0; i < copy.pixels.length; i++) {
      color pixel =copy.pixels[i];
      int g = (((int) red(pixel)) >> plane) & 1;
      int gbit = color(g * 255);
      copy.pixels[i] = gbit;
    }
    copy.updatePixels();
    image(copy,0,0);
    }
  }
  
  void alphaBitPlane(PImage img, int plane) {
    PImage copy = img.copy();
    if (plane >= 0 && plane <= 7){
      copy.loadPixels();
    for (int i = 0; i < copy.pixels.length; i++) {
      color pixel =copy.pixels[i];
      int g = (((int) alpha(pixel)) >> plane) & 1;
      int gbit = color(g * 255);
      copy.pixels[i] = gbit;
    }
    copy.updatePixels();
    image(copy,0,0);
    }
  }
  
  int randomNumber(int a, int b) {
        int range = b - a + 1;
        int randomNumber = (int) (Math.random() * range) + a;
        return randomNumber;
  }
  
  void sketch(PImage img){
    int h = 0;
    int w = img.width;
    
    img.loadPixels();
    
    for (int i =0; i < img.pixels.length; i++){
      if (i!=0 && i%w==0){
        h++;
      }
      stroke(img.pixels[i]);
      point(i%w,h);
      
    }
    
  }
 
}
