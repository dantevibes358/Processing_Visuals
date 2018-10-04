/*
Bezier Mandala
Created by Dante Escrofani

Has 3 different colored bezier curves repeated in a circle, each point in each bezier is moving to its own randomly-generated rate of sinusoidal motion.
New colors are selected and faded to every so often at random.
*/
float[] rs = new float[3], gs = new float[3], bs = new float[3];
int[] rt = new int[3], gt = new int[3], bt = new int[3];
float[] xa1 = new float[3], ya1 = new float[3], xa2 = new float[3], ya2 = new float[3], xc1 = new float[3], yc1 = new float[3], xc2 = new float[3], yc2 = new float[3];
float[] vxa1 = new float[3], vya1 = new float[3], vxa2 = new float[3], vya2 = new float[3], vxc1 = new float[3], vyc1 = new float[3], vxc2 = new float[3], vyc2 = new float[3];
float[] ixa1 = new float[3], iya1 = new float[3], ixa2 = new float[3], iya2 = new float[3], ixc1 = new float[3], iyc1 = new float[3], ixc2 = new float[3], iyc2 = new float[3];

float rop = 0;
int starpoints = 40;



void setup() {
  size(1000,900, P2D);
  background(0);
  
  //generate random color, rate, & curve values upon startup
  for(int n = 0;n<3;n++)
  {
    rt[n] = int(random(255));
    gt[n] = int(random(255));
    bt[n] = int(random(255));
    xa1[n] = random(500);
    ya1[n] = random(500);
    xa2[n] = random(500);
    ya2[n] = random(500);
    xc1[n] = random(500);
    yc1[n] = random(500);
    xc2[n] = random(500);
    yc2[n] = random(500);
    
    vxa1[n] = radians(random(360));
    vya1[n] = radians(random(360));
    vxa2[n] = radians(random(360));
    vya2[n] = radians(random(360));
    vxc1[n] = radians(random(360));
    vyc1[n] = radians(random(360));
    vxc2[n] = radians(random(360));
    vyc2[n] = radians(random(360));
    
    ixa1[n] = TWO_PI/(500+random(800));
    iya1[n] = TWO_PI/(500+random(800));
    ixa2[n] = TWO_PI/(500+random(800));
    iya2[n] = TWO_PI/(500+random(800));
    ixc1[n] = TWO_PI/(500+random(800));
    iyc1[n] = TWO_PI/(500+random(800));
    ixc2[n] = TWO_PI/(500+random(800));
    iyc2[n] = TWO_PI/(500+random(800));
    
    
  } 
}



void draw() {
  //background(0);
  noFill();
  translate(500,450);
  
  for(int p=1;p<=starpoints;p++){
    rop = rop%TWO_PI;
    rop += TWO_PI/starpoints;
    //rop = rop%TWO_PI;
    rotate(rop);
   
    
    
    stroke(rs[0], gs[0], bs[0]);
    bezier(xa1[0], ya1[0], xc1[0], yc1[0], xc2[0], yc2[0], xa2[0], ya2[0]);
       
    stroke(rs[1], gs[1], bs[1]);
    bezier(xa1[1], ya1[1], xc1[1], yc1[1], xc2[1], yc2[1], xa2[1], ya2[1]);
   
    stroke(rs[2], gs[2], bs[2]);
    bezier(xa1[2], ya1[2], xc1[2], yc1[2], xc2[2], yc2[2], xa2[2], ya2[2]); 
  }
  
   colorDrift();
  if(millis()%1000<=5) //pick new target colors every so often. Doesn't actually fire every second, as the framerate of the draw cycle 30fps~33ms
  for(int c=0;c<3;c++)
  {
   rt[c] = int(random(255));
   gt[c] = int(random(255));
   bt[c] = int(random(255));
  }
  
  for(int bez=0;bez<3;bez++) //Sinusoidal movement of bezier points
  {
    vxa1[bez] = (vxa1[bez] + ixa1[bez])%TWO_PI;
    xa1[bez] = 400 * sin(vxa1[bez]);
    vya1[bez] = (vya1[bez] + iya1[bez])%TWO_PI;
    ya1[bez] = 400 * sin(vya1[bez]);
    vxa2[bez] = (vxa2[bez] + ixa2[bez])%TWO_PI;
    xa2[bez] = 400 * sin(vxa2[bez]);
    vya2[bez] = (vya2[bez] + iya2[bez])%TWO_PI;
    ya2[bez] = 400 * sin(vya2[bez]);
    vxc1[bez] = (vxc1[bez] + ixc1[bez])%TWO_PI;
    xc1[bez] = 400 * sin(vxc1[bez]);
    vyc1[bez] = (vyc1[bez] + iyc1[bez])%TWO_PI;
    yc1[bez] = 400 * sin(vyc1[bez]);
    vxc2[bez] = (vxc2[bez] + ixc2[bez])%TWO_PI;
    xc2[bez] = 400 * sin(vxc2[bez]);
    vyc2[bez] = (vyc2[bez] + iyc2[bez])%TWO_PI;
    yc2[bez] = 400 * sin(vyc2[bez]);  
  }
  
  //saveFrame("bezplay/bezdala1_####.png");
}



void colorDrift()
{
  for(int i = 0;i<3;i++)
  {
     if(rt[i]>rs[i]){rs[i] ++;}
     else if(rt[i]<rs[i]){rs[i] --;}
     if(gt[i]>gs[i]){gs[i] ++;}
     else if(gt[i]<gs[i]){gs[i] --;}
     if(bt[i]>bs[i]){bs[i] ++;}
     else if(bt[i]<bs[i]){bs[i] --;}
  }
}