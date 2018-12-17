class ParticleSystemR {
  ArrayList<ParticleR> particlesR;
  PVector originR;

  ParticleSystemR(PVector locationR) {
    originR = locationR.get();
    particlesR = new ArrayList<ParticleR>();
  }

  void addParticleR(float x, float y) { 
    particlesR.add(new ParticleR(x,y));
  }

  void runR() {
    for (int i = particlesR.size()-1; i >= 0; i--) {
      ParticleR pR = particlesR.get(i);
      pR.runR();
      if (pR.isDeadR()) { //remover da tela
        particlesR.remove(i);
      }
    }
  }
}

//BLUE
class ParticleSystemB {
  ArrayList<ParticleB> particlesB;
  PVector originB;

  ParticleSystemB(PVector locationB) {
    originB = locationB.get();
    particlesB = new ArrayList<ParticleB>();
  }

  void addParticleB(float x, float y) { 
    particlesB.add(new ParticleB(x,y));
  }

  void runB() {
    for (int i = particlesB.size()-1; i >= 0; i--) {
      ParticleB pB = particlesB.get(i);
      pB.runB();
      if (pB.isDeadB()) { //remover da tela
        particlesB.remove(i);
      }
    }
  }
}

//YELLOW
class ParticleSystemY {
  ArrayList<ParticleY> particlesY;
  PVector originY;

  ParticleSystemY(PVector locationY) {
    originY = locationY.get();
    particlesY = new ArrayList<ParticleY>();
  }

  void addParticleY(float x, float y) { 
    particlesY.add(new ParticleY(x,y));
  }

  void runY() {
    for (int i = particlesY.size()-1; i >= 0; i--) {
      ParticleY pY = particlesY.get(i);
      pY.runY();
      if (pY.isDeadY()) { //remover da tela
        particlesY.remove(i);
      }
    }
  }
}
