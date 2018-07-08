int a_data = 0;
int tonePin = 9;
int NOTE_DL[] = { -1, 147, 165, 175, 196, 221, 248, 278};

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(tonePin, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  if (Serial.available() > 0) {
    a_data = Serial.read();
    for (int i = 1; i < 8; i++) {
      if (a_data == i) {
        tone(tonePin, NOTE_DL[i]);
        delay(1000);
      } else {
        tone(tonePin, NOTE_DL[0]);
      }
    }
  }
}
