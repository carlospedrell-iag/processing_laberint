import static javax.swing.JOptionPane.*;
Casella[][] caselles;
int quantitat_caselles_x = 10;
int quantitat_caselles_y = 13;

int[] casella_actual = new int [2];
Boolean no_acabat = true;

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
        caselles[i][j] = new Casella(i, j, tamany_caselles);
        //caselles[i][j].printaPosicioCasella();
      }
    }
    this.casella_actual[0] = 0;
    this.casella_actual[1] = 0;
  }
}


void draw(){
  background(255);
  this.printaCaselles();
  
  this.preparaLaberint();
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
  this.comprovaLaberintAcabat();
  if(this.no_acabat){
    casella_actual = avancaCasella(casella_actual);
    save("image.png");//Guardar la imatge
  }else{
    print("Acabat");
  }
}

void comprovaLaberintAcabat(){
  this.no_acabat = false;
  for (int i = 0; i < caselles.length; i++){
    for (int j = 0; j < caselles[i].length; j++){
      if (caselles[i][j].estat_casella == 0){
        no_acabat = true;
      }
    }
  }
}

int[] avancaCasella(int[] casella_actual){
  ArrayList<Casella> caselles_possibles = this.buscaCasellesPossibles(casella_actual);
  ArrayList<Casella> caselles_inexplorades = this.filtraCasellesInexplorades(caselles_possibles);
  
  Casella seguent_casella;
  
  int random_index = 0;
  
  if(caselles_inexplorades.isEmpty()){
    random_index = (int)(random(0,caselles_possibles.size()-1));
    seguent_casella = caselles_possibles.get(random_index);
  }else{
    if (caselles_possibles.size() > 1){
      random_index = (int)(random(0,caselles_inexplorades.size()-1));
      print("\nrandom_index=" + random_index + "  caselles_inexplorades.size()=" + caselles_inexplorades.size());
      seguent_casella = caselles_inexplorades.get(random_index); //<>//
    }else{
      seguent_casella = caselles_inexplorades.get(0);
    }
  }
  
  
  seguent_casella.estat_casella = 1;
  this.destrueixParet(this.caselles[casella_actual[0]][casella_actual[1]], seguent_casella);
  
  casella_actual[0] = seguent_casella.posicio_x;
  casella_actual[1] = seguent_casella.posicio_y;
  
  return casella_actual;
}



ArrayList<Casella> buscaCasellesPossibles(int[] casella_actual){
  ArrayList<Casella> caselles_possibles = new ArrayList<Casella>();
  
  //print("\nCasella actual = " + casella_actual[0] + ", " + casella_actual[1]);
  //this.caselles[casella_actual[0]-1][casella_actual[1]].printaCasella();
  
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



void destrueixParet(Casella casella_A, Casella casella_B){
  if(casella_A.posicio_x > casella_B.posicio_x){
    casella_A.paret_oest = 0;
    casella_B.paret_est = 0;
  }
  
  if(casella_A.posicio_x < casella_B.posicio_x){
    casella_A.paret_est = 0;
    casella_B.paret_oest = 0;
  }
  
  if(casella_A.posicio_y > casella_B.posicio_y){
    casella_A.paret_sud = 0;
    casella_B.paret_nort = 0;
  }
  
  if(casella_A.posicio_y > casella_B.posicio_y){
    casella_A.paret_nort = 0;
    casella_B.paret_sud = 0;
  }
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
