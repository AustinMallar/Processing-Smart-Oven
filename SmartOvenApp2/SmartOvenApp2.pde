import g4p_controls.*;

OvenScreen oven;
PImage phone;
PImage lockIcon;
PresetButton preset1, preset2;

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
GKnob timerKnob, tempKnob;

public void settings() {
 size(790, 550);
}

void setup() {
 preset1 = new PresetButton("1", 637,304);
 preset2 = new PresetButton("2", 637,354);
 String files[];
 oven = new OvenScreen();
 lockIcon = loadImage("lockButton.png");
 phone = loadImage("phone.png");
 oven.ovenBG = loadImage("oven.jpg");
 oven.background(oven.ovenBG);

 powerButton = new GButton(this, 620, 180, 50, 50, "OFF");
 
 timerKnob = new GKnob(this, 155, 310, 50, 50, 01f);
 timerKnob.setLimits(0, 240);

 tempKnob = new GKnob(this,295,310,50,50,01f);
 tempKnob.setLimits(150,560);

 files = new String[] {
  "lockButton.png"
 };
 
 lockButton = new GImageButton(this, 570, 340, files, "lockButton.png");

 files = new String[] {
  "unitChangeButton.png"
 };
 
 changeUnitsButton = new GImageButton(this, 570, 290, files, "unitChangeButton.png");

}

void draw() {

 temp = tempKnob.getValueI();
 background(phone);

 fill(0);
 noStroke();
 if (ovenPowerStatus) {
   // Power on light
  fill(color(255, 0, 0));
  ellipse(645, 160, 20, 20);
 } else {
  // Power off light 
  fill(255);
  ellipse(645, 160, 20, 20);
 }
 rectMode(CENTER);
 fill(255);

 rect(175, 250, 120, 50);
 rect(315, 250, 120, 50);
 textMode(CENTER);
 textSize(30);
 fill(255);
 text("TIME",136,210);
 text("TEMP",273,210);


 if (ovenPowerStatus) {
   //Oven is on
  fill(0);
  textSize(30);
  textAlign(CENTER);
  text(int(timerTime), 160, 265); //Timer text
  text(temp, 305, 265); //Temp text
  
  textSize(24);
  textAlign(LEFT);
  text("Min", 190, 265);
  
  textSize(10);
  text(degreeSymbol, 335, 245);
  textSize(24);
  text(units, 340, 265);  
  
  oven.temp=temp; // Send temperature to oven.
  oven.timerTime = timerTime; // Send timer to oven.
 } else {
   //Oven is off
   oven.background(oven.ovenBG);
 }
 
 preset1.display();
 preset2.display();
 
}

public void lockOven() {
   if (locked) {
    
     locked = false;
   } else {
     
      locked = true;
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
 if (mouseX >= 570 && mouseX <= 602) {
  if (mouseY >= 290 && mouseY <= 322) {
   if (farenheit) {
    temp = floor((temp - 32) * 5 / 9);
    tempKnob.setLimits(temp, 90, 260);
    tempKnob.setValue(temp);
    farenheit = false;
    oven.farenheit = false;
    units = "C";
   } else {
    temp = ceil(temp * 9 / 5 + 32);
    tempKnob.setLimits(150,560);
    tempKnob.setValue(temp);

    farenheit = true;
    oven.farenheit = true;
    units = "F";
   }
  }
 }

 // Handle oven lock button press
  if (mouseX >= 150 && mouseX <= 182) {
  if (mouseY >= 140 && mouseY <= 172) {
   lockOven();
  }
 }
 
  // Preset1 click handle
  if (mouseX>=618 && mouseX <=651) {
   if (mouseY>=286 && mouseY <=320) {
       //Handle preset: if left clicked, activates the preset. If right clicked, sets the preset to the current temperature and time.
        if (mouseButton == LEFT) {
          if(preset1.active) {
            preset1.active = false;
            preset2.active = false;
          } else {
            preset1.active = true;
            preset2.active = false;
          }
          
        } else if (mouseButton == RIGHT) {
          
        } else {
        
        }
   }
  }
  
  // Preset2 click handle
  if (mouseX>=618 && mouseX <=651) {
   if (mouseY>=337 && mouseY <=370) {
       //Handle preset: if left clicked, activates the preset. If right clicked, sets the preset to the current temperature and time.
        if (mouseButton == LEFT) {
          if(preset2.active) {
            preset2.active = false;
            preset1.active = false;
          } else {
            preset2.active = true;
            preset1.active = false;
          }
          
        } else if (mouseButton == RIGHT) {
          
        } else {
        
        }
   }
  }

}
