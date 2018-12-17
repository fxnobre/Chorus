void iniciarKinect(){
  kinect = new Kinect(this);
  kinect.initDepth(); //Inciar Depth
  kinect.initVideo(); //Iniciar Video
  kinect.enableMirror(mirror); //espelhar
  imgDep = createImage(kinect.width, kinect.height, RGB);
}
