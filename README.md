# magic black box

## overview

The Magic Black Box (MBB) is a project exploring wireless technology and homemade sensors. The black box has an on/off switch, and when you turn it on, it broadcasts a WiFi network. When you connect to the network, you receive the sensory data through udp, and this data is used to generate an interactive visual. The visualization is almost hypnotizing, as pulsing dots change color according to your capacative position on the piezo electric and the ambient light. The code for the ESP32 inside the MBB is in this repo, as well as the processing code for visualization.

## getting started

- construct the box according to the included photos and wiring diagram in the docs folder
- flash the esp32 with the included arduino code
- turn the box on and connect your computer to the broadcasted network
- run the included processing sketch while connected to the esp32's network

## videos of interaction

https://youtu.be/XHlyDXa3AS8
https://youtu.be/FBmVfL_YuNA
https://youtu.be/IC2cWhb9jpw

## credits

the visualization code is based on the following open processing sketch: https://www.openprocessing.org/sketch/170022 
