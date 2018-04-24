import controlP5.*;

class Gui{
  
  ControlP5 cp5;
  ListBox listPlanets;
  
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
     
   listPlanets = cp5.addListBox("Liste des Planètes")
      .setPosition(10,40)
      .setSize(120,120)
      .setItemHeight(15)
      .setColorBackground(color(255, 128))
      .setColorActive(color(0))
      .setColorForeground(color(255, 100,0));
  }
  
  void upDateListBox(CelestialBody cb,int i){
    if(cb instanceof Planet)
    {
      Planet p = (Planet)cb;
      listPlanets.addItem(p.getName(),i);
    }
    else if(cb instanceof SystemPlanets)
    {
      SystemPlanets sp = (SystemPlanets) cb;
      HashMap<CelestialBody,PVector> hm = sp.listPlanets;
      for(CelestialBody c : hm.keySet())
      {
        upDateListBox(c,i);
        i++;
      }
      upDateListBox(sp.getBarycenter(),i);
    }
  }
}
