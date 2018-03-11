class Planet implements CelestialBody{
  
  String name;
  
  PVector position;
  float velocity;
  float acceleration;
  PVector gravity;
  int[] displayColor;
  
  float theta;
  float mass;
  float diameter;
  
  Planet (String name, float diameter, float acceleration, float velocity, PVector gravity, float mass, float theta, int[] displayColor)
  {
    this.name =name;
    this.diameter = diameter;
    this.acceleration = acceleration;
    this.velocity = velocity;
    this.gravity = gravity;
    this.mass = mass;
    this.displayColor = displayColor;
    this.theta = theta;
  }

   void setPosition(PVector p){
    this.position = p;
    this.theta = p.heading();
  }
  
  void setPosition(float x, float y, PVector origin){
    this.position = new PVector(x,y); //<>// //<>//
  } //<>//
  
  void setDiameter(float dameter){
    this.diameter = diameter;
  }

  void setVelocity(float velocity){
    this.velocity = velocity;
  }
  
  void setGravity(PVector gravity){
    this.gravity = gravity;
  }
  
  void setGravity(Planet p){
    float rX = (p.position.x - this.position.x)/getDistance(p);
    float rY = (p.position.y - this.position.y)/getDistance(p);
    PVector r = new PVector(rX,rY);
    
    this.gravity = r.mult(-GRAVITATION*(getMass()*p.getMass())/sq(getDistance(p)));
  }

  void setAcceleration(float acceleration){
    this.acceleration = acceleration;
  }
  
  void setMass(float m){
    this.mass = m;
  }
  
  void setName(String s){
    this.name = s;
  }
  
  void setTheta(float f){
    this.theta = f;
  }
  
  PVector getPosition(){
    return this.position;
  }
  
  public float getPositionX(){
    return this.position.x;
  }
  
  public float getPositionY(){
     return this.position.y;
  }
  
  float getDiameter(){
    return diameter;
  }
  
  float getDistance(Planet p){
    return  getPosition().dist(p.getPosition());
  }

  float getVelocity(){
    return velocity;
  }
  
  PVector getGravity(){
    return gravity;
  }
  
  float getAcceleration(){
    return acceleration;
  }
  
  float getMass(){
    return this.mass;
  }
  
  String getName(){
    return this.name;
  }
  
  float getTheta(){
    return this.theta;
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force, getMass());
    //this.acceleration.add(f);
  }
  
  void update(){
    //velocity.add(acceleration);
    this.position = PVector.fromAngle(theta); //<>//
    //acceleration.mult(0);
  }
  
  void display(){
    ellipseMode(CENTER);
    stroke(displayColor[1]);
    fill(displayColor[0]);
    ellipse(position.x,position.y,getDiameter(),getDiameter());
  }
}