class planetn
{ 
  //Creating Sun
  void sun()
  {
    noFill();
    noStroke();  
    globe = createShape(SPHERE, 10); 
    globe.setTexture(S);
    shape(globe);
    
  }
  //Creating Planets
  void planet_create(int id) {
    //These 10 lines below are mathematical things which takes the actual diameter of the planet and scale it to the moniter size, so it's highly accurate. taken from Github. 
    float timeDiff = ct - epoch[id];
    if (timeDiff<0) timeDiff-=orbitPeriod[id];        
    float i = ((2*PI)/orbitPeriod[id])*timeDiff;
    i= (2*PI)-i;
    float circumference = 2*PI;
    float a = aphelion[id]/3;
    float e = eccentricity[id];
    float r = (a*(1-(e*e)))/(1-(e*cos(i)));
    float x = r*cos(i);
    float y = r*sin(i);

    pushMatrix();
    translate(x, y, 0);
    noStroke();

    globe = createShape(SPHERE, bodyRadii[id]*4);
    globe.setTexture(img[id]);
    rotateZ(radians(b));
    shape(globe);
    b++;
    stroke(255);
    popMatrix();
  }
  //This method below is mathematical things which takes the distance of one orbit of the planet to another and the angle at which it is tilted and scale it to the moniter size, so it's highly accurate. taken from Github.
  void dist_angle_Orbit(int id) {
    stroke(10);
    float circumference = 2*PI;
    float a = aphelion[id]/3;
    float e = eccentricity[id];
    float prevx = -1;
    float prevy = -1;
    for (float theta=0.0; theta<circumference; theta+=0.01) {
      float r = (a*(1-(e*e)))/(1-(e*cos(theta)));
      float x = r*cos(theta);
      float y = r*sin(theta);
      if (prevx == -1 && prevy == -1) {
        prevx = x;
        prevy = y;
      } else {
        line(prevx, prevy, x, y);
        prevx = x;
        prevy = y;
      }
    }
  }
}