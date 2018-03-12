class Planet implements CelestialBody{
  
  String name;
  
  PVector position;
  float velocity;
  float acceleration;
  float gravity;
  int[] displayColor;
  
  float distance;
  float theta;
  float mass;
  float diameter;
  
  Planet (String name, float diameter, float acceleration, float velocity, float gravity, float mass, float theta, int[] displayColor)
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
  }
  
  void setDistance(float d){
    this.distance = d;
  }
  
  void setDistance(Planet p){
    this.distance = getPosition().dist(p.getPosition());
  }
  
  void setPosition(float x, float y, PVector origin){
    PVector p = new PVector(x,y);
    this.position = p;
    distance = PVector.dist(origin,p);
    theta = atan2(y,x);
  }
  
  void setDiameter(float diameter){
    this.diameter = diameter;
  }

  void setVelocity(float velocity){
    this.velocity = velocity;
  }
  
  void setGravity(float gravity){
    this.gravity = gravity;
  }
  
  void setGravity(Planet p){
    //float rX = (p.getPositionX() - getPositionX())/getDistance(p);
    //float rY = (p.getPositionY() - getPositionY())/getDistance(p);
    //PVector r = new PVector(rX,rY);
    
    //this.gravity = r.mult(-GRAVITATION*(getMass()*p.getMass())/sq(getDistance(p)));
    this.gravity = -((getMass()*p.getMass())/sq(distance)); //<>//
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
  
  float getDistance(){
    return this.distance;
  }
  
  public float getPositionX(){
    return this.getDistance()*cos(theta);
  }
  
  public float getPositionY(){
     return this.getDistance()*sin(theta);
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
  
  float getGravity(){
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
  
  void applyForce(float force){
    float f = force/getMass(); //<>//
    this.acceleration +=  f;
  }
  
  void update(){
    velocity += acceleration; //<>//
    theta = radians(velocity);
    //this.position = PVector.fromAngle(theta);
    acceleration *= 0;
  }
  
  void display(){ //<>//
    
    ellipseMode(CENTER);
    stroke(displayColor[1]);
    fill(displayColor[0]);
    pushMatrix();
    //translate(250,50);
    ellipse(getDistance()*cos(theta),getDistance()*sin(theta),getDiameter(),getDiameter());
    popMatrix();
  }
}