import controlP5.*;

class Gui{
  
  ControlP5 cp5;
  ListBox listPlanets;
  
  Gui(PApplet p){
    this.cp5 = new ControlP5(p);
  }
  
  void createGroup(){             
     
   listPlanets = cp5.addListBox("Liste des Planetes")
      .setPosition(10,20)
      .setSize(120,120)
      .setItemHeight(15)
      .setColorBackground(color(255, 128))
      .setColorActive(color(0))
      .setColorForeground(color(255, 100,0));
      
    cp5.addTextfield("Name")
     .setPosition(10,180)
     .setSize(120,10)
     .setFont(createFont("arial",10))
     .setFocus(true)
     .setColor(color(255,100,0));
     
    cp5.addSlider("Size")
     .setPosition(10,220)
     .setSize(100,10)
     .setRange(100,500)
     .setValue(100);
     
    cp5.addKnob("Mass")
      .setRange(0,255)
      .setValue(50)
      .setPosition(10,240)
      .setRadius(50)
      .setDragDirection(Knob.VERTICAL);
     
   cp5.addSlider2D("Start position")
     .setPosition(10,360)
     .setSize(100,100)
     .setArrayValue(new float[] {50, 50});
     
    cp5.addBang("clearAll")
     .setLabel("Clear All")
     .setPosition(10,500)
     .setSize(80,20)
     .setTriggerEvent(Bang.RELEASE)
     .setColorForeground(color(#d62c20))
     .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
    
  }
  
  void upDateListBox(CelestialBody cb,int i)
  {
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
