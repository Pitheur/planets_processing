import java.util.Iterator;

StarsList starsSparkleList = new StarsList();
StarsList starsMovingList = new StarsList();
StarsList starsList = new StarsList();

ArrayList starsSparkle = new ArrayList();
ArrayList starsMoving = new ArrayList();
ArrayList stars = new ArrayList();

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
}

void draw() {
  pushStyle();
  stroke(random(250));
  starsSparkleList.display();
  popStyle();
  
  pushStyle();
  stroke(255);
  starsList.display();
  popStyle();
}