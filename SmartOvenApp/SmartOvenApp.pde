import g4p_controls.*;

OvenScreen oven;
PImage phone;

boolean ovenPowerStatus = false;
float timerTime;

// These controls will have animated icons
GButton powerButton;
GKnob timerKnob;
GLabel label;

public void settings() {
  size(790, 550);
}

void setup() { 
  oven = new OvenScreen();
  phone = loadImage("phone.png");
  oven.ovenBG = loadImage("oven.jpg");
  powerButton = new GButton(this, 620, 220, 50, 50, "OFF");
  timerKnob = new GKnob(this, 115, 140, 30, 30, 01f); 
}

void draw() {
  background(phone);
  oven.background(oven.ovenBG);
  fill(0);
  noStroke();
  if(ovenPowerStatus) {
    fill(color(255,0,0));
    ellipse(640,200,20,20);  
  } else {
    fill(255);
    ellipse(640,200,20,20); 
  }
  rectMode(CENTER);
  fill(255);
  
  rect(width/2,height/2 - 50,200,80);
  rect(width/2,height/2 +70,300,100);
  
  text(timerTime,width/2,height/2 + 70); //Timer text

  
}

public void handleButtonEvents(GButton source, GEvent event) { 
  if (source == powerButton)
    
    if (ovenPowerStatus) {
        powerButton.setText("OFF");
        ovenPowerStatus = false;
        
    } else {
        powerButton.setText("ON");
        ovenPowerStatus = true;
    }
    
}

public void handleKnobEvents(GValueControl knob, GEvent event) { 

  if (timerKnob == knob)
    timerTime = 100 * float(knob.getValueS());
    timerTime = floor(timerTime);
    println(timerTime);
    
}

void mousePressed() {
  println("mousePressed in primary window");
  float relPosX = map(mouseX, 0, this.width, 0, 100);
  float relPosY = map(mouseY, 0, this.height, 0, 100);
  oven.evokedFromPrimary(relPosX, relPosY);
}  
