import hypermedia.net.*;

int PORT = 57222;
String IP = "192.168.1.2";
// based off the open processing code: https://www.openprocessing.org/sketch/170022

float unit, theta;
int num=25, frames=180;
UDP udp;

int lightValue = 0;
int piezoValue = 0;

void setup() {
  //fullScreen();
  
  udp = new UDP(this, PORT, IP);
  udp.listen(true);
  size(1900, 1200);
  unit = width/num;
  colorMode(HSB);
}

void draw() {
  background(map(piezoValue, 2000, 4050, 0, 255), 255, 255);
  fill(0,30);
  noStroke();
  rect(0,0,width, height);
  fill(color(map(lightValue, 2000, 3000, 0, 255), 255, 255));
  for (int y=0; y<=num; y++) {
    for (int x=0; x<=num; x++) {
      float distance = dist(width/2, height/2, x*unit, y*unit);
      float offSet = map(distance, 0, sqrt(sq(width/2)+sq(height/2)), 0, TWO_PI);
      float sz = map(sin(theta+offSet), -1, 1, unit*.2, unit*.1);
      float angle = atan2(y*unit-height/2, x*unit-width/2);
      pushMatrix();
      translate(x*unit, y*unit);
      rotate(angle);
      float px = map(sin(theta+offSet),-1,1,0,50);
      ellipse(px,0, sz, sz);
      popMatrix();
    }
  }
  stroke(255);

  theta -= TWO_PI/frames;
}

void receive(byte[] data, String PORT, int IP) {
   String value = new String(data);
   lightValue = int(value.split(",")[0]);
   piezoValue = int(value.split(",")[1]);
   //print(lightValue);
   //println(piezoValue);
}
