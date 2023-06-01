import java.util.*;
PImage img;
int counter = 0;
ColorPlanes ref = new ColorPlanes();
Edit edit = new Edit();
Sketch sketch = new Sketch();
hideImages hide = new hideImages();
boolean drawing = false;
ArrayList<int[]> indivPixels = new ArrayList<int[]>();

//import colorPlanes.pde;

void setup() {
  img = loadImage("modifiedCat.png");
  //PImage copy = img.copy();
  size(1200, 600);
  img.loadPixels();

  //ref.redBitPlane(img,3);
  ////edit.test();
  
  ////img.save("modifiedCat.png");
  //image(img, 0, 0);
  //for (int i = 0; i < 500; i++){
  
  //}
  //println("done");
  hide.hideImageInRedBitPlane(img,3,hide.blackAndWhitePlane(img));
  ref.redBitPlane(img,3);
  //image(img,0,0);
  //draw();
}

void draw() {
  
  //image(img, 0, 0);
  //stroke(color(0,0,0));
  counter++;
  //println(counter);
  if (mousePressed & mouseX < img.width & mouseY < img.height & mouseX >= 0 & mouseY >= 0) {
    int[] temp = {mouseX,mouseY};
    println(mouseX + " : " + mouseY);
    indivPixels.add(temp);
    if (!drawing){
      background(255);
      drawing = true;
    }
      
   }
     int s = 2;
    if (counter >= 10000000){
      //println(indivPixels);
      edit.clearBluePlane(img,5);
      edit.writeBluePlane(img,5,indivPixels); // points correct here
      //ref.redBitPlane(img,3);
      sketch.redBitPlane(img,5);
      //image(img,0,0);
    } else if (counter > s) {
      
    }
    
    
    //if (counter % 500==0 && counter < s){ 
    //  background(255);
      
    //  for (int[] point : indivPixels){
    //    stroke(color(0,0,0));
    //    fill(0,0,0);
    //    ellipse(point[0],point[1],10,10);
    // }
    
    //}
  //ref.sketch(img);
  //rect(0,0,20,20);
    //update(mouseX,mouse
    //line(mouseX, mouseY, 20, 20);
  //println(mouseX + " : " + mouseY);
}

void mouseDragged() 
{
  if (mouseX < img.width & mouseY < img.height){
  int[] temp = {mouseX,mouseY};
  indivPixels.add(temp);
  stroke(color(0,0,0));
    //noStroke();
  fill(0,0,0);
  ellipse(mouseX,mouseY,10,10);
  }
  
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
