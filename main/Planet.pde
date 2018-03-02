class Planet {
  
  String name;
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector gravity;
  
  float mass;
  float diameter;
  float distanceFromSun;
  
  Planet (String name, float diameter, float distanceFromSun, PVector acceleration, PVector velocity, PVector gravity, float mass)
  {
    this.name = name;
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
  
  void setName(String s){
    this.name = s;
  }
  
  String getName(){
    return this.name;
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
  
  void display(){
    ellipseMode(CENTER);
    smooth();
    stroke(#D7F1FA);
    fill(#54CBF5);
    ellipse(width/2,height/2,this.diameter,this.diameter);
  }
}