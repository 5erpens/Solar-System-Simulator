/*This sketch scetches the solar system. The datas here are scaled form of accurate because i have this ristruction called monitor righr
 All the Space mathematical codes are taken from Github because I know nothing about Space Mathematics. 
 This is done by Sai Bharath. Yep that's me!!... by the help of Github, Fun Programming and Google... Thanks to Github, Fun Programming and Google.
 Github reference link "https://gist.github.com/ibtisamtauhidi/68f5fee3e1e0a00ec244" */
 
import processing.sound.*;
import java.util.Date;

// the radius of planets. Stored in arrays. These are scaled value of the originals. Highly Accurate. Taken from Github
float eccentricity[] = {0, 0.205, 0.007, 0.017, 0.094, 0.049, 0.057, 0.046, 0.011, 0.244};
float aphelion[] = {0.0, 69.8, 108.9, 152.1, 249.2, 816.6, 1514.5, 3003.6, 4545.7, 7304.3};
float inclination[] = {0.0, 7.0, 3.4, 0.0, 1.9, 1.3, 2.5, 0.8, 1.8, 17.2};
float bodyRadii[] = {0.0, 0.5, 0.7, 0.7, 0.6, 1.7, 1.5, 3, 3, 2};
float orbitPeriod[] = {0.0, 126720.0, 323568.0, 525888.0, 989280.0, 6380640.0, 15475680.0, 44048160.0, 86112000.0, 130446720.0};
float epoch[]={0.0, 13627665.75, 13630579.0, 13922899.58, 14241140.2, 18535221.46, 25301781.93, 20140822.57, 74731252.68, 75518933.97};

//This is the default screen value 
float camx = 0, camy = 0, scale = 1.0;
long ct;
int tr = 0;
int ff = 0;

//To make Sun rotating
float b;
//Texture image variables for planets
PImage S;
PImage [] img;
PShape globe;

//Class concept for planets and sun from the class ;)
planetn P; 
SoundFile file;
void setup() {
  //Class concept from class ;)
  P=new planetn();
  //Full screen with P3D.
  fullScreen(P3D); 
  S = loadImage("sun.jpg");

  img=new PImage[10];
  //Universe background image is downloaded from https://s-media-cache-ak0.pinimg.com/originals/29/05/b6/2905b6ce1a2064dc4e4513f193750024.jpg to local machine.
  img[0]= loadImage("Sky.jpg");
  //Planets images are downloaded from 'http://www.x3dom.org/x3dom/example/texture/solarSystem/' to local machine.
  img[1]= loadImage("Mercury.jpg");
  img[2]= loadImage("Venus.jpg");
  img[3]= loadImage("Earth.jpg");
  img[4]= loadImage("Mars.jpg");
  img[5]= loadImage("Saturn.jpg");
  img[6]= loadImage("Uranus.jpg");
  img[7]= loadImage("Neptune.jpg");
  img[8]= loadImage("Pluto.jpg");
  img[9]= loadImage("sun.jpg");

  //Background sound file is downloaded from https://freesound.org/people/Sonicfreak/sounds/174450/download/174450__sonicfreak__space-ambience.wav to local machine.
  file = new SoundFile(this, "SW.mp3");
  file.play();
  textureMode(REPEAT);
  //I'm using this smooth method for my satisfection. as you see there's no edges here so no use. 
  smooth();
}

void draw() {
  //This is to set the planet's current timings.
  incrTime();
  //Universe background image is downloaded from https://s-media-cache-ak0.pinimg.com/originals/29/05/b6/2905b6ce1a2064dc4e4513f193750024.jpg to local machine.
  background(img[0]); 
  //The below line is to bring the screen to the center of the sketch.
  translate(width/2, height/2, 0); 

  // These 3 lines set the default position.
  scale(scale);
  rotateX(camx);
  rotateY(camy);

  //Adding sun texture. Image is taken from Google Images.
  P.sun();

  //All the Space mathematics used in this sketck is taken from Github.
  for (int planet=1; planet<10; planet++) {
    pushMatrix();
    rotateZ(radians(inclination[planet]));
    // This method is for the distance of one orbit of the planet to another and the angle at which it is tilted and scale it to the moniter size, so it's highly accurate. taken from Github.Method is called from the class planetn
    P.dist_angle_Orbit(planet);
    // This method is to create the planet. Method is called from the class planetn.
    P.planet_create(planet); 
    popMatrix();
  }
}



// This method changes the parameter of the camera using user's keyboard

void keyPressed() {
  if (key == 'Q' || key == 'q') {
    scale+=0.05;
  } else if (key == 'E' || key == 'e') {
    if (scale>0.05) scale-=0.25;
  } else if (key == 'A' || key == 'a') {
    camy-=0.05;
  } else if (key == 'D' || key == 'd') {
    camy+=0.05;
  } else if (key == 'W' || key == 'w') {
    camx+=0.05;
  } else if (key == 'S' || key == 's') {
    camx-=0.05;
  } else if (key == 'R' || key == 'r') {
    tr = 0;
    ff = 0;
  } else if (key == 'L' || key == 'l') {
    if (tr<9) {
      tr++;
      ff = 1;
      incrTime();
    }
  } else if (key == 'J' || key == 'j') {

    if (tr>-9) {
      tr--;
      ff = 1;
      incrTime();
    }
  }
}


// This method updates the current time of the application. Taken from Github

void incrTime() {

  Date d = new Date();
  long x = d.getTime()/1000;
  long appTime;

  switch(tr) {
  case 0:
    if (ff==1) {
      appTime = ct*60;
      break;
    } else if (ff==0) {
      appTime = x;
      ct = x/60;
      break;
    }

  case 1:
    ct+=130;        
    appTime = ct*60;
    break;

  case 2:
    ct+=400;        
    appTime = ct*60;
    break;

  case 3:
    ct+=625;        
    appTime = ct*60;
    break;  

  case 4:
    ct+=1250;        
    appTime = ct*60;
    break;

  case 5:
    ct+=2500;        
    appTime = ct*60;
    break;

  case 6:
    ct+=5000;        
    appTime = ct*60;
    break;

  case 7:
    ct+=10000;        
    appTime = ct*60;
    break;

  case 8:
    ct+=20000;        
    appTime = ct*60;
    break;

  case 9:
    ct+=40000;        
    appTime = ct*60;
    break;                

  case -1:
    ct-=130;        
    appTime = ct*60;
    break;

  case -2:
    ct-=400;        
    appTime = ct*60;
    break;

  case -3:
    ct-=625;        
    appTime = ct*60;
    break;

  case -4:
    ct-=1250;        
    appTime = ct*60;
    break;

  case -5:
    ct-=2500;        
    appTime = ct*60;
    break;

  case -6:
    ct-=5000;        
    appTime = ct*60;
    break;

  case -7:
    ct-=10000;        
    appTime = ct*60;
    break;

  case -8:
    ct-=20000;        
    appTime = ct*60;
    break;

  case -9:
    ct-=40000;        
    appTime = ct*60;
    break;
  }
}