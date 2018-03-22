import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
PImage img1,img2,img3,img4,img5, img6;
int value1, value2, value3, value4;

Box2DProcessing box2d;
Primavera una;

ArrayList <Primavera> petalos;
ArrayList <Verano> hoja;
ArrayList <Autum> hoji;
ArrayList <Invierno> copo;


class Primavera{
  
  float x,y,w,h;
  Body p;
  
  Primavera (float x_, float y_, float w_, float h_){
    x= x_;
    y = y_;
    w = w_;
    h = h_;
    
    
    BodyDef pp = new BodyDef(); 
    
    pp.type = BodyType.DYNAMIC;
    Vec2 xyEnBox2 = box2d.coordPixelsToWorld(new Vec2(x,y));
    pp.position.set(xyEnBox2);
     
    p = box2d.createBody(pp);
    
   
    PolygonShape pf = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    pf.setAsBox(box2dW,box2dH);
    
    
    FixtureDef aa = new FixtureDef();
   
    aa.shape = pf;
    aa.density = 1;
    aa.friction = 1;
    aa.restitution = 0.5;
    
    
  
    p.createFixture(aa);    
    
  
  }
  
  void display(){
    
    Vec2 pos = box2d.getBodyPixelCoord(p);
    pushMatrix();
    translate(pos.x,pos.y);
    scale (0.02,0.02);
    image (img1,x,y);
    popMatrix();
  }  
}

class Verano{
  
  float x,y,w,h;
  Body v;
  
  Verano (float x_, float y_, float w_, float h_){
    x= x_;
    y = y_;
    w = w_;
    h = h_;
    
     
    BodyDef hv = new BodyDef(); 
    
    hv.type = BodyType.DYNAMIC;
    Vec2 xyEnBox2 = box2d.coordPixelsToWorld(new Vec2(x,y));
    hv.position.set(xyEnBox2);
    
    v = box2d.createBody(hv);
    
   
    PolygonShape vh = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    vh.setAsBox(box2dW,box2dH);
    
    
    FixtureDef bb = new FixtureDef();
    
    bb.shape = vh;
    bb.density = 1;
    bb.friction = 1;
    bb.restitution = 0.5;
    
    
    
    v.createFixture(bb);    
    
    
  }
  
  void display(){
    
    Vec2 pos = box2d.getBodyPixelCoord(v);
    pushMatrix();
    translate(pos.x,pos.y);
    scale (0.02,0.02);
    image (img2,x,y);
    popMatrix();
  }  
}

class Autum{
  
  float x,y,w,h;
  Body o;
  
  Autum(float x_, float y_, float w_, float h_){
    x= x_;
    y = y_;
    w = w_;
    h = h_;
    
    //Implica generar una definición. 
    BodyDef ho = new BodyDef(); 
    // le paso el tipo de cuerpo: DINAMICOS, ESTÁTICOS y KINESTETICOS
    ho.type = BodyType.DYNAMIC;
    Vec2 xyEnBox2 = box2d.coordPixelsToWorld(new Vec2(x,y));
    ho.position.set(xyEnBox2);
    // construir mi cuerpo. 
    o = box2d.createBody(ho);
    
    // Definir el poligono, son los limites del objeto. 
    PolygonShape oh = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    oh.setAsBox(box2dW,box2dH);
    
    //definir el fixture las propiedas del objeto
    FixtureDef fd = new FixtureDef();
    //pasarle su forma, y establecer sus parametros 
    fd.shape = oh;
    fd.density = 1;
    fd.friction = 1;
    fd.restitution = 0.5;
    
    
    //Agregar el cuerpo al Fixture
    o.createFixture(fd);    
    
    //b.setAngularVelocity(30);
    //b.setLinearVelocity(new Vec2(20,0));
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(o);
    pushMatrix();
    translate(pos.x,pos.y);
    scale (0.02,0.02);
    image (img3,x,y);
    popMatrix();
  }  
}

class Invierno{
  
  float x,y,w,h;
  Body i;
  
  Invierno (float x_, float y_, float w_, float h_){
    x= x_;
    y = y_;
    w = w_;
    h = h_;
    
    
    BodyDef ci = new BodyDef(); 
    
    ci.type = BodyType.DYNAMIC;
    Vec2 xyEnBox2 = box2d.coordPixelsToWorld(new Vec2(x,y));
    ci.position.set(xyEnBox2);
     
    i = box2d.createBody(ci);
    
   
    PolygonShape ic = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ic.setAsBox(box2dW,box2dH);
    
    
    FixtureDef aa = new FixtureDef();
   
    aa.shape = ic;
    aa.density = 1;
    aa.friction = 1;
    aa.restitution = 0.5;
    
    
  
    i.createFixture(aa);    
    
  
  }
  
  void display(){
    
    Vec2 pos = box2d.getBodyPixelCoord(i);
    pushMatrix();
    translate(pos.x,pos.y);
    scale (0.009,0.009);
    image (img4,x,y);
    popMatrix();
  }  
}


void setup(){
  size(450,600);
  
  img1 =loadImage ("primavera.PNG");
  img2 =loadImage ("verano.PNG");
  img3 =loadImage ("otoño.PNG");
  img4 =loadImage ("invierno.PNG");
  img5 =loadImage ("ventana.png");
  img6 =loadImage ("reset.png");
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-10);
  
  petalos = new ArrayList<Primavera>();
  hoja = new ArrayList<Verano>();
  hoji = new ArrayList<Autum>();
  copo = new ArrayList<Invierno>();
}

void draw(){
  background(0);
  box2d.step();
  
  
  
  //VIDRIO PRIMAVERA
  fill (#30B0FC);
  noStroke();
  rect (57,37,165,237);
  
   //VIDRIO VERANO
  fill (#30B0FC);
  noStroke();
  rect (222,37,180,237);
  
  if (mousePressed && (mouseX>57) && (mouseX<57+165) && (mouseY>37) && (mouseY<37+237))
  {
   value1=1;
  }
  
  if (value1==1)
  {
    println ("PRIMAVERA");
    primavera();
  }
  
  
  if (mousePressed && (mouseX>222) && (mouseX<222+180) && (mouseY>37) && (mouseY<37+237))
  {
   value2=1;
  }
  
  if (value2==1)
  {
    println ("VERANO");
    verano();
  }
  
  
  
  //VIDRIO OTOÑO
  fill (#30B0FC);
  noStroke();
  rect (57,280,180,260);
  
  //VIDRIO INVIERNO
  fill (#30B0FC);
  noStroke();
  rect (222,280,180,260);
  
  if (mousePressed && (mouseX>57) && (mouseX<57+180) && (mouseY>280) && (mouseY<280+260))
  {
   value3=1;
  }
  
  if (value3==1)
  {
    println ("OTOÑO");
    autum();
  }
  
  if (mousePressed && (mouseX>222) && (mouseX<222+180) && (mouseY>280) && (mouseY<280+260))
  {
   value4=1;
  }
  
  if (value4==1)
  {
    println ("INVIERNO");
    invierno();
  }

  //VENTANA
  image (img5,0,0,width,height);
  //Circulos de reset
  pushMatrix();
  scale (0.10,0.10);
  image (img6,3600,4950);
  popMatrix();
  if (mousePressed && (mouseX>350) && (mouseX<=350+50) && (mouseY>480) && (mouseY<=480+50))
  {
    value4=0;
    println ("RESET");
  }
  
  pushMatrix();
  scale (0.10,0.10);
  image (img6,580,4950);
  popMatrix();
  if (mousePressed && (mouseX>55) && (mouseX<=55+50) && (mouseY>480) && (mouseY<=480+50))
  {
    value3=0;
    println ("RESET");
  }
  
  fill (255,0,0);
  //rect (340,215,50,50);
  pushMatrix();
  scale (0.10,0.10);
  image (img6,580,4950);
  popMatrix();
  if (mousePressed && (mouseX>340) && (mouseX<=340+50) && (mouseY>215) && (mouseY<=215+50))
  {
    value2=0;
    println ("RESET");
  }
  
  //rect (60,215,50,50);
  pushMatrix();
  scale (0.10,0.10);
  image (img6,3600,2340);
  popMatrix();
  if (mousePressed && (mouseX>340) && (mouseX<=340+50) && (mouseY>215) && (mouseY<=215+50))
  {
    value2=0;
    println ("RESET");
  }
  
 
  pushMatrix();
  scale (0.10,0.10);
  image (img6,650,2340);
  popMatrix();
  if (mousePressed && (mouseX>60) && (mouseX<=60+50) && (mouseY>215) && (mouseY<=215+50))
  {
    value1=0;
    println ("RESET");
  }

}


void primavera()
{

  if (random(1) < 0.1)
  {
    Primavera p = new Primavera (random(70,175),0,3,3);
    petalos.add(p);
  }
  
  for (Primavera a:petalos){
    a.display();
  }
  
  

}

void verano()
{
  if (random(1) < 0.1)
  {
    Verano v = new Verano (random(230,400),0,3,3);
    hoja.add(v);
  }
  
  for (Verano e:hoja){
    e.display();
  }

}

void autum()
{
  if (random(1) < 0.1)
  {
    Autum o = new Autum (random(0,150),265,5,5);
    hoji.add(o);
  }
  
  for (Autum c:hoji){
    c.display();
  }
}

void invierno()
{
  if (random(1) < 0.1)
  {
    Invierno o = new Invierno (random(230,440) ,random(255,400),5,5);
    copo.add(o);
  }
  
  for (Invierno c:copo){
    c.display();
  }
}