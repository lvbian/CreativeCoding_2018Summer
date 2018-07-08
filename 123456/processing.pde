import processing.serial.*; //<>// //<>// //<>//

Serial myPort;

PFont myFont;

PImage myImg;
int spotX[];
int spotY[];
float spotR;

//parseBoolean()
void setup() {
  myPort = new Serial(this, "COM3", 9600);
  size(1280, 960);
  background(0); 
  myImg = loadImage("415.jpg");
  image(myImg, 0, 0);
  spotX= new int [7] ;
  spotY= new int [7] ;
  for (int i = 0; i<7; i++) {
    spotX[i]=150+i*150;
    spotY[i]=(int)random(100, 860);
  }
}

void draw() {
  frameRate(12);
  println(mouseX + " : " + mouseY);
  elliColor();
  keyPressed();
}

void elliColor() {
  for (int i = 5; i <12; i++) {
    stroke(240, 240, 245, random(100, 200));
    for (int r = 1; r <5; r++) {
      strokeWeight(r*2);
      noFill();
      spotR =20*(i+r);
      ellipse(spotX[i-5], spotY[i-5], spotR, spotR);
    }
    if (mousePressed) {
      if ( dist(mouseX, mouseY, spotX[i-5], spotY[i-5])<i*20+80) {
        myPort.write(i-4);
      }
    } else {
      myPort.write(0);
    }
    myFont = createFont("微软雅黑", 24);
    textFont(myFont);
    textAlign(CENTER, CENTER);
    text(i-4, spotX[i-5], spotY[i-5]);
  }
}

void keyPressed() {
  redraw();
  if (key == '1') {
    myPort.write(1);
    delay(30);
  } else {
    myPort.write(0);
  }
  if (key == '2') {
    myPort.write(2);
    delay(30);
  } else {
    myPort.write(0);
  }
  if (key == '3') {
    myPort.write(3);
    delay(30);
  } else {
    myPort.write(0);
  }
  if (key == '4') {
    myPort.write(4);
    delay(30);
  } else {
    myPort.write(0);
  }
  if (key == '5') {
    myPort.write(5);
    delay(30);
  } else {
    myPort.write(0);
  }
  if (key == '6') {
    myPort.write(6);
    delay(30);
  } else {
    myPort.write(0);
  }
  if (key == '7') {
    myPort.write(7);
    delay(30);
  } else {
    myPort.write(0);
  }
}

void keyReleased() {
    myPort.write(0);
}
