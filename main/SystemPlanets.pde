import java.util.List;
import java.util.Collection;

class SystemPlanets implements CelestialBody{
  Planet barycenter;
  HashMap<CelestialBody,PVector> listPlanets;

  SystemPlanets(){
    barycenter = new Planet(
      "NoName",           // Name
      10f,                // Diameter
      new PVector(0,0),   // Acceleration
      new PVector(0,0),   // Velocity
      new PVector(0,0),   // Gravity
      0f,                 // Mass
      new int[]{0,0});    // Fill Color / Stroke Color
    listPlanets = null;
  }
  
  SystemPlanets(Planet p,HashMap l){
    this.barycenter = p;
    this.listPlanets = l;
    setRelativePosition();
  }
  
  void addPlanet(CelestialBody c){
    if (listPlanets != null){
      listPlanets.put(c, c.getGravity());
      setRelativePosition();
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
    return this.barycenter.getPositionX();
  }
  
  public float getPositionY(){
     return this.barycenter. getPositionY();
  }
  
  public PVector getRelativePosition(){
    return barycenter.getRelativePosition();
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
    for(CelestialBody c : listPlanets.keySet())
    {
      if(c instanceof Planet)
      {
        Planet p = (Planet)c;
        barycenter.setGravity(p);
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
  
  void setRelativePosition(){
    for(CelestialBody c : listPlanets.keySet()){
      PVector p = new PVector(c.getPositionX()-barycenter.getPositionX(),c.getPositionY()-barycenter.getPositionY());
      c.setRelativePosition(p);
    }
  }
  
  void setRelativePosition(PVector p){
    this.barycenter.setRelativePosition(p);
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
      pushMatrix();
      //translate(barycenter.getRelativePositionX(),barycenter.getRelativePositionY());
      c.display();
      popMatrix();
    }
    barycenter.display();
  }
  
  void applyForce(PVector f){
    for(CelestialBody c : listPlanets.keySet()){
      if(c instanceof SystemPlanets)
      {
        c.applyForce(listPlanets.get(c)); //<>//
      }
      if(c instanceof CelestialBody)
      {
        c.applyForce(listPlanets.get(c));
      }
    }
  }
  
  void update(){
    for(CelestialBody c : listPlanets.keySet()){
      c.update();
      //TODO mettre à jour la position relative au barycentre
      //setRelativePosition();
      //c.setPosition(new PVector(barycenter.getPositionX()+c.getRelativePosition().x, barycenter.getPositionY()+c.getRelativePosition().y));
    }
  }
}
