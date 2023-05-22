public class ColorPlanes {
  
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
  
}
