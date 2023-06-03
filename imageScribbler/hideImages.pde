public class hideImages{
  int[] bits2 = {1,2,4,8,16,32,64,128};
  
  int[] blackAndWhitePlane(PImage img) {
    PImage copy = img;
    //copy.loadPixels();
    int[] pixVal = new int[copy.pixels.length];
    
    for (int i = 0; i < copy.pixels.length; i++) {
      color pixel =copy.pixels[i];
      float bVal = brightness(pixel);
      int bw = bVal > 127 ? 255 : 0;
      pixVal[i] = bw;
      
    }
    return pixVal;
  }
  
  void hideImageInRedBitPlane(PImage img, int plane, PImage hide){
    int[] pixVal = blackAndWhitePlane(hide);
    img.loadPixels();
    edit.clearRedPlane(img,plane);
    int w = hide.width;
    int h= 0;
    for (int i = 0; i < pixVal.length; i++) {
      if (i != 0 & i%w==0){
        h++;
      }
      int p =pixVal[i];
      color pixel =img.get(i,h);
      
      
      int r = (int) red(pixel);
      int g = (int) green(pixel);
      int b = (int) blue(pixel);
      
      if (p==255) {
        // 1 - white
        r = r | bits2[plane];
      } else {
        // 0 - black
        r = r & ~(1 << plane);
      }
      //int c = (r >> plane)&1;
      //println(p + " : " + c);
      
      //img.pixels[Math.abs((point[0]+1)*point[1])] = color(r,g,b);
      img.set(i,h,color(r,g,b));
      //ellipse(point[0],point[1],10,10);
      // this works such that we are getting the correct points
      img.updatePixels();
    }
    
  }
  
  void hideImageInGreenBitPlane(PImage img, int plane, PImage hide){
    img.loadPixels();
    int[] pixVal = blackAndWhitePlane(hide);
    edit.clearGreenPlane(img,plane);
    for (int i = 0; i < pixVal.length; i++) {
      int p =pixVal[i];
      color pixel =img.pixels[i];
      int r = (int) red(pixel);
      int g = (int) green(pixel);
      int b = (int) blue(pixel);
      
      if (p==255) {
        // 1 - white
        g = g | bits2[plane];
      } else {
        // 0 - black
        g = g & ~(1 << plane);
      }
      //int c = (r >> plane)&1;
      //println(p + " : " + c);
      
      //img.pixels[Math.abs((point[0]+1)*point[1])] = color(r,g,b);
      img.pixels[i] = color(r,g,b);
      //ellipse(point[0],point[1],10,10);
      // this works such that we are getting the correct points
      img.updatePixels();
    }
    
  }
  
  void hideImageInBlueBitPlane(PImage img, int plane, PImage hide){
    img.loadPixels();
    int[] pixVal = blackAndWhitePlane(hide);
    edit.clearBluePlane(img,plane);
    for (int i = 0; i < pixVal.length; i++) {
      int p =pixVal[i];
      color pixel =img.pixels[i];
      int r = (int) red(pixel);
      int g = (int) green(pixel);
      int b = (int) blue(pixel);
      
      if (p==255) {
        // 1 - white
        b = b | bits2[plane];
      } else {
        // 0 - black
        b = b & ~(1 << plane);
      }
      //int c = (r >> plane)&1;
      //println(p + " : " + c);
      
      //img.pixels[Math.abs((point[0]+1)*point[1])] = color(r,g,b);
      img.pixels[i] = color(r,g,b);
      //ellipse(point[0],point[1],10,10);
      // this works such that we are getting the correct points
      img.updatePixels();
    }
    
  }
  
  
}
