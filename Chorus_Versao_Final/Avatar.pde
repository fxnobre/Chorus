void avatar(){
  pushMatrix();

  //Calcula e desenha a cada 2 pixels
  int skip = 4;

  //Array da profundidade
  int[] depth = kinect.getRawDepth();

  stroke(255);
  strokeWeight(2);
  beginShape(POINTS);
  //Escaneamento de cada pixel
  for (int x1 = 0; x1 < kinect.width; x1+=skip) {
    for (int y1 = 0; y1 < kinect.height; y1+=skip) {
      int offset = x1 + y1 * kinect.width;
      dep = depth[offset];
      //Calcula o x, y e z da camera baseado na profundidade
      PVector point = depthToPointCloudPos(x1, y1, dep);

      if (dep > minDist && dep < maxDist && x1>minLat && x1<kinect.width-minLat) { //Distancia que irá reconhecer objetos
         imgDep.pixels[offset] = color(255, 255, 255); //Pintar de Branco
       } else{
          imgDep.pixels[offset] = color(0); //Se n, pinta de preto
       }  
      
      // Desenhar um ponto
      vertex(point.x, point.y, point.z);
    }
  }
  endShape();
  popMatrix();
}
