#include <Arduino.h>

unsigned counter = 0;

unsigned pin = PD14;

void my_delay(unsigned ms){
    delay(ms);
}

void setup(){
    pinMode(pin, OUTPUT);
}

void loop(){
    counter++;
    digitalWrite(pin, HIGH);
    my_delay(1000);
    digitalWrite(pin, LOW);
    my_delay(1000);
}

