import java.util.Iterator;

class StarsList {
  ArrayList<Star> starsList;
  
  StarsList(){
    this.starsList = new ArrayList();
  }
  
  ArrayList addAllStarsList(ArrayList stars){
    this.starsList.addAll(stars);
    return starsList;
  }
  
  int size(){
    return this.starsList.size();
  }
  
  Iterator iterator(){
    return starsList.iterator();
  }
  
  Star getStar(int index){
    return starsList.get(index);
  }
  
  ArrayList getList(){
    return this.starsList;
  }
  
  void display(){
    Iterator i = starsList.iterator();
    while(i.hasNext()){
      Star s = (Star)i.next();
      s.display();
    }
  }
}