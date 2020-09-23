// Jeg valgte at lave noget lidt andet end den video der var i opgaven. Jeg har dog brugt for() funktionen og kuber.


float r = 0;            // r bliver brugt til at rotere skærmen
float r2= 0;            // boldens rotation

float sphereX = random(-100,100);  // Startlokation til cirkel
float sphereY = random(-100,100);  //

float speedX = random(15,30);      // x hastighed til bolden.
float speedY = random(15,30);      // y hastighed til bolden.

void setup(){

size(800,800,P3D);
textAlign(CENTER);


}


void draw(){
  
  clear();
  background(0);
  textSize(30);
  text("'A' LEFT        RIGHT 'D'",400,50); 
      
  push();  //0
  translate(400,400,-700);                     // Sætter et punkt i midten af rektanglen.           
  ambientLight(30,30,30,0,0,0);                // Svagt lys så man kan se hele rektanglen, og ikke kun indersiden.
  pointLight(150,150,0,sphereX,sphereY,0);     // Kunne ikke helt finde ud af det der med lys. Lyset ser ikke helt godt ud. Lyset kommer ud fra cirklen.
  rotateY(r);                                  // Roterer venstre/højre alt efter 'r'
  
  if(keyPressed){                              // 'r' skiftes så man kan se højre/venstre side.
    if(key=='a'|| key=='A'){
      r=r-0.03;                                
     }
     
     if(key=='d' || key=='D'){
      r=r+0.03;
     }   
}
    push();  //1    Her laver jeg boksene for toppen og bunden af rektanglen
      translate(-350,-350,0);                  // Koordinat oppe/venstre hjørne af rektangel
      for(int x=-200; x<=900; x= x+100){       // Her bliver for() brugt til de forskellige X koordinater. Den går fra 
        push();  //2
         translate(x,0,0);                     // Sætter punkt ved de forskellige X koordinater, så man kan lave boxene der
         for(int y2 = 0;y2<=700;y2= y2+700){   // for() til Y koordinat. Y stiger med 700 fordi jeg kun vil have en X række på 2 forskellige Y koordinater. Sådan dannes hullet i rektanglen.
           push(); //3
             translate(0,y2,0);                // Sætter punkt ved de forskellige Y koordinater.
             box(100);                         // Laver boksen ved de forskellige X og Y koordinater.
           pop(); //3
         }
       pop(); //2
     }
     pop(); //1
      
      
     for(int x=-550; x<=550;x+=1100){          // Til at lave boksene nedad. Samme metode brugt som ovenpå.
      push();  //1
        translate(x,-350,0);
        for(int y=0; y<=700;y=y+100){  
          push(); //2
            translate(0,y,0);          
            box(100);
          pop();  //2
        }    
        pop(); //1
      }
      
      push(); //1                              // Her laver jeg min cirkel
      lights();                                // Jeg bruger lights() til at slå lys/skygger fra, så man kan se cirklen. Ellers er den usynlig, da lyset kommer fra dens midte. 
      sphereX = sphereX + speedX;              // Får bolden til at bevæge sig.
      sphereY = sphereY + speedY;
      
        translate(sphereX,sphereY,0);          // Laver et punkt ved cirklens koordinat, hvor den så laver cirklen længere nede.
        r2 = r2 + 0.2;                         // Rotation til cirklen. Ser bedre ud.
        rotate(r2);
        fill(200,200,0);
        sphereDetail(10);
          sphere(50);
          
      if(sphereX > 450){                       // Det samme fra bouncing ball opgaven. Får bolden til at bounce.
        speedX = -abs(speedX);
      }
      if(sphereY > 250){
        speedY = -abs(speedY);
      }
      if(sphereX < -450){
        speedX = abs(speedX);
      }
       if(sphereY < -250){
        speedY = abs(speedY);
      }
          
        lights();
      pop(); //1
      
 pop(); //0
 
 
}
