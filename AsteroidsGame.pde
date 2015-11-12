SpaceShip tom; 
Star[] light; 
public void setup() 
{
 size(600, 600); 
 tom = new SpaceShip(); 
 light = new Star[200];
 for (int i = 0; i < light.length; i++) {
 light[i] = new Star(); 
} 
}
public void draw() 
{
  background(0);
  for (int i = 0; i < light.length; i++) { 
    light[i].show(); 
  } 
  tom.show(); 
  tom.move(); 
}
public void keyPressed() { 
  if (keyCode == UP) { 
    tom.accelerate(0.05); 
  } else if (keyCode == DOWN) { 
    tom.accelerate(-0.2); 
  } else if (keyCode == LEFT) { 
    tom.rotate(-20); 
  } else if (keyCode == RIGHT) { 
    tom.rotate(20); 
  } 
  if (key == 'h') { 
    tom.setX((int)(Math.random()*600));
    tom.setY((int)(Math.random()*600));
    tom.setPointDirection((int)(Math.random()*360));
    tom.setDirectionX(0);
    tom.setDirectionY(0); 
  }
 
} 
class SpaceShip extends Floater  
{   
    public void setX(int x){myCenterX = x;} 
    public int getX() {return (int)myCenterX;} 
    public void setY(int y){myCenterY = y;}
    public int getY() {return (int)myCenterY;}
    public void setDirectionX(double x) {myDirectionX = x;}
    public double getDirectionX() {return myDirectionX;}
    public void setDirectionY(double y) {myDirectionY = y;}
    public double getDirectionY() {return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}
    public double getPointDirection(){return myPointDirection;}
  public SpaceShip() {
  corners = 4; 
  xCorners = new int[corners]; 
  yCorners = new int[corners]; 
  xCorners[0] = -1; 
  xCorners[1] = -8; 
  xCorners[2] = 25; 
  xCorners[3] = -8; 
  yCorners[0] = 0; 
  yCorners[1] = 12; 
  yCorners[2] = 0; 
  yCorners[3] = -12; 
  myColor = color(153, 153, 255);  
  myCenterX = 300; 
  myCenterY = 300; 
  myDirectionX = 0; 
  myDirectionY = 0; 
  myPointDirection = 270; 
  }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
class Star { 
  int starX, starY, radius; 
Star() 
{ 
  starX = (int)(Math.random() * 600); 
  starY = (int)(Math.random() * 600);
  radius = (int)(Math.random() * 1) + 2; 
} 
public void show() {
fill(256, 256, 256);
noStroke();  
ellipse(starX, starY, radius, radius); 
} 
}

