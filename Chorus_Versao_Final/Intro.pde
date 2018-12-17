void intro(int x, int y){
  if(millis()<20000){
    if(millis()<=8999)
    image(ChorusMain,x,y);
    
    if(millis()>9000){
      image(ChorusFoto2,x,y);
    }
    
  }

}  
