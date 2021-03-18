class Casella{
  //Parets:   -1 -> No decidida,  0 -> No pared,  1 -> Sí pared
  int paret_nort = -1;
  int paret_sud = -1;
  int paret_est = -1;
  int paret_oest = -1;
  
  int tamany_parets = 5;
  int tamany_casella = 1;
  int posicio_x = 0;
  int posicio_y = 0;
  int tamany_x;
  int tamany_y;
  
  //Estat: 0 -> inexplorada,  1 -> explorada,  2 -> acabada
  int estat_casella = 0;
  
  Casella(){}
  
  Casella(int posicio_x, int posicio_y, int tamany_casella){
    this.posicio_x = posicio_x;
    this.posicio_y = posicio_y;
    this.tamany_casella = tamany_casella;
    
    this.tamany_x = posicio_x*this.tamany_casella;
    this.tamany_y = posicio_y*this.tamany_casella;
  }
  
  void display(){
    
    switch(estat_casella){
      case 0: fill(115,115,115);break;
      case 1: fill (100, 160, 160);break;
      case 2: fill (255, 255, 255);break;
      default: print("\nError en el estat de la casella");break;
    }
    noStroke();
    square(tamany_x, posicio_y*this.tamany_casella, tamany_parets);
    
    
    stroke(tamany_parets);
    if (paret_nort != 0) {
      line(tamany_x, tamany_y, tamany_x+tamany_casella, tamany_y);
    }
    if (paret_sud != 0) {
      line(tamany_x, tamany_y+tamany_casella, tamany_x+tamany_casella, tamany_y+tamany_casella);
    }
    if (paret_est != 0) {
      line(tamany_x+tamany_casella, tamany_y, tamany_x+tamany_casella, tamany_y+tamany_casella);
    }
    if (paret_oest != 0) {
      line(tamany_x, tamany_y, tamany_x, tamany_y+tamany_casella);
    }
  }
  
  void printaCasella(){
    print("\nparet_nort = " + paret_nort);
    print("\nparet_sud = " + paret_sud);
    print("\nparet_est = " + paret_est);
    print("\nparet_oest = " + paret_oest);
    
    print("\ntamany_parets = " + tamany_parets);
    print("\nposicio_x = " + posicio_x);
    print("\nposicio_y = " + posicio_y);
    print("\nestat_casella = " + estat_casella);
  }
  
  void printaPosicioCasella(){
    print("\n");
    print("\nposicio_x = " + posicio_x);
    print("\nposicio_y = " + posicio_y);
    print("\nestat_casella = " + estat_casella);
  }
  
}
