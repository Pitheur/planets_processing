import java.util.List;

class SystemPlanets implements CelestialBody{
  Planet barycenter;
  List<CelestialBody> listPlanets;
  
  SystemPlanets(){
    barycenter = new Planet(
      "NoName",
      10f,
      new PVector(0,0), 
      new PVector(0,0), 
      new PVector(0,0), 
      0,new int[]{0,0});
    listPlanets = null;
  }
  
  SystemPlanets(Planet p,List l){
    this.barycenter = p;
    this.listPlanets = l;
  }
  
  void addPlanet(CelestialBody c){
    if (listPlanets != null){
      listPlanets.add(c);
    }
  }
  
  void addAllPlanet(List l){
    listPlanets.addAll(l);
  }
  
  PVector getPosition(){
    if(this.barycenter != null){
      return this.barycenter.getPosition();
    }
    else return null;
  }
  
  public float getPositionX(){
    return this.barycenter.position.x;
  }
  
  public float getPositionY(){
     return this.barycenter.position.y;
  }
  
  CelestialBody getBarycenter(){
    if(this.barycenter != null){
      return this.barycenter;
    }
    else return null;
  }
  
  CelestialBody getPlanet(int i){
    if(!listPlanets.isEmpty()){
      return this.listPlanets.get(i);
    }
    else{
      return null;
    }
  }
  
  List getAllPlanets(){
    if(!listPlanets.isEmpty()){
      List<CelestialBody> l = null;
      for(CelestialBody p : listPlanets){
        l.add(p);
      }
      return l;
    }
    return null;
  }
  
  int getListPlanetSize(){
    return listPlanets.size();
  }
  
  PVector getGravity(){
    return barycenter.getGravity();
  }
  
  void setPlanet(Planet p){
    listPlanets.add(p);
  }
  
  void setBarycenter(Planet p){
    this.barycenter = p;
  }
  
  void setPosition(PVector p){
    barycenter.setPosition(p);
  }
  
  void setDiameter(float diameter){
    barycenter.setDiameter(diameter);
  }
  
  void setVelocity(PVector velocity){
    barycenter.setVelocity(velocity);
  }
  
  void setGravity(PVector gravity){
    barycenter.setGravity(gravity);
  }
  
  void setGravity(Planet p){
    barycenter.setGravity(p);
  }
  
  void setAllGravity(){
    PVector zero = new PVector(0,0);
    for(CelestialBody c : listPlanets){ //<>//
      barycenter.setGravity(c.getGravity());
      if(c.getGravity().x == 0 && c.getGravity().y ==0){
       c.setGravity(barycenter);
     }
    }
  }
  
  void setName(String s){
    barycenter.setName(s);
  }
  
  void setAcceleration(PVector acceleration){
    barycenter.setAcceleration(acceleration);
  }
  
  void setMass(float m){
    barycenter.setMass(m);
  }
  
  Iterator iterator(){
    return listPlanets.iterator();
  }
  
  void display(){
    for(CelestialBody c : listPlanets){
      c.display();
    }
    barycenter.display();
  }
  
  void applyForce(PVector f){
    for(CelestialBody c : listPlanets){
      barycenter.applyForce(c.getGravity());
    }
  }
  
  void update(){
    for(CelestialBody c : listPlanets){
      c.update();
    }
    barycenter.update();
  }
}