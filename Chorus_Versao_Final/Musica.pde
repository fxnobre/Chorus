void musica(){
    minim = new Minim(this);
    player = minim.loadFile("data/Chorus.mp3");
    player.play();
}
