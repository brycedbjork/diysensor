#include <WiFi.h>
#include <WebServer.h>
#include <WiFiUdp.h>


/* Put your SSID & Password */
const char* ssid = "Bryce_ESP32";  // Enter SSID here
const char* password = "12345678";  //Enter Password here
char* lightString;
char* piezoString;

float lightValue = 0;
float piezoValue = 0;

/* Put IP Address details */
IPAddress local_ip(192,168,1,1);
IPAddress gateway(192,168,1,1);
IPAddress subnet(255,255,255,0);

WebServer server(80);

WiFiUDP udp;

void setup() {
  Serial.begin(115200);

  WiFi.softAP(ssid, password);
  WiFi.softAPConfig(local_ip, gateway, subnet);
  
    server.begin();
}

void loop(){
  
    lightValue = analogRead(33);
    piezoValue = analogRead(34);

//    Serial.print(lightValue);
//    Serial.print(",");
//    Serial.print(piezoValue);
//    Serial.print('\n');


    udp.beginPacket("192.168.1.2",57222);
    udp.print(String(lightValue)+","+String(piezoValue));
//    udp.print(String(lightValue));
    udp.endPacket();
  
  //Wait for 1 second
  delay(100);
  
}
