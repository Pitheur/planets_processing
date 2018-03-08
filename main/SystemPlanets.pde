import java.util.List;
import java.util.Collection;

class SystemPlanets implements CelestialBody{
  Planet barycenter;
  HashMap<CelestialBody,PVector> listPlanets;
  
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
  
  SystemPlanets(Planet p,HashMap l){
    this.barycenter = p;
    this.listPlanets = l;
  }
  
  void addPlanet(CelestialBody c){
    if (listPlanets != null){
      listPlanets.put(c, c.getGravity());
    }
  }
  
  void addAllPlanet(HashMap l){
    listPlanets.putAll(l);
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
  
  Collection getAllPlanets(){
    if(!listPlanets.isEmpty()){
      return this.listPlanets.entrySet();
    }
    return null;
  }
  
  int getListPlanetSize(){
    return listPlanets.size();
  }
  
  PVector getGravity(){
    return barycenter.getGravity();
  }
  
  void setPlanet(CelestialBody c, PVector m){
    listPlanets.put(c,m);
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
    for(CelestialBody c : listPlanets.keySet()){ //<>//
      if(c instanceof Planet)
      {
        Planet p = (Planet)c;
        barycenter.setGravity(p); //<>//
        PVector g = barycenter.getGravity();
        listPlanets.put(c,g);
      }
      else
      {
        if(c instanceof SystemPlanets)
        {
          SystemPlanets sp = (SystemPlanets)c;
          sp.setAllGravity();
        }
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
  
  void display(){
    for(CelestialBody c : listPlanets.keySet()){
      c.display();
    }
    barycenter.display();
  }
  
  void applyForce(PVector f){
    for(CelestialBody c : listPlanets.keySet()){ //<>//
      c.applyForce(listPlanets.get(c));
    }
  }
  
  void update(){
    for(CelestialBody c : listPlanets.keySet()){ //<>//
      c.update();
    }
    barycenter.update();
  }
}