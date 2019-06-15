class OvenScreen extends PApplet {
  PImage ovenBG;
 
  boolean on = false;
  int temp;
  float timerTime;
  boolean farenheit = true;

   
  OvenScreen() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }

  void settings() {
    size(800, 531);
  }

  void setup() {
    smooth();
    frameRate(60);
  }

  void draw() {
   fill(0);
   noStroke();
   rect(355,95,60,15);
   
   if (on) {
   
    // Display temperature on screen
     stroke(color(200,0,0));
     fill (0);
     rect(355,95,60,15);
     fill(255,0,0);
     ellipseMode(CORNER);
     ellipse(357,95,5,5);

     fill(255,0,0);
     textSize(8);
     text(temp,367,108);
     
     // Display timer on screen
     fill(255);
     text(int(timerTime),390,108);
     text("Min",402,108);
     heat(temp);  
     
   } else {
    oven.turnOff();
   }
  }
  
  public void turnOn() {
    on = true;
    fill(255,0,0);
    ellipseMode(CORNER);
    ellipse(357,95,5,5);
    
  }
  
  public void turnOff() {
   on = false;
   fill(0,0,0);
   ellipseMode(CORNER);
   ellipse(357,95,5,5);
  }

  public void heat(int temp) {
    
    if (!farenheit) {
      if (temp <= 176 && temp >= 148) {
        stroke(color(150,0,0));
      } else if (temp <= 204 && temp > 176)  {
        stroke(color(200,0,0));
      } else if (temp <= 148  ) {
         stroke(color(100,0,0)); 
      } else {
        stroke(color(255,0,0)); 
      }
    } else {
      if (temp <= 350 && temp >= 300) {
        stroke(color(150,0,0));
      } else if (temp <= 400 && temp > 350)  {
        stroke(color(200,0,0));
      } else if (temp <= 300  ) {
         stroke(color(100,0,0)); 
      } else {
        stroke(color(255,0,0)); 
      }
    }

    
    line(301,337,316,318); 
    line(width/2,337,width/2,318);
    line(500,337,485,318);
    
  }
  
}
