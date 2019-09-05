//*********Inicio de Clases*********//
class Pantallas
{
    
  int p;
  float delta;
  
  Pantallas()
  {
    this.p=0;
    this.delta=0;
  }
  
  void display()
  {
    switch(this.p)
    {
      // PANTALLA 1//
      case 0:
      
      noStroke();
      this.delta+=0.01;
      for(int i=0;i<width;i+=5)
      {
        for(int j=0;j<height;j+=5)
        {
          if(((i+j)/20)%2==0)
            fill(0);
          else
            fill(255); 
          fill(noise(i*0.01+this.delta,j*0.01,this.delta)*255,0,0);
          rect(i,j,20,20);
        }
      }
      
      // Título
      fill(65, 105, 255);
      textSize(80);
      text("Memo", width/4, 100); 
      fill(169, 169, 169);
      textSize(80);
      text("Engine", width/2, 100); 
      
      // Botón de siguiente    
      rectMode(CENTER);
      stroke(255,140,0);
      strokeWeight(5);
      fill(  255, 255, 0);
      rect(width/2,height*14/15,100,40,5);
      fill(0,255,0);
      textSize(20);
      text("Siguiente", width/2-43, height*14/15 + 6); 
      
      // Botón de salir    
      rectMode(CENTER);
      stroke(255,140,0);
      strokeWeight(5);
      fill(  255, 255, 0);
      rect(width*3/4,height*14/15,100,40,5);
      fill(0,255,0);
      textSize(20);
      text("Salir", width*3/4-20, height*14/15 + 6); 
      
      break;
      
      // PANTALLA 2//
      case 1:
      // Subtítulo
      background(255);   
      fill(65, 105, 255);
      textSize(80);
      text("Instrucciones", width/4, 100); 
      
      // Instrucciones
      textSize(20);
      rectMode(CENTER);
      String s = "Este juego consiste en voltear 2 cartas (dando click sobre la carta), las cuales deben ser idénticas para poder ganar un punto, si esto pasa, tendrás otra oportunidad de seguir jugando. En caso contrario (si las cartas no coinciden), se cede el turno al jugador 2. Finalmente gana el jugador con más puntos";
      text(s,width/2,height*2/3,605,400);
      noFill();
      //rect(width/2,height*2/3,600,200);
      
      // Botón jugar
      rectMode(CENTER);
      stroke(255,140,0);
      strokeWeight(5);
      fill(  255, 255, 0);
      rect(width/2,height*14/15,100,40,5);
      fill(0,255,0);
      textSize(20);
      text("¡Jugar ya!", width/2-43, height*14/15 + 6); 
      
      // Botón de salir    
      rectMode(CENTER);
      stroke(255,140,0);
      strokeWeight(5);
      fill(  255, 255, 0);
      rect(width*3/4,height*14/15,100,40,5);
      fill(0,255,0);
      textSize(20);
      text("Salir", width*3/4-20, height*14/15 + 6); 
      
      // Botón de regresar
      rectMode(CENTER);
      stroke(255,140,0);
      strokeWeight(5);
      fill(  255, 255, 0);
      rect(width*1/4,height*14/15,100,40,5);
      fill(0,255,0);
      textSize(20);
      text("Regresar", width*1/4-43, height*14/15 + 6);
      
      break;
      
      // PANTALLA 3//
      case 2:
      background(255);
      noFill();
      rectMode(CORNER);
      rect(50,50,width-2*50,height-2*50);
      for(Carta p : cartas)
        p.display();
      
      
      break;
      
      // PANTALLA 4//
      case 3:
      background(255);    
      break;
    }
  }


  void cambio()
  {
   if(this.p<2)
     if(mouseX>(width/2)-50 && mouseX<(width/2)+50 && mouseY>(height*14/15)-20 && mouseY<height*14/15 +20 && mousePressed == true)
      {
       this.p++;
       //if(this.p==2)
       //tablero();
       
       if(this.p>3)
       this.p=0;
      }
  }
  
  void salir()
  {
    if(this.p<2)
      if(mouseX>(width*3/4)-50 && mouseX<(width*3/4)+50 && mouseY>(height*14/15)-20 && mouseY<height*14/15 +20 && mousePressed == true)
        exit();
  }
  
  void regresar()
  {
    if(this.p<2)
      if(mouseX>(width/4)-50 && mouseX<(width/4)+50 && mouseY>(height*14/15)-20 && mouseY<height*14/15 +20 && mousePressed == true)
        if(this.p>0 && this.p<3)
         this.p--;
  }
  
  void click()
  {
    
    if(this.p<3)
    {
      for(int i=0;i<28;i++)
        if(mouseX>posicionX[i]-40 && mouseX<posicionX[i]+40 && mouseY>posicionY[i]-50 && mouseY<posicionY[i]+50 && mousePressed==true)  
            println(numbers[i]);
    }  
  }
}

class Carta
{
  //atributos
  float xc,yc;
  float tamX, tamY;
  int imagen;
  
  //métodos
  //constructor
  Carta(float xc_ , float yc_,float tamX_, float tamY_,int imagen_)
  {
    this.xc = xc_;
    this.yc = yc_;
    this.tamX=tamX_;
    this.tamY=tamY_;
    this.imagen=imagen_;
  }
  
  void display()
  {
    textSize(11);
    rectMode(CENTER);
    pushMatrix();
    dibujos();
    popMatrix();
    if(time>4)
      tapar();
     
  }
  
  void dibujos()
  {
    switch(this.imagen)
    {
      case 0:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(128,128,128);
      translate(this.xc,this.yc);
      beginShape();
      vertex(-25, -15);
      vertex(+25, -35);
      vertex(+25,+35);
      vertex(-25,+15);
      endShape(CLOSE);
      text("Turbina",-this.tamX/4,this.tamY/2.2);
      break;
      
      case 1:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(128,128,128);
      translate(this.xc,this.yc);
      beginShape();
      vertex(-25, -15);
      vertex(+25, -35);
      vertex(+25,+35);
      vertex(-25,+15);
      endShape(CLOSE);
      text("Turbina",-this.tamX/4,this.tamY/2.2);
      break;
      
      case 2:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(0,0,255);
      translate(this.xc,this.yc);
      beginShape();
      vertex(25, 15);
      vertex(-25, 35);
      vertex(-25,-35);
      vertex(+25,-15);
      endShape(CLOSE);
      text("Compresor",-this.tamX*3/8,this.tamY/2.2);
      break;
      
      case 3:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(0,0,255);
      translate(this.xc,this.yc);
      beginShape();
      vertex(25, 15);
      vertex(-25, 35);
      vertex(-25,-35);
      vertex(+25,-15);
      endShape(CLOSE);
      text("Compresor",-this.tamX*3/8,this.tamY/2.2);
      break;
      
      case 4:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(128,0,128);
      translate(this.xc,this.yc);
      rect(0,-this.tamY*3/8,this.tamX/3,3);
      rect(0,-this.tamY*3/8+5,this.tamX/3,3);
      rect(0,-this.tamY*3/8+16,this.tamX/3,15);
      fill(255);
      ellipse(0,-this.tamY*3/8+17,5,5);
      fill(128,0,128);
      rect(0,0,5,30);
      rect(0,15,10,10,2);
      fill(255);
      ellipse(0,15,8,8);
      fill(128,0,128);
      text("Pistón",-this.tamX/4,this.tamY/2.2);
      break;
      
      case 5:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(128,0,128);
      translate(this.xc,this.yc);
      rect(0,-this.tamY*3/8,this.tamX/3,3);
      rect(0,-this.tamY*3/8+5,this.tamX/3,3);
      rect(0,-this.tamY*3/8+16,this.tamX/3,15);
      fill(255);
      ellipse(0,-this.tamY*3/8+17,5,5);
      fill(128,0,128);
      rect(0,0,5,30);
      rect(0,15,10,10,2);
      fill(255);
      ellipse(0,15,8,8);
      fill(128,0,128);
      text("Pistón",-this.tamX/4,this.tamY/2.2);
      break;
      
      case 6:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(128,0,128);
      translate(this.xc,this.yc);
      rect(0,-this.tamY/4,40,10,2);
      noStroke();
      rect(0,0,15,60,5);
      fill(128,0,128);
      text("Tornillo",-this.tamX/4,this.tamY/2.2);
      stroke(3);
      line(-7.5,-15,7.5,-17.5);
      line(-7.5,-10,7.5,-12.5);
      line(-7.5,-5,7.5,-7.5);
      line(-7.5,0,7.5,-2.5);
      line(-7.5,5,7.5,2.5);
      line(-7.5,10,7.5,7.5);
      line(-7.5,15,7.5,12.5);
      line(-7.5,20,7.5,17.5);
      line(-7.5,25,7.5,22.5);
      break;
      
      case 7:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(128,0,128);
      translate(this.xc,this.yc);
      rect(0,-this.tamY/4,40,10,2);
      noStroke();
      rect(0,0,15,60,5);
      fill(128,0,128);
      text("Tornillo",-this.tamX/4,this.tamY/2.2);
      stroke(3);
      line(-7.5,-15,7.5,-17.5);
      line(-7.5,-10,7.5,-12.5);
      line(-7.5,-5,7.5,-7.5);
      line(-7.5,0,7.5,-2.5);
      line(-7.5,5,7.5,2.5);
      line(-7.5,10,7.5,7.5);
      line(-7.5,15,7.5,12.5);
      line(-7.5,20,7.5,17.5);
      line(-7.5,25,7.5,22.5);
      break;
      
      case 8:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(0,255,0);
      translate(this.xc,this.yc);
      polygon(0,0,30,6);
      fill(255);
      ellipse(0,0,30,30);
      fill(0,255,0);
      text("Tuerca",-this.tamX/4,this.tamY/2.2);
      break;
      
      case 9:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(0,255,0);
      translate(this.xc,this.yc);
      polygon(0,0,30,6);
      fill(255);
      ellipse(0,0,30,30);
      fill(0,255,0);
      text("Tuerca",-this.tamX/4,this.tamY/2.2);
      break;
      
      case 10:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(128,0,0);
      translate(this.xc,this.yc);
      rect(-this.tamX/4-8,0,20,3);
      noFill();
      ellipse(-this.tamX/4-8,-3,3,3);
      line(-this.tamX/4-8,-3,-this.tamX/6,-this.tamY/3);
      ellipse(-this.tamX/6,-this.tamY/3,3,3);
      line(-this.tamX/6,-this.tamY/3,this.tamX/4,this.tamY/8);
      fill(0,255,255);
      rect(this.tamX/4,this.tamY/8,20,5);
      noFill();
      ellipse(this.tamX/4,this.tamY/8,3,3);
      fill(128,0,0);
      rect(this.tamX/4,this.tamY/8+2.5+1.5,30,3);
      text("MBC",-this.tamX/4+10,this.tamY/2.2);
      break;
      
      case 11:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(128,0,0);
      translate(this.xc,this.yc);
      rect(-this.tamX/4-8,0,20,3);
      noFill();
      ellipse(-this.tamX/4-8,-3,3,3);
      line(-this.tamX/4-8,-3,-this.tamX/6,-this.tamY/3);
      ellipse(-this.tamX/6,-this.tamY/3,3,3);
      line(-this.tamX/6,-this.tamY/3,this.tamX/4,this.tamY/8);
      fill(0,255,255);
      rect(this.tamX/4,this.tamY/8,20,5);
      noFill();
      ellipse(this.tamX/4,this.tamY/8,3,3);
      fill(128,0,0);
      rect(this.tamX/4,this.tamY/8+2.5+1.5,30,3);
      text("MBC",-this.tamX/4+10,this.tamY/2.2);
      break;
      
      case 12:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(128,0,0);
      translate(this.xc,this.yc);
      text("E=m*c^2",-25,0);      
      text("Ecuación",-this.tamX/4,this.tamY/2.2);
      break;
      
      case 13:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(128,0,0);
      translate(this.xc,this.yc);
      text("E=m*c^2",-25,0);      
      text("Ecuación",-this.tamX/4,this.tamY/2.2);
      break;
      
      case 14:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(128,0,0);
      translate(this.xc,this.yc);
      bezier(-this.tamX/4,this.tamY/5,-1,-this.tamY/4,0,-this.tamY/4-20,this.tamX/4,this.tamY/5);
      line(-this.tamX/4-5,this.tamY/5+5,this.tamX/4+10,this.tamY/5+5);
      line(-this.tamX/4-5,this.tamY/5+5,-this.tamX/4-5,-this.tamY/2+15);
      text("Diagrama P-V",-this.tamX/4-18,this.tamY/2.2);
      break;
      
      case 15:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(128,0,0);
      translate(this.xc,this.yc);
      bezier(-this.tamX/4,this.tamY/5,-1,-this.tamY/4,0,-this.tamY/4-20,this.tamX/4,this.tamY/5);
      line(-this.tamX/4-5,this.tamY/5+5,this.tamX/4+10,this.tamY/5+5);
      line(-this.tamX/4-5,this.tamY/5+5,-this.tamX/4-5,-this.tamY/2+15);
      text("Diagrama P-V",-this.tamX/4-18,this.tamY/2.2);
      break;
      
      case 16:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(240,128,128);
      translate(this.xc,this.yc);
      ellipse(0,0,30,30);
      line(0,-15,0,-30);
      line(0,15,0,30);
      fill(0);
      textSize(16);
      text("M",-7,5);
      fill(240,128,128);
      textSize(11);
      text("Motor",-this.tamX/4,this.tamY/2.2);
      break;
      
      case 17:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(240,128,128);
      translate(this.xc,this.yc);
      ellipse(0,0,30,30);
      line(0,-15,0,-30);
      line(0,15,0,30);
      fill(0);
      textSize(16);
      text("M",-7,5);
      fill(240,128,128);
      textSize(11);
      text("Motor",-this.tamX/4,this.tamY/2.2);
      break;
      
      case 18:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(240,128,128);
      translate(this.xc,this.yc);
      noFill();
      ellipse(0,0,20,60);
      rotate(PI/4);
      ellipse(0,0,20,60);
      rotate(-PI/2);
      ellipse(0,0,20,60);
      rotate(PI*3/4);
      ellipse(0,0,20,60);
      fill  (70,130,180);
      ellipse(0,0,20,20);
      rotate(-PI/2);
      text("Átomo",-this.tamX/4,this.tamY/2.2);
      break;
      
      case 19:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(240,128,128);
      translate(this.xc,this.yc);
      noFill();
      ellipse(0,0,20,60);
      rotate(PI/4);
      ellipse(0,0,20,60);
      rotate(-PI/2);
      ellipse(0,0,20,60);
      rotate(PI*3/4);
      ellipse(0,0,20,60);
      fill  (70,130,180);
      ellipse(0,0,20,20);
      rotate(-PI/2);
      text("Átomo",-this.tamX/4,this.tamY/2.2);
      break;
      
      case 20:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(240,128,128);
      translate(this.xc,this.yc);
      strokeWeight(3);
      ellipse(-this.tamX*2/6,0,5,5);
      line(-this.tamX*2/6,0,-this.tamX/12,0);
      line(-this.tamX/12,-6,-this.tamX/12,6);
      line(this.tamX/12,-12,this.tamX/12,12);
      line(this.tamX*2/6,0,this.tamX/12,0);
      ellipse(this.tamX*2/6,0,5,5);
      strokeWeight(1);
       fill(255);
      ellipse(-this.tamX*2/6,0,3,3);
      ellipse(this.tamX*2/6,0,3,3);
      fill(0);
      text("Capacitor",-this.tamX/4-5,this.tamY/2.2);
      break;
      
      case 21:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(240,128,128);
      translate(this.xc,this.yc);
      strokeWeight(3);
      ellipse(-this.tamX*2/6,0,5,5);
      line(-this.tamX*2/6,0,-this.tamX/12,0);
      line(-this.tamX/12,-6,-this.tamX/12,6);
      line(this.tamX/12,-12,this.tamX/12,12);
      line(this.tamX*2/6,0,this.tamX/12,0);
      ellipse(this.tamX*2/6,0,5,5);
      strokeWeight(1);
       fill(255);
      ellipse(-this.tamX*2/6,0,3,3);
      ellipse(this.tamX*2/6,0,3,3);
      fill(0);
      text("Capacitor",-this.tamX/4-5,this.tamY/2.2);
      break;
      
      case 22:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(192,192,192);
      translate(this.xc,this.yc);
      noStroke();
      rect(0,0,60,10);
      fill(128,128,128);
      rect(0,0,40,6);
      fill(192,192,192);
      ellipse(-25,0,20,20);
      ellipse(25,0,20,20);
      fill(255);
      rect(-30,0,10,10);
      rect(30,0,10,10);
      stroke(3);
      fill(128,128,128);
      text("Lave",-this.tamX/4+10,this.tamY/2.2);
      break;
      
      case 23:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(192,192,192);
      translate(this.xc,this.yc);
      noStroke();
      rect(0,0,60,10);
      fill(128,128,128);
      rect(0,0,40,6);
      fill(192,192,192);
      ellipse(-25,0,20,20);
      ellipse(25,0,20,20);
      fill(255);
      rect(-30,0,10,10);
      rect(30,0,10,10);
      stroke(3);
      fill(128,128,128);
      text("Lave",-this.tamX/4+10,this.tamY/2.2);
      break;
      
      case 24:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(192,192,192);
      translate(this.xc,this.yc);
      float a = 0.0;
      float inc = TWO_PI/25.0;
      fill  (0,128,128);
      for (int i = 0; i < 50; i+=2) 
      {
        strokeWeight(3);
        point((i-25)*(-1),sin(a)*20);
        a = a + inc;
      }
      line(-25,0,30,0);
      line(-25,0,-25,-30);
      line(-25,0,-25,30);
      strokeWeight(1);
      text("Función seno",-this.tamX/4-15,this.tamY/2.2);
      break;
      
      case 25:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(192,192,192);
      translate(this.xc,this.yc);
      float a1 = 0.0;
      float inc1 = TWO_PI/25.0;
      fill  (0,128,128);
      for (int i = 0; i < 50; i+=2) 
      {
        strokeWeight(3);
        point((i-25)*(-1),sin(a1)*20);
        a1 = a1 + inc1;
      }
      line(-25,0,30,0);
      line(-25,0,-25,-30);
      line(-25,0,-25,30);
      strokeWeight(1);
      text("Función seno",-this.tamX/4-15,this.tamY/2.2);
      break;
      
      case 26:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(192,192,192);
      translate(this.xc,this.yc);
      float a2 = 0.0;
      float inc2 = TWO_PI/25.0;
      fill  (0,128,128);
      for (int i = 0; i < 50; i+=2) 
      {
        strokeWeight(3);
        point((i-25)*(-1),cos(a2)*20);
        a2 = a2 + inc2;
      }
      line(-25,0,30,0);
      line(-25,0,-25,-30);
      line(-25,0,-25,30);
      strokeWeight(1);
      text("Función cos",-this.tamX/4-14,this.tamY/2.2);
      break;
      
      case 27:
      noFill();
      rect(this.xc,this.yc,tamX,tamY,10);
      fill(192,192,192);
      translate(this.xc,this.yc);
      float a3 = 0.0;
      float inc3 = TWO_PI/25.0;
      fill  (0,128,128);
      for (int i = 0; i < 50; i+=2) 
      {
        strokeWeight(3);
        point((i-25)*(-1),cos(a3)*20);
        a3 = a3 + inc3;
      }
      line(-25,0,30,0);
      line(-25,0,-25,-30);
      line(-25,0,-25,30);
      strokeWeight(1);
      text("Función cos",-this.tamX/4-14,this.tamY/2.2);
      break;
      
    }
  }
  
  void tapar()
  {
    fill(128,128,0);
    rect(this.xc,this.yc,this.tamX,this.tamY,10);
  }
  
}

class Jugadores{
  
  //atributos
  int stdo;
  
  //métodos
  //constructor
  Jugadores(int stdo_)
  {
    this.stdo = stdo_; 
  }
  
void jugador_1()
{
  
}
  
 void jugador_2()
{
  
}
}

//*********Fin de Clases*********//

//Variables globales

Pantallas pan;

ArrayList <Carta> cartas;
Carta card;
int count = 0;
float time = 0;
Jugadores usuario;
int[] numbers = new int[28];
float[] posicionX = new float[28];
float[] posicionY = new float[28];


void setup()
{
  size(1000,600);
  pan=new Pantallas();
  
  size(1000,600);
  float h=80;
  float a=100;

 
  
  cartas = new ArrayList <Carta>();
  
  IntList secuencia;
  secuencia=new IntList();
  for(int i=0;i<28;i++)
    secuencia.append(i);
  secuencia.shuffle();
  for(int i=0;i<28;i++)
    numbers[i]=secuencia.get(i); 
  for(int j=113;j<550;j+=500/4)
    for(int i=118;i<900;i+=900/7)
    {      
      cartas.add(new Carta(i,j,h,a,numbers[count]));
      posicionX[count]=i;
      posicionY[count]=j;
      count+=1;
    }
    
    //for(int i=0;i<28;i++)
    //  println(posicionX[i],posicionY[i]);
}

void draw()
{
  pan.display();
  time+=0.01;
}

void mousePressed()
{
  pan.cambio();
  pan.salir();
  pan.regresar();
  pan.click();
 
}

void polygon(float x, float y, float radio, int nPtos) 
{
  float angulo = TWO_PI / nPtos;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angulo) 
  {
    float sx = x + cos(a) * radio;
    float sy = y + sin(a) * radio;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
