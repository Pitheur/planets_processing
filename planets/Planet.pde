class Planet {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector gravity;
  
  float mass;
  float diameter;
  float distanceFromSun;
  
  Planet (float diameter, float distanceFromSun, PVector acceleration, PVector velocity, PVector gravity, float mass)
  {
    this.diameter = diameter;
    this.distanceFromSun = distanceFromSun;
    this.acceleration = acceleration;
    this.velocity = velocity;
    this.gravity = gravity;
    this.mass = mass;
  }
  
  void setDiameter(float diameter){
    this.diameter = diameter;
  }
  
  void setDistanceFromSun(float distanceFromSun){
    this.distanceFromSun = distanceFromSun;
  }
  
  void setVelocity(PVector velocity){
    this.velocity = velocity;
  }
  
  void setGravity(PVector gravity){
    this.gravity = gravity;
  }
  
  void setAcceleration(PVector acceleration){
    this.acceleration = acceleration;
  }
  
  void setMass(float m){
    this.mass = m;
  }
  
  float getDiameter(){
    return diameter;
  }
  
  float getDistanceFromSun(){
    return distanceFromSun;
  }
  
  PVector getVelocity(){
    return velocity;
  }
  
  PVector getGravity(){
    return gravity;
  }
  
  PVector getAcceleration(){
    return acceleration;
  }
  
  float getMass(){
    return this.mass;
  }
}