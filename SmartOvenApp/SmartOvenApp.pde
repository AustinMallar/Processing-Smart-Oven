import g4p_controls.*;

OvenScreen oven;
PImage phone;

boolean ovenPowerStatus = false;

// These controls will have animated icons
GButton powerButton;
GLabel label;

public void settings() {
  size(550, 790);
}

void setup() { 
  oven = new OvenScreen();
  phone = loadImage("phone.png");
  oven.ovenBG = loadImage("oven.jpg");
  powerButton = new GButton(this, 340, 180, 50, 50, "OFF");

}

void draw() {
  background(phone);
  oven.background(oven.ovenBG);
  fill(0);
  noStroke();
  if(ovenPowerStatus) {
    fill(color(255,0,0));
    ellipse(365,160,20,20);  
  } else {
    fill(255);
    ellipse(365,160,20,20); 
  }
  
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

void mousePressed() {
  println("mousePressed in primary window");
  float relPosX = map(mouseX, 0, this.width, 0, 100);
  float relPosY = map(mouseY, 0, this.height, 0, 100);
  oven.evokedFromPrimary(relPosX, relPosY);
}  
