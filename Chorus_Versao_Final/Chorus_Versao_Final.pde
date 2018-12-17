//Importando bibliotecas 
import org.openkinect.processing.*; //Kinect
import ddf.minim.*; //Musica

//Variáveis música
Minim minim;
AudioPlayer player;
  
//Definindo o Kinect
Kinect kinect;

//Variáveis das partículas
ParticleSystemR psR; //VERMELHO
ParticleSystemB psB; //AZUL
ParticleSystemY psY; //AMARELO

//Variaveis do Kinect
float minDist = 300; //min distancia do Kinect
float maxDist = 990; //max distancia do Kinect
float minLat = 50;   //lateral
PImage imgDep; //Profundidade
int dep;
PImage imgVid; //Video RGB

color trackColorR; //Variavel que guarda a cor a ser rastreada VERMELHO
color trackColorB; //Variavel que guarda a cor a ser rastreada AZUL
color trackColorY; //Variavel que guarda a cor a ser rastreada AMARELO
float range = 100; //margem de aceitação de cor

boolean red = false; //Ativador de particulas
boolean blue = false; //Ativador de particulas
boolean yellow = false; //Ativador de particulas

boolean mirror = true; //espelhamento ativado
boolean showVideo = false; //camera desabilitada

//timer
float timeCheck;
float intervalo;

//Imagens da introdução
PImage ChorusMain;
PImage ChorusFoto2;

void setup() {
  size(1280, 480, P3D);
  iniciarKinect();
  musica();
  
  //tracking da cor
  trackColorR = color(255,0,0); //RED
  trackColorB = color(26,1,250); //BLUE
  trackColorY = color(232,234,1); //YELLOW
  
  //PARTICULAS
  psR = new ParticleSystemR(new PVector(0, 0)); //posição inicial na tela
  psB = new ParticleSystemB(new PVector(0, 0)); //posição inicial na tela
  psY = new ParticleSystemY(new PVector(0, 0)); //posição inicial na tela
  
  //Timer
  timeCheck = millis();
  intervalo = 1000; //2 sec.
  
  //Imagens da introducao
  ChorusMain = loadImage("ChorusIMG.png");
  ChorusFoto2  = loadImage("ChorusIMG2.png");
}


void draw() {
  timer();
  background(0);
  intro(640,0);
  imgDep.loadPixels();
  PImage imgVid = kinect.getVideoImage();
  avatar();
  
  
  //Mostrar ou não o video Image
  if(showVideo){
   image(imgVid, 640, 0);
  } else{
    background(0);
  }
  
  //Cordenadas XY da cor mais próxima de VERMELHO
  float avgXR = 0;
  float avgYR = 0;
  int countR = 0; //contar quantos pixels são da cor VERMELHA
  
  //Cordenadas XY da cor mais próxima de AZUL
  float avgXB = 0;
  float avgYB = 0;
  int countB = 0; //contar quantos pixels são da cor AZUL
  
  //Cordenadas XY da cor mais próxima de AMARELO
  float avgXY = 0;
  float avgYY = 0;
  int countY = 0; //contar quantos pixels são da cor AMARELO
  
  //PARTICULAS RED
  if(timeCheck > 21000  && timeCheck < 201000){ //dentro desse tempo
  //Analisar cada pixel para saber se é VERMELHO
  for(int x2 = 0; x2 < imgVid.width; x2++){
    for(int y2 = 0; y2 < imgVid.height; y2++){
      int loc = x2 + y2*imgVid.width;
      //RGB do antigo worldRecord
      color currentColor = imgVid.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      //RGB do novo worldRecord
      float r2 = red(trackColorR);
      float g2 = green(trackColorR);
      float b2 = blue(trackColorR);
      
      //Calcular a distancis RGB entre esses dois pixels
      float disR = dist(r1,g1,b1,r2,g2,b2);
      
      //Se o pixel atual for mais VEREMELHO que o antigo, ele será o novo ponto de referência
      if(disR < range){
        red = true;
        //pega a posição dele na tela
        avgXR += x2;
        avgYR += y2;
        countR++; //contador
      }
    }
  }
  
    //Se o contador for maior do que 0
  if(countR>0){
    avgXR = avgXR / countR; //average
    avgYR = avgYR / countR; //average
  }
  
  if(red){
   psR.addParticleR(avgXR+640, avgYR);
   psR.runR();
  } 
   
  } 
  
  //PARTICULAS BLUE
  if(timeCheck > 45000 && timeCheck < 178000){ //dentro desse tempo
  //Analisar cada pixel para saber se é AZUL
  for(int x3 = 0; x3 < imgVid.width; x3++){
    for(int y3 = 0; y3 < imgVid.height; y3++){
      int loc = x3 + y3*imgVid.width;
      //RGB do antigo worldRecord
      color currentColor = imgVid.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      //RGB do novo worldRecord
      float r2 = red(trackColorB);
      float g2 = green(trackColorB);
      float b2 = blue(trackColorB);
      
      //Calcular a distancis RGB entre esses dois pixels
      float disB = dist(r1,g1,b1,r2,g2,b2);
      
      //Se o pixel atual for mais AZUL que o antigo, ele será o novo ponto de referência
      if(disB < range){
        blue = true;
        //pega a posição dele na tela
        avgXB += x3;
        avgYB += y3;
        countB++; //contador
      }
    }
  }
  
  //Se o contador for maior do que 0
  if(countB>0){
    avgXB = avgXB / countB; //average
    avgYB = avgYB / countB; //average
  }
  
  if(blue){
   psB.addParticleB(avgXB+640, avgYB);
   psB.runB();
  }
  
 } 
  
  //PARTICULAS YELLOW
  if(timeCheck > 66000 && timeCheck < 166000){ //dentro desse tempo
   //Analisar cada pixel para saber se é AMARELO
  for(int x4 = 0; x4 < imgVid.width; x4++){
    for(int y4 = 0; y4 < imgVid.height; y4++){
      int loc = x4 + y4*imgVid.width;
      //RGB do antigo worldRecord
      color currentColor = imgVid.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      //RGB do novo worldRecord
      float r2 = red(trackColorY);
      float g2 = green(trackColorY);
      float b2 = blue(trackColorY);
      
      //Calcular a distancis RGB entre esses dois pixels
      float disY = dist(r1,g1,b1,r2,g2,b2);
      
      //Se o pixel atual for mais AMARELO que o antigo, ele será o novo ponto de referência
      if(disY < range){
        yellow=true;
        //pega a posição dele na tela
        avgXY += x4;
        avgYY += y4;
        countY++; //contador
      }
    }
  }
  
   //Se o contador for maior do que 0
  if(countY>0){
    avgXY = avgXY / countY; //average
    avgYY = avgYY / countY; //average
  }
  
  if(yellow){
   psY.addParticleY(avgXY+640, avgYY);
   psY.runY();
  }
  
} 
  
  imgDep.updatePixels();
  image(imgDep, 0, 0);
  intro(640,0); 
}

//calculte the xyz camera position based on the depth data
PVector depthToPointCloudPos(int x, int y, float depthValue) {
  PVector point = new PVector();
  point.z = (depthValue);// / (1.0f); // Convert from mm to meters
  point.x = (x - CameraParams.cx) * point.z / CameraParams.fx;
  point.y = (y - CameraParams.cy) * point.z / CameraParams.fy;
  return point;
}
