public class Sketch{
  
  void redBitPlane(PImage img, int plane) {
    
    int h = 0;
    int w = img.width;
    img.loadPixels();
    if (plane >= 0 && plane <= 7){
      //img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      if (i!=0 && i%w==0){
            h++;
      }
      color pixel =img.pixels[i];
      int g = (((int) red(pixel)) >> plane) & 1;
      if (g == 0){
         //println(0);
         
         stroke(color(0,0,0));
         fill(0,0,0);
         ellipse((float) (i%w),(float) (h),10,10);
      }
      
      //img.pixels[i] = gbit;
    }
      //img.updatePixels();
    }
  }
  
  void blueBitPlane(PImage img, int plane) {
    
    int h = 0;
    int w = img.width;
    img.loadPixels();
    if (plane >= 0 && plane <= 7){
      //img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      if (i!=0 && i%w==0){
            h++;
      }
      color pixel =img.pixels[i];
      int g = (((int) blue(pixel)) >> plane) & 1;
      if (g == 0){
         //println(0);
         
         stroke(color(0,0,0));
         fill(0,0,0);
         ellipse((float) (i%w),(float) (h),10,10);
      }
      
      //img.pixels[i] = gbit;
    }
      //img.updatePixels();
    }
  }
  
  void greenBitPlane(PImage img, int plane) {
    
    int h = 0;
    int w = img.width;
    img.loadPixels();
    if (plane >= 0 && plane <= 7){
      //img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      if (i!=0 && i%w==0){
            h++;
      }
      color pixel =img.pixels[i];
      int g = (((int) green(pixel)) >> plane) & 1;
      if (g == 0){
         //println(0);
         
         stroke(color(0,0,0));
         fill(0,0,0);
         ellipse((float) (i%w),(float) (h),10,10);
      }
      
      //img.pixels[i] = gbit;
    }
      //img.updatePixels();
    }
  }


}
