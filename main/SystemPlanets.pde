import java.util.List;

class SystemPlanets{
  Planet barycenter;
  List<Planet> listPlanets;
  
  SystemPlanets(){
    barycenter = new Planet(
      "NoName",
      10f, 
      0f, 
      new PVector(0,0), 
      new PVector(0,0), 
      new PVector(0,0), 
      0);
    listPlanets = null;
  }
  
  SystemPlanets(List l){
    this.listPlanets = l;
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
  
  Planet getBarycenter(){
    if(this.barycenter != null){
      return this.barycenter;
    }
    else return null;
  }
  
  Planet getPlanet(int i){
    if(!listPlanets.isEmpty()){
      return this.listPlanets.get(i);
    }
    else{
      return null;
    }
  }
  
  List getAllPlanets(){
    if(!listPlanets.isEmpty()){
      List<Planet> l = null;
      for(Planet p : listPlanets){
        l.add(p);
      }
      return l;
    }
    return null;
  }
  
  Planet getPlanetByName(String name){
    if(!listPlanets.isEmpty()){
      for(Planet p: listPlanets){
        if(p.getName() == name){
          return p;
        }
      }
    }
    return null;
  }
  
  int getListPlanetSize(){
    return listPlanets.size();
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
  
  void setName(String s){
    barycenter.setName(s);
  }
  
  void setGravity(Planet p){
    barycenter.setGravity(p);
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
}