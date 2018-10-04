/*
Abstract Digital Space No..2
Created by Dante Escrofani

From inside of a rotating, pulsing sphere. Every frame is a new color, every couple frames are saved, and then erased.
Number of vertices used to construct the sphere shifts every so often
*/

int smallPoint = int(random(10));
int largePoint = int(random(1000));
float ra = 0, rc = 0, xx = 0, yy = 0, zz = 0;
int milimir, pulseSize, verTime, bg = 0, mx = 0, my = 0, mz = 0;

float segLength = 100;
boolean fill = true;

void setup() 
{
  size(1440,900, P3D);
   //camera(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
}
void draw() {

  print(bg);
  bg++;
  if(bg == 20){background(0);} //frame slur
  else if (bg == 34){bg = 0;}
 
 //rotation computations
 ra=ra+rc; 
 translate(720+mx,450+my,mz);
  rotateX(xx);
 rotateY(yy);
 rotateZ(zz);
  xx=(xx+.003);
   zz=(zz+.002);
 //println(zz);
 
 //set size based on millis
 milimir = millis()%90000; 
 if(milimir > 45000){pulseSize=45000-milimir%45000;} //size pulsing
 else{pulseSize = milimir;}

 verTime = millis()%5000;
 //if(verTime<4990){verTime=5000;}
 if(millis()%500==0){ sphereDetail(int(random(20)));}
 
 //change # of vertices used to construct sphere
 sphere(pulseSize/20);

 noFill();  //fill
 lights(); //turn'em on!
 stroke(random(255),random(255),random(255)); //color shifting

}

void keyPressed() 
{
   if ( key == 'q' ) {rc=rc-.01;}
   if ( key == 'e' ) {rc=rc+.01;}
   if ( key == 'w' ) {my=my+25;}
   if ( key == 'x' ) {my=my-25;}
   if ( key == 'd' ) {mx=mx+25;}
   if ( key == 'a' ) {mx=mx-25;}
   if ( key == 's' ) {mz=mz+25;}
   if ( key == 'z' ) {mz=mz-25;}
   if ( key == 'k' ) {xx=xx+radians(1);}
   if ( key == 'h' ) {xx=xx-radians(1);}
   if ( key == 'u' ) {yy=yy+radians(1);}
   if ( key == 'n' ) {yy=yy-radians(1);}
   if ( key == 'j' ) {zz=zz+radians(1);}
   if ( key == 'm' ) {zz=zz-radians(1);}
}

void segment(float x, float y, float a) 
{
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
}