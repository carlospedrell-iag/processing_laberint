Casella[][] caselles;
int quantitat_caselles_x = 10;
int quantitat_caselles_y = 15;

void setup() {
  size(800, 800);
  caselles = new Casella[quantitat_caselles_y][quantitat_caselles_x];
  
  int tamany_caselles_x = width / quantitat_caselles_x;
  int tamany_caselles_y = height / quantitat_caselles_y;
  int tamany_caselles = tamany_caselles_x;
  if (tamany_caselles_y < tamany_caselles_x){
    tamany_caselles = tamany_caselles_y;
  }
  print(tamany_caselles);
  
  
  for (int i = 0; i < caselles.length; i++){
    for (int j = 0; j < caselles[i].length; j++){
      //print ("\ni = " + i + "   j = " + j);
      caselles[i][j] = new Casella(tamany_caselles*i, tamany_caselles*j, tamany_caselles);
    }
  }
}


void draw(){
  background(0);
  this.printaCaselles();
}



void printaCaselles(){
  for (int i = 0; i < caselles.length; i++){
    for (int j = 0; j < caselles[i].length; j++){
      //print ("\ni = " + i + "   j = " + j);
      caselles[i][j].display();
    }
  }
}
