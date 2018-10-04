/*
Fine Line Wiggles
Created by Dante Escrofani

Packs in more lines than the resolution of the pixels across the surface of the shape.
As the shape moves, the lines converge and alias into odd wiggly patterns.
*/

int sphmil, r, tr, b, tb, g, tg, bg = 0;
float segLength = 100;
float pulseRate, twYst, twYstr =radians(.1), twXst, twXstr =radians(.1);
boolean fill = true, pulseOut = true;

void setup() {
  size(1080,675, P3D); //camera(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0);
   
 background(0);
}


void draw() {
   lights();
 translate(width/2,height/2,-50);//center the view, move back
 twYst += twYstr; //rates of rotation
 twXst += twXstr;
 rotateY(twYst);
 rotateX(twXst);
 
 pulseRate += PI/270; //rate of pulse
 sphmil = 300 + int(30*sin(pulseRate)); //150 is pulse index
 sphereDetail(5,500+millis()/100%1000); //number of vertices on sphere
 sphere(sphmil);
 fill(0);
 
 if(millis()%1000<=5)
 {
   tr = int(random(255));
   tg = int(random(255));
   tb = int(random(255));
 }
 colorTarget(tr,tg,tb);
 stroke(r,b,g); 
}

void keyPressed() 
{
   if ( key == 'y' ) {twYstr += radians(.1);}
   if ( key == 't' ) {twYstr -= radians(.1);}
   if ( key == 'x' ) {twXstr += radians(.1);}
   if ( key == 'z' ) {twXstr -= radians(.1);}
}

void segment(float x, float y, float a) 
{
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
}

void colorTarget(int tr,int tg,int tb)
{
 if(tr>r){r++;}
 else if(tr<r){r--;}
 if(tg>g){g++;}
 else if(tg<g){g--;}
 if(tb>b){b++;}
 else if(tb<b){b--;}
}

/*
  for(int i = 0; i<4; i++) //drift towards that target value
  { 
     r = drift(r[i],rt[i]);
     b = drift(b[i],bt[i]);
     g = drift(g[i],gt[i]);
  }*/