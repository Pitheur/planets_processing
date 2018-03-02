import java.util.List;

class SystemPlanets{
  List<Planet> listPlanets;
  
  SystemPlanets(){
    listPlanets = null;
  }
  
  SystemPlanets(List l){
    this.listPlanets = l;
  }
  
  void setPlanet(Planet p){
    listPlanets.add(p);
  }
  
  void addAllPlanet(List l){
    listPlanets.addAll(l);
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
  
  Iterator iterator(){
    return listPlanets.iterator();
  }
}