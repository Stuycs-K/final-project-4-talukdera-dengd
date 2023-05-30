import java.util.*;
PImage img;
int counter = 0;
ColorPlanes ref = new ColorPlanes();
boolean drawing = false;
ArrayList<int[]> indivPixels = new ArrayList<int[]>();

//import colorPlanes.pde;

void setup() {
  img = loadImage("modifiedCat.png");
  size(1200, 600);
  img.loadPixels();

  ref.redBitPlane(img,3);
  
  //img.save("modifiedCat.png");
  image(img, 0, 0);
  //draw();
}

void draw() {
  //image(img, 0, 0);
  //stroke(color(0,0,0));
  counter++;
  println(counter);
  if (mousePressed) {
    int[] temp = {mouseX,mouseY};
    indivPixels.add(temp);
    //println("New Array:");
    print("yay");
    if (!drawing){
      background(255);
      drawing = true;
    }
    
    }
    if (counter % 500==0){ 
      for (int[] point : indivPixels){
        stroke(color((int) Math.random()*255,(int) Math.random()*255,(int) Math.random()*255));
        fill((int) Math.random()*255,(int) Math.random()*255,(int) Math.random()*255);
        ellipse(point[0],point[1],10,10);
     }
    
    
   
    //stroke(color(0,0,0));
    //noStroke();
    //fill(0,0,0);
    //ellipse(mouseX,mouseY,10,10);
  }
  //ref.sketch(img);
  //rect(0,0,20,20);
    //update(mouseX,mouse
    //line(mouseX, mouseY, 20, 20);
  //println(mouseX + " : " + mouseY);
}

//void mouseDragged() 
//{
//  stroke(color(0,0,0));
//    //noStroke();
//  fill(0,0,0);
//  ellipse(mouseX,mouseY,10,10);
//}

//PImage img;

//void setup() {
//  size(400,400);
//  img = loadImage("modifiedCat.png");
//}

//void draw() {
//  image(img, 0, 0, width, height);
//  //image(img, 0, 0, width/2, height/2);
//}
