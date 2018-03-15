class Planet implements CelestialBody{
  
  String name;
  
  PVector position;
  PVector relativePosition;
  PVector velocity;
  PVector acceleration;
  PVector gravity;
  int[] displayColor;
  
  float distance;
  float mass;
  float diameter;
  
  Planet (String name, float diameter, PVector acceleration, PVector velocity, PVector gravity, float mass, int[] displayColor)
  {
    this.name =name;
    this.diameter = diameter;
    this.acceleration = acceleration;
    this.velocity = velocity;
    this.gravity = gravity;
    this.mass = mass;
    this.displayColor = displayColor;
    this.relativePosition = new PVector(0,0);
  }

   void setPosition(PVector p){
    this.position = p;
  }
  
  void setPosition(float x, float y){
    this.position = new PVector(x,y);
  }
  
  void setRelativePosition(PVector p){
    this.relativePosition = p;
  }
  
  void setRelativePosition(float x, float y){
    this.relativePosition = new PVector(x,y);
  }
  
  void setDistance(float d){
    this.distance = d;
  }
  
  void setDistance(Planet p){
    this.distance = getPosition().dist(p.getPosition());
  }
  
  void setDiameter(float diameter){
    this.diameter = diameter;
  }

  void setVelocity(PVector velocity){
    this.velocity = velocity;
  }
  
  void setGravity(PVector gravity){
    this.gravity = gravity;
  }
  
  void setGravity(Planet p){
      float rX = (p.getPositionX() - getPositionX())/getDistance(p);
      float rY = (p.getPositionY() - getPositionY())/getDistance(p);
      PVector r = new PVector(rX,rY);
      
      this.gravity = r.mult(-GRAVITATION*(getMass()*p.getMass())/sq(getDistance(p))); //<>//
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
  
  PVector getPosition(){
    return this.position;
  }
  
  PVector getRelativePosition(){
    return this.relativePosition;
  }
  
  float getDistance(){
    return this.distance;
  }
  
  public float getPositionX(){
    return this.position.x;
  }
  
  public float getPositionY(){
     return this.position.y;
  }
  
  public float getRelativePositionX(){
    return this.relativePosition.x;
  }
  
  public float getRelativePositionY(){
     return this.relativePosition.y;
  }
  
  float getDiameter(){
    return diameter;
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
  } //<>//
  
  void applyForce(PVector force){
    PVector f = force.div(getMass());
    this.acceleration.add(f);
  }
  
  void update(){ //<>//
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void display(){
    
    ellipseMode(CENTER);
    stroke(displayColor[1]);
    fill(displayColor[0]);
    
    pushMatrix();
    ellipse(getPosition().x,getPosition().y,getDiameter(),getDiameter());
    popMatrix();
  }
}
