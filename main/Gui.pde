import controlP5.*;

class Gui{
  
  ControlP5 cp5;
  
  Gui(PApplet p){
    this.cp5 = new ControlP5(p);
  }
  
  void createGroup(){
    
    Group g3 = cp5.addGroup("myGroup1");
                
    cp5.addSlider("hello")
     .setPosition(10,20)
     .setSize(100,10)
     .setRange(100,500)
     .setValue(100)
     .moveTo(g3);
  }
}