class Planet {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector gravity;
  
  float mass;
  float diameter;
  float distanceFromSun;
  
  String name;
  
  Planet (String name, float diameter, float distanceFromSun, PVector acceleration, PVector velocity, PVector gravity, float mass)
  {
    this.diameter = diameter;
    this.distanceFromSun = distanceFromSun;
    this.acceleration = acceleration;
    this.velocity = velocity;
    this.gravity = gravity;
    this.mass = mass;
  }
  
   void setPosition(PVector p){
    this.position = p;
  }
  
  void setPosition(float x, float y){
    this.position = new PVector(x,y);
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
  
  void setName(String s){
    this.name = s;
  }
  
  void setGravity(Planet p){
    float rX = (p.position.x - this.position.x)/getDistance(p);
    float rY = (p.position.y - this.position.y)/getDistance(p);
    PVector r = new PVector(rX,rY);
    
    this.gravity = r.mult(-GRAVITATION*(getMass()*p.getMass())/sq(getDistance(p)));
  }
  
  void setAcceleration(PVector acceleration){
    this.acceleration = acceleration;
  }
  
  void setMass(float m){
    this.mass = m;
  }
  
  PVector getPosition(){
    return this.position;
  }
  
  float getDiameter(){
    return diameter;
  }
  
  float getDistanceFromSun(){
    return distanceFromSun;
  }
  
  float getDistance(Planet p){
    return  getPosition().dist(p.getPosition());
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
  
  String getName(){
    return this.name;
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force, getMass());
    this.acceleration.add(f);
  }
  
  void update(){
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void display(){
    ellipseMode(CENTER);
    ellipse(position.x,position.y,getDiameter(),getDiameter());
  }
    
}