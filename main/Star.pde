class Star {
  
  PVector position;
  
  Star (PVector position){
    this.position = position;
  }
  
  Star (float x, float y){
    this.position = new PVector(x,y);
  }
  
  void setX(float x){
    position.set(x,this.position.y);
  }
  
  void setY(float y){
    position.set(this.position.x,y);
  }
  
  void setPosition(float x, float y){
    position.set(x,y);
  }
  
  float getX(){
    return this.position.x;
  }
  
  float getY(){
    return this.position.y;
  }
  
  PVector getPosition(){
    return this.position; 
  }
  
  void display(){
    point(this.position.x,this.position.y);
  }
  
  void move(){
    
  }
}