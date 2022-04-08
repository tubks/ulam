PShape spirale1, spirale2;
int a1=0, b1=1, c1=0, a2=0, b2=1, c2=0;
int size_s=10;

void setup(){
  size(600, 600, P3D);
  frameRate(20);
  //background(0);
  spirale1 = spirale(5, polynome(a1,b1,c1));
  spirale2 = spirale(5, polynome(a2,b2,c2)); //problem w tym że to ma shape w środku więc od razu rysuje
  //translate(width/2, height/2, 0);
//może to trzeba dodać: i dont think so
  //rotateX(PI/2);
  //rotateY(PI);
  
  //spirale1.rotateZ(-PI/2);
  //uwaga zajebiste
  //rotateZ(frameCount/20.0);
  //rotateX(frameCount/20.0);
  //translate(width/2, -height/2, 0);
  //float x = width/2;
  //float y = height/2;
  //float size_s = 10;
  //float const_size = 10;
  //int state=0;
  //int nombre=0;
  //FloatList polynome = polynome(a1,b1,c1);
  
}

FloatList polynome(int a, int b, int c){
  FloatList valeurs = new FloatList(2500);
  for(int i=1;i<2500;i++){
    float valeur = a*i*i + b*i + c;
    valeurs.append(valeur);
    }
  return valeurs;
}

PGraphics tex(){
 PGraphics t;
 t = new PGraphics();
 t.beginDraw();
 t.text("37", 7*64, 3*32);
 t.endDraw();
 return t;
}

PShape cube(float num, int side){
  PShape c = createShape(GROUP);
  //c.beginShape();
  //c.fill(255, 255, 0);
  //c.stroke(0);
  PShape w1 = createShape();
  w1.beginShape(QUADS);
  w1.fill(255,255,255);
  //ważne kolorowanie pierwszych - tylko gdzie je wstawić
  if(prime(num)){
    w1.fill(255,0,0);
     }
  w1.vertex(-side,-side,side,0,0);
  w1.vertex( side,-side,side,side,0);
  w1.vertex( side,side,side,side,side);
  w1.vertex(-side,side,side,0,side);
  w1.endShape();
  c.addChild(w1);
    
  PShape w2 = createShape();
  w2.beginShape(QUADS);
  w2.fill(255,255,255);
  //ważne kolorowanie pierwszych - tylko gdzie je wstawić
  if(prime(num)){
    w2.fill(255,0,0);
     }
  // -Z "back" face
  w2.vertex( side, -side, -side, 0, 0);
  w2.vertex(-side, -side, -side, side, 0);
  w2.vertex(-side,  side, -side, side, side);
  w2.vertex( side,side, -side, 0, side);
  w2.endShape();
  c.addChild(w2);
    
  PShape w3 = createShape();
  w3.beginShape(QUADS);
  w3.fill(255,255,255);
  //ważne kolorowanie pierwszych - tylko gdzie je wstawić
  if(prime(num)){
    w3.fill(255,0,0);
     }
  // +Y "bottom" face
  w3.vertex(-side,  side,  side, 0, 0);
  w3.vertex( side,  side,side,side, 0);
  w3.vertex( side,side,-side,side,side);
  w3.vertex(-side, side, -side, 0, side);
  w3.endShape();
  c.addChild(w3);
  
  PShape w4 = createShape();
  w4.beginShape(QUADS);
  w4.fill(255,255,255);
  //ważne kolorowanie pierwszych - tylko gdzie je wstawić
  if(prime(num)){
    w4.fill(255,0,0);
     }
  // -Y "top" face
  w4.vertex(-side, -side, -side, 0, 0);
  w4.vertex( side, -side, -side, side, 0);
  w4.vertex( side, -side, side, side, side);
  w4.vertex(-side,-side,side, 0, side);
  w4.endShape();
  c.addChild(w4);
  
  PShape w5 = createShape();
  w5.beginShape(QUADS);
  w5.fill(255,255,255);
  //ważne kolorowanie pierwszych - tylko gdzie je wstawić
  if(prime(num)){
    w5.fill(255,0,0);
     }
// +X "right" face
  w5.vertex( side, -side, side, 0, 0);
  w5.vertex( side, -side, -side, side, 0);
  w5.vertex( side, side, -side, side, side);
  w5.vertex( side, side, side, 0, side);
  w5.endShape();
  c.addChild(w5);
  
  PShape w6 = createShape();
  w6.beginShape(QUADS);
  w6.fill(255,255,255);
  //ważne kolorowanie pierwszych - tylko gdzie je wstawić
  if(prime(num)){//do rozbudowania, prime zwraca kolor na podstawie sumy dzielników
    w6.fill(255,0,0);
     }
// -X "left" face
  w6.vertex(-side, -side, -side, 0, 0);
  w6.vertex(-side, -side, side, side, 0);
  w6.vertex(-side,  side,  side, side, side);
  w6.vertex(-side, side, -side, 0, side);
  w6.endShape();
  c.addChild(w6);
  //c.endShape();
  return c;
}

PShape spirale(int side, FloatList polynome){
  PShape s = createShape(GROUP);
  int state=0;
  int nombre=0;
  //FloatList polynome = polynome(fetch_coeff(a),fetch_coeff(b),fetch_coeff(c));
  for(float i=0;i<50;i++){
     for(float j=0;j<i;j++){
        //pushMatrix();
        PShape c = cube(polynome.get(nombre),5);
        //c.addChild(cube(polynome.get(nombre),5));
        //c.endShape();
        //spirale1.box(size_s, size_s, size_s);
        shape(c);
        //tworzymy sobie szesc scian i kazda zapisujemy jako child spirali
        s.addChild(c);
        //popMatrix();
        if(state==0){
          translate(size_s, 0, size_s/50);
          }
        else if(state==1){
          translate(0, size_s, size_s/50);
          }
        else if(state==2){
          translate(-size_s, 0, size_s/50);
          }
        else{
          translate(0, -size_s, size_s/50);//co jak wpiszesz 50? :)
          }
        nombre++;
        //popMatrix();
        }
      
      pushMatrix();
      rotate(PI/2);
      //translate(0,0,5*size_s);
      popMatrix();
      state=(state+1)%4;
    }
    //translate(size_s,0);
    //rotate(PI/2);
  //s.endShape();
  return s;
}

int fetch_coeff(int index){
  int coeff=1;
  return coeff;
}

void mouseClicked(){
  if(mouseX>=80 && mouseX<=80+10 && mouseY>=25 && mouseY<=25+10){
    a1++;}
    //print("increased a");}
  else if(mouseX>=80 && mouseX<=80+10 && mouseY>=60 && mouseY<=60+10){
    a1--;}
    //print("decreased a");}
  else if(mouseX>=136 && mouseX<=136+10 && mouseY>=25 && mouseY<=25+10){
    b1++;}
    //print("increased b");}
  else if(mouseX>=136 && mouseX<=136+10 && mouseY>=60 && mouseY<=60+10){
    b1--;}
    //print("decreased b");}
  else if(mouseX>=175 && mouseX<=175+10 && mouseY>=25 && mouseY<=25+10){
    c1++;}
    //print("increased c");}
  else if(mouseX>=175 && mouseX<=175+10 && mouseY>=60 && mouseY<=60+10){
    c1--;}
  else if(mouseX>=80+400 && mouseX<=80+10+400 && mouseY>=25 && mouseY<=25+10){
    a2++;}
    //print("increased a");}
  else if(mouseX>=80+400 && mouseX<=80+10+400 && mouseY>=60 && mouseY<=60+10){
    a2--;}
    //print("decreased a");}
  else if(mouseX>=136+400 && mouseX<=136+10+400 && mouseY>=25 && mouseY<=25+10){
    b2++;}
    //print("increased b");}
  else if(mouseX>=136+400 && mouseX<=136+10+400 && mouseY>=60 && mouseY<=60+10){
    b2--;}
    //print("decreased b");}
  else if(mouseX>=175+400 && mouseX<=175+10+400 && mouseY>=25 && mouseY<=25+10){
    c2++;}
    //print("increased c");}
  else if(mouseX>=175+400 && mouseX<=175+10+400 && mouseY>=60 && mouseY<=60+10){
    c2--;}
    //print("decreased c");}
  //if(){
  //case klikniecia na sześcian
//}
  setup();
  }


boolean prime(float nombre){
  for(int i=2; i<=sqrt(nombre); i++){
    if(nombre%i==0){
      return false;  
    }
   }
      return true;
}

void draw(){
  background(0);
  pushMatrix();
  lights();
  camera();
  beginCamera();
  //translate(width/2, height/2, 0);
  //spirala tutaj, rotacja w draw? yyy
  square(80,25,10);
  square(80,60,10);
  square(136,25,10);
  square(136,60,10);
  square(175,25,10);
  square(175,60,10);
  square(80+400,25,10);
  square(80+400,60,10);
  square(136+400,25,10);
  square(136+400,60,10);
  square(175+400,25,10);
  square(175+400,60,10);
  String s1 = "f(x) = a1x^2 + b1x + c1";
  String s2 = "f(x) = a2x^2 + b2x + c2";
  //fill(50);
  text(s1, 40, 50);
  text(s2, 440, 50);
  text("a1 = ",40, 85);
  text("b1 = ",40, 100);
  text("c1 = ",40, 115);
  text(a1, 70,85);
  text(b1, 70,100);
  text(c1, 70,115);
  text("a2 = ",440, 85);
  text("b2 = ",440, 100);
  text("c2 = ",440, 115);
  text(a2, 470,85);
  text(b2, 470,100);
  text(c2, 470,115);
  popMatrix();
  //ortho();
  pushMatrix();
  translate(width/2, height/2, 0);
  //rotateX(PI/2);
  //rotateY(PI);
  //rotateZ(-PI/2);
  rotateZ(frameCount/20.0);
  shape(spirale1,100,100);
  popMatrix();
  endCamera();
}
