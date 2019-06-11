OvenScreen oven;
PImage phone;

public void settings() {
  size(550, 790);
}

void setup() { 
  oven = new OvenScreen();
  phone = loadImage("phone.png");
  oven.ovenBG = loadImage("oven.jpg");
}

void draw() {
  background(phone);
  oven.background(oven.ovenBG);
  fill(0);
  noStroke();
  
}

void mousePressed() {
  println("mousePressed in primary window");
  float relPosX = map(mouseX, 0, this.width, 0, 100);
  float relPosY = map(mouseY, 0, this.height, 0, 100);
  oven.evokedFromPrimary(relPosX, relPosY);
}  
