public class Edit{

  int[] bits = {254,253,251,247,239,223,191,127};
  int[] bits2 = {1,2,4,8,16,32,64,128};
  
  void clearRedPlane(PImage img, int plane){
    img.loadPixels();
    
    for (int i = 0; i < img.pixels.length; i++) {
      color pixel =img.pixels[i];
      int r = (int) red(pixel);
      int g = (int) green(pixel);
      int b = (int) blue(pixel);
      
      r = r | bits2[plane];
      //println(r);
      //int c = (r >> plane)&1;
      //println(c);
      
      img.pixels[i] = color(r,g,b);
    }
    //println("done");
    img.updatePixels();
  
  }
  
  void clearGreenPlane(PImage img, int plane){
    img.loadPixels();
    
    for (int i = 0; i < img.pixels.length; i++) {
      color pixel =img.pixels[i];
      int r = (int) red(pixel);
      int g = (int) green(pixel);
      int b = (int) blue(pixel);
      
      g = g | bits2[plane];
      //println(r);
      //int c = (r >> plane)&1;
      //println(c);
      
      img.pixels[i] = color(r,g,b);
    }
    //println("done");
    img.updatePixels();
  
  }
  
  void clearBluePlane(PImage img, int plane){
    img.loadPixels();
    
    for (int i = 0; i < img.pixels.length; i++) {
      color pixel =img.pixels[i];
      int r = (int) red(pixel);
      int g = (int) green(pixel);
      int b = (int) blue(pixel);
      
      b = b | bits2[plane];
      //println(r);
      //int c = (r >> plane)&1;
      //println(c);
      
      img.pixels[i] = color(r,g,b);
    }
    //println("done");
    img.updatePixels();
  
  }
  
  
  
  
  void writeRedPlane(PImage img, int plane, ArrayList<int[]> points){ // main issue is that i am not plotting it in the right place
    img.loadPixels();
    
    for (int i = 0; i < points.size(); i++) {
      int[] point = points.get(i);
      color pixel =img.pixels[Math.abs((point[0]+1)*point[1])];
      int r = (int) red(pixel);
      int g = (int) green(pixel);
      int b = (int) blue(pixel);
      
      r = r & ~(1 << plane);
      //int c = (r >> plane)&1;
      //println(c);
      
      //img.pixels[Math.abs((point[0]+1)*point[1])] = color(r,g,b);
      img.set(point[0], point[1], color(r,g,b));
      //ellipse(point[0],point[1],10,10);
      // this works such that we are getting the correct points
      img.updatePixels();
    }
  
  }
  
  void writeGreenPlane(PImage img, int plane, ArrayList<int[]> points){ // main issue is that i am not plotting it in the right place
    img.loadPixels();
    
    for (int i = 0; i < points.size(); i++) {
      int[] point = points.get(i);
      color pixel =img.pixels[Math.abs((point[0]+1)*point[1])];
      int r = (int) red(pixel);
      int g = (int) green(pixel);
      int b = (int) blue(pixel);
      
      g = g & ~(1 << plane);
      //int c = (r >> plane)&1;
      //println(c);
      
      //img.pixels[Math.abs((point[0]+1)*point[1])] = color(r,g,b);
      img.set(point[0], point[1], color(r,g,b));
      //ellipse(point[0],point[1],10,10);
      // this works such that we are getting the correct points
      img.updatePixels();
    }
  
  }
  
  void writeBluePlane(PImage img, int plane, ArrayList<int[]> points){ // main issue is that i am not plotting it in the right place
    img.loadPixels();
    
    for (int i = 0; i < points.size(); i++) {
      int[] point = points.get(i);
      color pixel =img.pixels[Math.abs((point[0]+1)*point[1])];
      int r = (int) red(pixel);
      int g = (int) green(pixel);
      int b = (int) blue(pixel);
      
      b = b & ~(1 << plane);
      //int c = (r >> plane)&1;
      //println(c);
      
      //img.pixels[Math.abs((point[0]+1)*point[1])] = color(r,g,b);
      img.set(point[0], point[1], color(r,g,b));
      //ellipse(point[0],point[1],10,10);
      // this works such that we are getting the correct points
      img.updatePixels();
    }
  
  }





}
