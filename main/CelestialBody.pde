interface CelestialBody{
  public void setGravity(Planet p);
  public PVector getGravity();
  public float getPositionX();
  public float getPositionY();
  public PVector getRelativePosition();
  public void setPosition(PVector p);
  public void setRelativePosition(PVector p);
  public void display();
  public void update();
  public void applyForce(PVector p);
}
