class ParticleR {
  PVector locationR;
  PVector velocityR;
  PVector accelerationR;
  float lifespanR;

  ParticleR(float x, float y) {
    accelerationR = new PVector(0, -0.5); //eixo e gravidade(velocidade)
    velocityR = new PVector(random(-1, 1), random(-2, 0));
    locationR = new PVector(x,y);
    lifespanR = 255.0; //tempo de vida (em alpha)
}

  void runR() {
    updateR();
    displayR();
  }

  // Method to update position
  void updateR() {
    velocityR.add(accelerationR);
    locationR.add(velocityR);
    lifespanR -= 1.0;
  }

  // Method to display
  void displayR() {
    noStroke();
    fill(241, 107 , 98 ,lifespanR); //Vermelho
    ellipse(locationR.x, locationR.y, 8, 8);
  }

  // quando a particula tiver um alpha menor que zero, ela morre
  boolean isDeadR() {
    if (lifespanR < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

//BLUE
class ParticleB {
  PVector locationB;
  PVector velocityB;
  PVector accelerationB;
  float lifespanB;

  ParticleB(float x, float y) {
    accelerationB = new PVector(0, 0); //eixo e gravidade(velocidade)
    velocityB = new PVector(random(0, 0), random(0, 0));
    locationB = new PVector(x,y);
    lifespanB = 255.0; //tempo de vida (em alpha)
}

  void runB() {
    updateB();
    displayB();
  }

  // Method to update position
  void updateB() {
    velocityB.add(accelerationB);
    locationB.add(velocityB);
    lifespanB -= 5.0;
  }

  // Method to display
  void displayB() {
    noStroke();
    fill(126 , 181 , 208 , lifespanB); //Azul
    ellipse(locationB.x, locationB.y, 16, 16);
  }

  // quando a particula tiver um alpha menor que zero, ela morre
  boolean isDeadB() {
    if (lifespanB < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

//YELLOW
class ParticleY {
  PVector locationY;
  PVector velocityY;
  PVector accelerationY;
  float lifespanY;

  ParticleY(float x, float y) {
    accelerationY = new PVector(0, 0); //eixo e gravidade(velocidade)
    velocityY = new PVector(random(0, 0), random(0, 0));
    locationY = new PVector(x,y);
    lifespanY = 255.0; //tempo de vida (em alpha)
}

  void runY() {
    updateY();
    displayY();
  }

  // Method to update position
  void updateY() {
    velocityY.add(accelerationY);
    locationY.add(velocityY);
    lifespanY -= 5.0;
  }

  // Method to display
  void displayY() {
    noStroke();
    fill(254 , 242 , 132, lifespanY); //Amarelo
    ellipse(locationY.x, locationY.y, 16, 16);
  }

  // quando a particula tiver um alpha menor que zero, ela morre
  boolean isDeadY() {
    if (lifespanY < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
