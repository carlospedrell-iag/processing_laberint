import static javax.swing.JOptionPane.*;
Casella[][] caselles;
int quantitat_caselles_x = 10;
int quantitat_caselles_y = 13;

void setup() {
    size(800, 800);
     MultiOption m = new MultiOption();
  int[] v = m.askInfo();
  if (v == null || v[0] <= 0 || v[1] <= 0){
    exit();
  }else{
  
  quantitat_caselles_x = v[0];
  quantitat_caselles_y = v[1];
   

  caselles = new Casella[quantitat_caselles_y][quantitat_caselles_x];
  
  int tamany_caselles_x = width / quantitat_caselles_x;
  int tamany_caselles_y = height / quantitat_caselles_y;
  int tamany_caselles = tamany_caselles_x;
  if (tamany_caselles_y < tamany_caselles_x){
    tamany_caselles = tamany_caselles_y;
  }
  //print(tamany_caselles);
  
  
  for (int i = 0; i < quantitat_caselles_y; i++){
    for (int j = 0; j < quantitat_caselles_x; j++){
      //print ("\ni = " + i + "   j = " + j);
      caselles[i][j] = new Casella(tamany_caselles*i, tamany_caselles*j, tamany_caselles);
    }
  }
  
  
  //this.proba_buscaCasellesPossibles();
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

void preparaLaberint(){
  //Aldous-Broder algorithm
  int[] casella_actual = new int [2];
  Boolean no_acabat = true;
  
  casella_actual[0] = 0;
  casella_actual[1] = 0;
  
  while(no_acabat){
    for (int i = 0; i < caselles.length && no_acabat; i++){
      for (int j = 0; j < caselles[i].length && no_acabat; j++){
        if (caselles[i][j].estat_casella == 0){
          no_acabat = false;
        }
      }
    }
    casella_actual = avancaCasella(casella_actual);
  }
}

int[] avancaCasella(int[] casella_actual){
  ArrayList<Casella> caselles_possibles = this.buscaCasellesPossibles(casella_actual);
  ArrayList<Casella> caselles_inexplorades = this.filtraCasellesInexplorades(caselles_possibles);
  
  if(caselles_inexplorades.isEmpty()){
  
  }
  
  return casella_actual;
}



ArrayList<Casella> buscaCasellesPossibles(int[] casella_actual){
  ArrayList<Casella> caselles_possibles = new ArrayList<Casella>();
  
  if (casella_actual[0] > 0) caselles_possibles.add(this.caselles[casella_actual[0]-1][casella_actual[1]]);
  if (casella_actual[0] < this.caselles.length-1) caselles_possibles.add(this.caselles[casella_actual[0]+1][casella_actual[1]]);
  if (casella_actual[1] > 0) caselles_possibles.add(this.caselles[casella_actual[0]][casella_actual[1]-1]);
  if (casella_actual[1] < this.caselles[0].length-1) caselles_possibles.add(this.caselles[casella_actual[0]][casella_actual[1]+1]);
  
  return caselles_possibles;
}



ArrayList<Casella> filtraCasellesInexplorades(ArrayList<Casella> caselles_possibles){
  ArrayList<Casella> caselles_inexplorades = new ArrayList<Casella>();
  
  for (int i = 0; i < caselles_possibles.size(); i++){
    if(caselles_possibles.get(i).estat_casella == 0) caselles_inexplorades.add(caselles_possibles.get(i));
  }
  
  return caselles_inexplorades;
}




void proba_buscaCasellesPossibles(){
  int[] casella_actual = new int [2];
  casella_actual[0] = 5;
  casella_actual[1] = 5;
  
  ArrayList<Casella> CasellesPossibles = this.buscaCasellesPossibles(casella_actual);
  
  
  caselles[casella_actual[0]][casella_actual[1]].estat_casella = 2;
  for (int i = 0; i < CasellesPossibles.size(); i++){
    CasellesPossibles.get(i).estat_casella = 1;
  }
}
