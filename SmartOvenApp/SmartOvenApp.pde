import g4p_controls.*;

OvenScreen oven;
PImage phone;
PImage lockIcon;

boolean ovenPowerStatus = false;
boolean locked = false;
float timerTime;
int temp;
String degreeSymbol = "o";
String units = "F";

boolean farenheit = true;

// These controls will have animated icons
GButton powerButton;
GImageButton lockButton, changeUnitsButton;
GKnob timerKnob;
GCustomSlider tempSlider;

public void settings() {
 size(790, 550);

}

void setup() {
 String files[];
 oven = new OvenScreen();
 lockIcon = loadImage("lockButton.png");
 phone = loadImage("phone.png");
 oven.ovenBG = loadImage("oven.jpg");
 oven.background(oven.ovenBG);
 powerButton = new GButton(this, 620, 220, 50, 50, "OFF");
 timerKnob = new GKnob(this, 115, 143, 30, 30, 01f);
 timerKnob.setLimits(0, 240);

 files = new String[] {
  "lockButton.png"
 };
 lockButton = new GImageButton(this, 155, 140, files, "lockButton.png");

 files = new String[] {
  "unitChangeButton.png"
 };
 changeUnitsButton = new GImageButton(this, 200, 140, files, "unitChangeButton.png");

 tempSlider = new GCustomSlider(this, 115, 180, 140, 50, null);


 tempSlider.setShowDecor(false, true, true, true);
 tempSlider.setNbrTicks(5);
 tempSlider.setLimits(350, 150, 560);


}

void draw() {
 temp = tempSlider.getValueI();
 background(phone);
 fill(0);
 noStroke();
 if (ovenPowerStatus) {
  fill(color(255, 0, 0));
  ellipse(640, 200, 20, 20);
 } else {
  fill(255);
  ellipse(640, 200, 20, 20);
 }
 rectMode(CENTER);
 fill(255);

 rect(width / 2, height / 2 - 50, 200, 80);
 rect(width / 2, height / 2 + 70, 300, 100);

 if (ovenPowerStatus) {
  fill(0);
  textSize(60);
  textAlign(CENTER);
  text(int(timerTime), width / 2, height / 2 + 90); //Timer text
  textSize(48);
  text(temp, width / 2, height / 2 - 30); //Temp text

  textAlign(LEFT);
  textSize(16);
  text(degreeSymbol, width / 2 + 40, height / 2 - 65);
  textSize(48);
  text(units, width / 2 + 50, height / 2 - 30);
  text("Min", width / 2 + 50, height / 2 + 90);
  
  oven.temp=temp; // Send temperature to oven.
  oven.timerTime = timerTime; // Send timer to oven.
 }

}


public void handleButtonEvents(GButton source, GEvent event) {
 if (source == powerButton)

  if (ovenPowerStatus) {
   powerButton.setText("OFF");
   ovenPowerStatus = false;
   oven.on = false;

  } else {
   powerButton.setText("ON");
   ovenPowerStatus = true;
   oven.on = true;
  }

}



public void handleKnobEvents(GValueControl knob, GEvent event) {

 if (timerKnob == knob)
  timerTime = int(knob.getValueS());
 println(timerTime);

}

void mousePressed() {

 // Handle units change button press
 if (mouseX >= 200 && mouseX <= 232) {
  if (mouseY >= 140 && mouseY <= 172) {
   if (farenheit) {
    temp = (temp - 32) * 5 / 9;
    tempSlider.setLimits(temp, 90, 260);
    farenheit = false;
    oven.farenheit = false;
    units = "C";
   } else {
    temp = temp * 9 / 5 + 32;
    tempSlider.setLimits(temp, 150, 560);
    farenheit = true;
    oven.farenheit = true;
    units = "F";
   }
  }
 }

 // Handle oven lock button press
  if (mouseX >= 150 && mouseX <= 182) {
  if (mouseY >= 140 && mouseY <= 172) {
   if (locked) {
    locked = false;
   } else {
     locked=true;
   }
  }
 }

}
