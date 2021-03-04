class Casella{
  //Parets:   -1 -> No decidida,  0 -> No pared,  1 -> Sí pared
  int paret_nort = -1;
  int paret_sud = -1;
  int paret_est = -1;
  int paret_oest = -1;
  
  int tamany_parets = 1;
  int posicio_x = 0;
  int posicio_y = 0;
  
  //Estat: 0 -> inexplorada,  1 -> explorada,  2 -> acabada
  int estat_casella = 0;
  
  
  Casella(int posicio_x, int posicio_y, int tamany){
    this.posicio_x = posicio_x;
    this.posicio_y = posicio_y;
    this.tamany_parets = tamany;
  }
  
  void display(){
    
    switch(estat_casella){
      case 0: fill(115,115,115);break;
      case 1: fill (100, 160, 160);break;
      case 2: fill (255, 255, 255);break;
      default: print("\nError en el estat de la casella");break;
    }
    noStroke();
    square(posicio_x, posicio_y, tamany_parets);
    
    
    stroke(10);
    if (paret_nort != 0) {
      line(posicio_x, posicio_y, posicio_x+tamany_parets, posicio_y);
    }
    if (paret_sud != 0) {
      line(posicio_x, posicio_y+tamany_parets, posicio_x+tamany_parets, posicio_y-tamany_parets);
    }
    if (paret_est != 0) {
      line(posicio_x+tamany_parets, posicio_y, posicio_x+tamany_parets, posicio_y+tamany_parets);
    }
    if (paret_oest != 0) {
      line(posicio_x, posicio_y, posicio_x, posicio_y+tamany_parets);
    }
  }
  
}
