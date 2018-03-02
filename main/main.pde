import java.util.Iterator;

StarsList starsSparkleList = new StarsList();
StarsList starsMovingList = new StarsList();
StarsList starsList = new StarsList();

ArrayList starsSparkle = new ArrayList();
ArrayList starsMoving = new ArrayList();
ArrayList stars = new ArrayList();

Planet earth = new Planet("Terre",10f, 0f, new PVector(0,0), new PVector(0.1,0), new PVector(0,0), 0.01);
Planet sun = new Planet("Soleil",100f, 0f, new PVector(0,0), new PVector(0,0), new PVector(0,0), 50);

void setup() {
  size(640, 360);
  background(0);
  for(int i=0; i < 150; i++){
    starsSparkle.add(new Star(random(width),random(height)));
  }
  starsSparkleList.addAllStarsList(starsSparkle);
  
  for(int i=0; i < 10; i++){
    starsMoving.add(new Star(random(width),random(height)));
  }
  starsMovingList.addAllStarsList(starsMoving);
  
  for(int i=0; i < 150; i++){
    stars.add(new Star(random(width),random(height)));
  }
  starsList.addAllStarsList(stars);
  
  sun.setPosition(width/2,height/2);
  earth.setPosition(width/4,height/4);
}

void draw() {
  background(0);
  pushStyle();
  stroke(random(250));
  starsSparkleList.display();
  popStyle();
  
  pushStyle();
  stroke(255);
  starsList.display();
  popStyle();
  
  pushStyle();
  stroke(#FFAA00);
  fill(#FFF6AF);
  sun.display();
  sun.setGravity(earth);
  popStyle();
  
  pushStyle();
  stroke(#CBEFFF);
  fill(#78B4FC);
  earth.applyForce(sun.getGravity());
  earth.update();
  earth.display();
  popStyle();

}