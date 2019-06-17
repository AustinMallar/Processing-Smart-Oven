// Code for creating a star shape in Processing referenced from https://processing.org/tutorials/pshape/

class PresetButton {
  PShape s;
  int xpos, ypos;
  boolean active = false;
  String presetNum;
  
  PresetButton(String num, int x, int y) {
  xpos = x;
  ypos = y;
  presetNum = num;
  }
  
  public void display() {
    pushMatrix();
    translate(xpos, ypos);
    if (active) {
     fill(255,255,0); 
    } else {
      fill(0);
    }
      
    stroke(255,255,0);
    strokeWeight(2);
    beginShape();
    scale(0.35);
    vertex(0, -50);
    vertex(14, -20);
    vertex(47, -15);
    vertex(23, 7);
    vertex(29, 40);
    vertex(0, 25);
    vertex(-29, 40);
    vertex(-23, 7);
    vertex(-47, -15);
    vertex(-14, -20);
    endShape(CLOSE);
    if(active) {
     fill(0); 
    } else {
      fill(255);
    }
    text(presetNum,-10,10);
    popMatrix();
  }
  
}
