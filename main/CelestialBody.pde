interface CelestialBody{
  public void setGravity(Planet p);
  public float getGravity();
  public float getPositionX();
  public float getPositionY();
  public void setPosition(PVector p);
  public void display();
  public void update();
  public void applyForce(float p);
}