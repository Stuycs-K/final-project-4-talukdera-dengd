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
void greenPlane0(PImage img) {
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
color pixel =img.pixels[i];
int g = (((int) green(pixel)) >> 0) & 1;
int gbit = color(g * 255);
img.pixels[i] = gbit;
}
img.updatePixels();
}
void greenPlane1(PImage img) {
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
color pixel =img.pixels[i];
int g = (((int) green(pixel)) >> 1) & 1;
int gbit = color(g * 255);
img.pixels[i] = gbit;
}
img.updatePixels();
}
void greenPlane2(PImage img) {
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
color pixel =img.pixels[i];
int g = (((int) green(pixel)) >> 2) & 1;
int gbit = color(g * 255);
img.pixels[i] = gbit;
}
img.updatePixels();
}
void greenPlane3(PImage img) {
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
color pixel =img.pixels[i];
int g = (((int) green(pixel)) >> 3) & 1;
int gbit = color(g * 255);
img.pixels[i] = gbit;
}
img.updatePixels();
}
void greenPlane4(PImage img) {
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
color pixel =img.pixels[i];
int g = (((int) green(pixel)) >> 4) & 1;
int gbit = color(g * 255);
img.pixels[i] = gbit;
}
img.updatePixels();
}
void greenPlane5(PImage img) {
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
color pixel =img.pixels[i];
int g = (((int) green(pixel)) >> 5) & 1;
int gbit = color(g * 255);
img.pixels[i] = gbit;
}
img.updatePixels();
}
void greenPlane6(PImage img) {
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
color pixel =img.pixels[i];
int g = (((int) green(pixel)) >> 6) & 1;
int gbit = color(g * 255);
img.pixels[i] = gbit;
}
img.updatePixels();
}
void greenPlane7(PImage img) {
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
color pixel =img.pixels[i];
int g = (((int) green(pixel)) >> 7) & 1;
int gbit = color(g * 255);
img.pixels[i] = gbit;
}
img.updatePixels();
}

// red planes
void redPlane0(PImage img) {
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
color pixel =img.pixels[i];
int g = (((int) red(pixel)) >> 0) & 1;
int gbit = color(g * 255);
img.pixels[i] = gbit;
}
img.updatePixels();
}
void redPlane1(PImage img) {
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
color pixel =img.pixels[i];
int g = (((int) red(pixel)) >> 1) & 1;
int gbit = color(g * 255);
img.pixels[i] = gbit;
}
img.updatePixels();
}
void redPlane2(PImage img) {
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
color pixel =img.pixels[i];
int g = (((int) red(pixel)) >> 2) & 1;
int gbit = color(g * 255);
img.pixels[i] = gbit;
}
img.updatePixels();
}
void redPlane3(PImage img) {
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
color pixel =img.pixels[i];
int g = (((int) red(pixel)) >> 3) & 1;
int gbit = color(g * 255);
img.pixels[i] = gbit;
}
img.updatePixels();
}
void redPlane4(PImage img) {
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
color pixel =img.pixels[i];
int g = (((int) red(pixel)) >> 4) & 1;
int gbit = color(g * 255);
img.pixels[i] = gbit;
}
img.updatePixels();
}
void redPlane5(PImage img) {
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
color pixel =img.pixels[i];
int g = (((int) red(pixel)) >> 5) & 1;
int gbit = color(g * 255);
img.pixels[i] = gbit;
}
img.updatePixels();
}
void redPlane6(PImage img) {
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
color pixel =img.pixels[i];
int g = (((int) red(pixel)) >> 6) & 1;
int gbit = color(g * 255);
img.pixels[i] = gbit;
}
img.updatePixels();
}
void redPlane7(PImage img) {
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
color pixel =img.pixels[i];
int g = (((int) red(pixel)) >> 7) & 1;
int gbit = color(g * 255);
img.pixels[i] = gbit;
}
img.updatePixels();
}

// blue planes


  
  
  
}
