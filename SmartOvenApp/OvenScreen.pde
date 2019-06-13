class OvenScreen extends PApplet {
  PImage ovenBG;
  String time;
  
  OvenScreen() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }

  void evokedFromPrimary(float relPosX, float relPosY) {
    float xPos = map(relPosX, 0, 100, 0, this.width);
    float yPos = map(relPosY, 0, 100, 0, this.height);

 
  }
  void settings() {
    size(800, 531);
  }

  void setup() {
   time = " ";
  }

  void draw() {
    text(time,200,200);
  }

  void mousePressed() {
    println("mousePressed in secondary window");
  }
}
