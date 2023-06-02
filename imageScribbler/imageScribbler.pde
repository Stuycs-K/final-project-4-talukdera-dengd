import java.util.*;
ArrayList<int[]> indivPixels = new ArrayList<int[]>();
ArrayList<File> images = new ArrayList<File>();
Edit edit = new Edit();
Sketch sketch = new Sketch();
hideImages hide = new hideImages();
ColorPlanes colorplanes = new ColorPlanes();
//hide.method
// other classes
int save2RectX, save2RectY;
int save2RectWidth = 150;
int save2RectHeight = 50;
boolean overSave2;
int newHeight;
int newWidth;

int drawRectX, drawRectY;
int drawRectWidth = 200;
int drawRectHeight = 70;
boolean overDraw;

int compressRectX, compressRectY;
int compressRectWidth = 200;
int compressRectHeight = 70;
boolean overCompress;

int selectAnotherImageRectX, selectAnotherImageRectY;
int selectAnotherImageRectWidth = 250;
int selectAnotherImageRectHeight = 50;
boolean overAnotherImage;

int leftRectX, leftRectY;
int leftRectSize = 50;
boolean overLeft;

int rightRectX, rightRectY;
int rightRectSize = 50;
boolean overRight;

int saveRectX, saveRectY;
int saveRectWidth = 150;
int saveRectHeight = 50;
boolean overSave;

int modifyRectX, modifyRectY;
int modifyRectWidth = 150;
int modifyRectHeight = 50;
boolean overModify;

boolean draw_mode=false; //0 for not drawing, 1 for drawing

int rectColor;
int highlightColor;

int page;
String[] modes = {"original","red","green","blue","gray","redBit","greenBit","blueBit"};
int plane = 7;
int modeCounter = 0;

// Image Files
PImage img;
File selected;
int first = 0;

void setup() {
  size(1200, 650);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  rectColor = color(0);
  highlightColor = color(51);
  
  drawRectX = width / 2 - 200; 
  drawRectY = height / 2;
  overDraw = false;
  
  compressRectX = width / 2 + 200;
  compressRectY = height / 2;
  overCompress = false;
  
  selectAnotherImageRectX = selectAnotherImageRectWidth / 2;
  selectAnotherImageRectY = height - selectAnotherImageRectHeight / 2;
  overAnotherImage = false;
  
  leftRectX = width / 2 - leftRectSize / 2;
  leftRectY = height - leftRectSize / 2;
  overLeft = false;
  
  rightRectX = width / 2 + rightRectSize / 2;
  rightRectY = height - rightRectSize / 2;
  overRight = false;
  
  saveRectX = width - modifyRectWidth - saveRectWidth / 2; //replace with draw/stop button width later
  saveRectY = height - saveRectHeight / 2;
  overSave = false;
  
  modifyRectX = width - modifyRectWidth / 2;
  modifyRectY = height - modifyRectHeight / 2;
  overModify = false;
  
  
  save2RectX = width - save2RectWidth / 2;
  save2RectY = height - save2RectHeight / 2;
  overSave2 = false;
  
  
  
  page = 0;
  draw_mode = false;
}
 
void draw() {
  delay(150);
  
  stroke(255);
  if (page == 0) {
    update(mouseX, mouseY);
    if (overDraw) {
      fill(highlightColor);
    }
    else {
      fill(rectColor);
    }
    rect(drawRectX, drawRectY, drawRectWidth, drawRectHeight);
    
    if (overCompress) {
      fill(highlightColor);
    }
    else {
      fill(rectColor);
    }
    rect(compressRectX, compressRectY, compressRectWidth, compressRectHeight);
    fill(255);
    text("DRAW", drawRectX, drawRectY);
    text("COMPRESS", compressRectX, compressRectY);
  } else if (page == 1 & img != null) {
    
    update1(mouseX, mouseY);
    if (overAnotherImage) {
      fill(highlightColor);
    }
    else {
      fill(rectColor);
    }
    rect(selectAnotherImageRectX, selectAnotherImageRectY, selectAnotherImageRectWidth, selectAnotherImageRectHeight);
    if (overLeft) {
      fill(highlightColor);
      fill(highlightColor);
      if (mousePressed){
        if (draw_mode) {
         draw_mode = false;
        if (modeCounter == 5) {
          edit.writeRedPlane(img,plane,indivPixels);
        } else if (modeCounter == 6) {
          edit.writeGreenPlane(img,plane,indivPixels);
        } else {
          edit.writeBluePlane(img,plane,indivPixels);
        }
        
        indivPixels.clear();
        }
        
        if (modeCounter >= 5 & modeCounter <= modes.length-1){ // this advances the plane and modeCounter
        if (plane < 7) {
          plane++;
        } else {
          plane = 0;
          if (modeCounter == 0) {
            modeCounter = modes.length-1;
          } else {
            modeCounter --;
          }
        }    
      } else if (modeCounter == 0) {
        modeCounter = modes.length -1;
      } else {
        modeCounter --;
      }
      }
    }
    else {
      fill(rectColor);
    }
    rect(leftRectX, leftRectY, leftRectSize, leftRectSize);
    if (overRight) { // Arrow functionality
      fill(highlightColor);
      if (mousePressed){
        if (draw_mode) {
         draw_mode = false;
         if (modeCounter == 5) {
          edit.writeRedPlane(img,plane,indivPixels);
        } else if (modeCounter == 6) {
          edit.writeGreenPlane(img,plane,indivPixels);
        } else {
          edit.writeBluePlane(img,plane,indivPixels);
        }
        indivPixels.clear();
        }
        
        if (modeCounter >= 5 & modeCounter <= modes.length-1){ // this advances the plane and modeCounter
        if (plane > 0) {
          plane--;
        } else {
          plane = 7;
          if (modeCounter == modes.length -1) {
            modeCounter = 0;
          } else {
            modeCounter ++;
          }
        }    
      } else {
        modeCounter ++;
      }
      }
      
    }
    else {
      fill(rectColor);
    }
    rect(rightRectX, rightRectY, rightRectSize, rightRectSize);
    if (overSave) {
      fill(highlightColor);
      if (mousePressed) {
        img.save("saved");
      }
    }
    else {
      fill(rectColor);
    }
    rect(saveRectX, saveRectY, saveRectWidth, saveRectHeight);
    if (overModify) {
      fill(highlightColor);
      
      if (mousePressed & !draw_mode){
        draw_mode = true;
        if (!(modeCounter >= 5 & modeCounter <= modes.length-1)) {
          modeCounter = 5;
        }
        
        if (modeCounter == 5) {
          edit.clearRedPlane(img,plane);
          colorplanes.redBitPlane(img,plane);
        } else if (modeCounter == 6) {
          edit.clearGreenPlane(img,plane);
          colorplanes.greenBitPlane(img,plane);
        } else {
          edit.clearBluePlane(img,plane);
          colorplanes.blueBitPlane(img,plane);
        }
      } else if (mousePressed) {
        draw_mode = false;
        if (modeCounter == 5) {
          edit.writeRedPlane(img,plane,indivPixels);
        } else if (modeCounter == 6) {
          edit.writeGreenPlane(img,plane,indivPixels);
        } else {
          edit.writeBluePlane(img,plane,indivPixels);
        }
        indivPixels.clear();
      }
    }
    else {
      fill(rectColor);
    }
    if (!draw_mode & modeCounter >= 5 & modeCounter <= modes.length-1){
        if (modeCounter == 5) {
          colorplanes.redBitPlane(img,plane);
        } else if (modeCounter == 6) {
          colorplanes.greenBitPlane(img,plane);
        } else {
          colorplanes.blueBitPlane(img,plane);
        }
      } else if (!draw_mode) {
        if (modeCounter == 0){
           image(img,0,0);
        } else if (modeCounter == 1) {
           colorplanes.redPlane(img);
        } else if (modeCounter == 2) {
          colorplanes.greenPlane(img);
        } else if (modeCounter == 3) {
          colorplanes.bluePlane(img);
        } else if (modeCounter == 4) {
          colorplanes.greyPlane(img);
        }
    }
    rect(modifyRectX, modifyRectY, modifyRectWidth, modifyRectHeight);
    fill(255);
    text("SELECT ANOTHER IMAGE", selectAnotherImageRectX, selectAnotherImageRectY);
    text("<", leftRectX, leftRectY);
    text(">", rightRectX, rightRectY);
    text("SAVE", saveRectX, saveRectY);
    if (!draw_mode){
      text("DRAW", modifyRectX, modifyRectY);
    } else {
      text("STOP", modifyRectX, modifyRectY);
    }
    
     //add conditional here for draw mode
  
  } else if (img != null & page == 2) { 
        
        update2(mouseX, mouseY);
        if (overSave2) {
      fill(highlightColor);
      if (mousePressed) {
        img.save("saved");
      }
    }
    else {
      fill(rectColor);
    }
    
    if (overLeft) {
      fill(highlightColor);
      fill(highlightColor);
      if (mousePressed){
        if (draw_mode) {
         draw_mode = false;
        if (modeCounter == 5) {
          edit.writeRedPlane(img,plane,indivPixels);
        } else if (modeCounter == 6) {
          edit.writeGreenPlane(img,plane,indivPixels);
        } else {
          edit.writeBluePlane(img,plane,indivPixels);
        }
        
        indivPixels.clear();
        }
        
        if (modeCounter >= 5 & modeCounter <= modes.length-1){ // this advances the plane and modeCounter
        if (plane < 7) {
          plane++;
        } else {
          plane = 0;
          if (modeCounter == 0) {
            modeCounter = modes.length-1;
          } else {
            modeCounter --;
          }
        }    
      } else if (modeCounter == 0) {
        modeCounter = modes.length -1;
      } else {
        modeCounter --;
      }
      }
    }
    else {
      fill(rectColor);
    }
    rect(leftRectX, leftRectY, leftRectSize, leftRectSize);
    if (overRight) { // Arrow functionality
      fill(highlightColor);
      if (mousePressed){
        if (draw_mode) {
         draw_mode = false;
         if (modeCounter == 5) {
          edit.writeRedPlane(img,plane,indivPixels);
        } else if (modeCounter == 6) {
          edit.writeGreenPlane(img,plane,indivPixels);
        } else {
          edit.writeBluePlane(img,plane,indivPixels);
        }
        indivPixels.clear();
        }
        
        if (modeCounter >= 5 & modeCounter <= modes.length-1){ // this advances the plane and modeCounter
        if (plane > 0) {
          plane--;
        } else {
          plane = 7;
          if (modeCounter == modes.length -1) {
            modeCounter = 0;
          } else {
            modeCounter ++;
          }
        }    
      } else {
        modeCounter ++;
      }
      }
      
    }
    else {
      fill(rectColor);
    }
    
    if (!draw_mode & modeCounter >= 5 & modeCounter <= modes.length-1){
        if (modeCounter == 5) {
          colorplanes.redBitPlane(img,plane);
        } else if (modeCounter == 6) {
          colorplanes.greenBitPlane(img,plane);
        } else {
          colorplanes.blueBitPlane(img,plane);
        }
      } else if (!draw_mode) {
        if (modeCounter == 0){
           image(img,0,0);
        } else if (modeCounter == 1) {
           colorplanes.redPlane(img);
        } else if (modeCounter == 2) {
          colorplanes.greenPlane(img);
        } else if (modeCounter == 3) {
          colorplanes.bluePlane(img);
        } else if (modeCounter == 4) {
          colorplanes.greyPlane(img);
        }
    }
    
    rect(rightRectX, rightRectY, rightRectSize, rightRectSize);
    
        rect(save2RectX, save2RectY, save2RectWidth, save2RectHeight);
        fill(255);
        text("SELECT ANOTHER IMAGE", selectAnotherImageRectX, selectAnotherImageRectY);
        text("<", leftRectX, leftRectY);
        text(">", rightRectX, rightRectY);
        text("SAVE", save2RectX, save2RectY);
   }
  
  
}

void update(int x, int y) {
  if ( overRect(drawRectX - drawRectWidth / 2, drawRectY - drawRectHeight / 2, drawRectWidth, drawRectHeight) ) {
    overDraw = true;
    overCompress = false;
  } 
  else if ( overRect(compressRectX - compressRectWidth / 2, compressRectY - compressRectHeight / 2, compressRectWidth, compressRectHeight) ) {
    overDraw = false;
    overCompress = true;
  }
  else {
    overDraw = false;
    overCompress = false;
  }
}

void update1(int x, int y) {
  if ( overRect(selectAnotherImageRectX - selectAnotherImageRectWidth / 2, selectAnotherImageRectY - selectAnotherImageRectHeight / 2, selectAnotherImageRectWidth, selectAnotherImageRectHeight) ) {
    overAnotherImage = true;
    overLeft = false;
    overRight = false;
    overSave = false;
    overModify = false;
  }
  else if ( overRect(leftRectX - leftRectSize / 2, leftRectY - leftRectSize / 2, leftRectSize, leftRectSize) ) {
    overAnotherImage = false;
    overLeft = true;
    overRight = false;
    overSave = false;
    overModify = false;
  }
  else if ( overRect(rightRectX - rightRectSize / 2, rightRectY - rightRectSize / 2, rightRectSize, rightRectSize) ) {
    overAnotherImage = false;
    overLeft = false;
    overRight = true;
    overSave = false;
    overModify = false;
  }
  else if ( overRect(saveRectX - saveRectWidth / 2, saveRectY - saveRectHeight / 2, saveRectWidth, saveRectHeight) ) {
    overAnotherImage = false;
    overLeft = false;
    overRight = false;
    overSave = true;
    overModify = false;
  }
  else if ( overRect(modifyRectX - modifyRectWidth / 2, modifyRectY - modifyRectHeight / 2, modifyRectWidth, modifyRectHeight) ) {
    overAnotherImage = false;
    overLeft = false;
    overRight = false;
    overSave = false;
    overModify = true;
  }
  else {
    overAnotherImage = false;
    overLeft = false;
    overRight = false;
    overSave = false;
    overModify = false;
  }
}

void update2(int x, int y) {
  if ( overRect(selectAnotherImageRectX - selectAnotherImageRectWidth / 2, selectAnotherImageRectY - selectAnotherImageRectHeight / 2, selectAnotherImageRectWidth, selectAnotherImageRectHeight) ) {
    overAnotherImage = true;
    overLeft = false;
    overRight = false;
    overSave2 = false;
  }
  else if ( overRect(leftRectX - leftRectSize / 2, leftRectY - leftRectSize / 2, leftRectSize, leftRectSize) ) {
    overAnotherImage = false;
    overLeft = true;
    overRight = false;
    overSave2 = false;
  }
  else if ( overRect(rightRectX - rightRectSize / 2, rightRectY - rightRectSize / 2, rightRectSize, rightRectSize) ) {
    overAnotherImage = false;
    overLeft = false;
    overRight = true;
    overSave2 = false;
  }
  else if ( overRect(save2RectX - save2RectWidth / 2, save2RectY - save2RectHeight / 2, save2RectWidth, save2RectHeight) ) {
    overAnotherImage = false;
    overLeft = false;
    overRight = false;
    overSave2 = true;
  }
  else {
    overAnotherImage = false;
    overLeft = false;
    overRight = false;
    overSave2 = false;
  }
}

void mousePressed() {
  if (page == 0) {
    if (overDraw) {
      selectInput("Select Image...", "imageSelected");
    } else if (overCompress) {
      selectFolder("Select Folder...", "folderSelected");
      page = 2;
    }
  }
  else if (page == 1) {
    if (overAnotherImage) {
      selectInput("Select Another Image...", "imageSelected");
    }   
  }
}

void mouseDragged() 
{
  if (page != 1) {
  
  } else if (page==1 & draw_mode & mouseX < img.width & mouseY < img.height){
  int[] temp = {mouseX,mouseY};
  indivPixels.add(temp);
  stroke(color(0,0,0));
    //noStroke();
  fill(0,0,0);
  ellipse(mouseX,mouseY,10,10);
  }
  
}

void imageSelected(File selection) {
  if (selection == null) {
    println("An image was not selected");
  }
  else {
    img = loadImage(selection.toString());
    modeCounter = 0;
    plane = 7;
    // We set up the img here properly
  }
}

void folderSelected(File selection) {
  if (selection == null) {
    println("An image was not selected");
  }
  else {
    if (selection.isDirectory()){
      for (File f: selection.listFiles()){
        if (f.isFile()){
          if (isImage(f.toString())){
            images.add(f);
          }
        }
      }
    }
    println(images);
  }
}

boolean isImage(String a){
  return a.endsWith("jpg") || a.endsWith("png") || a.endsWith("jpeg");
}


void maxDimensions(int x, int y) {
  int gcd = gcd(x, y);
  x /= gcd;
  y /= gcd;

  int maxScale = min(1000 / x, 600 / y);
  newWidth = x * maxScale;
  println(newWidth);
  newHeight = y * maxScale;
  println(newHeight);
}

int gcd(int x, int y) {
  if (x == 0 || y == 0) {
    return x + y;
  }
  return gcd(max(x, y) % min(x, y), min(x, y));
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
    return true;
  } 
  else {
    return false;
  }
}
