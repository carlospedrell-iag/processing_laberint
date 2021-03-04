
class Casella{
  //Paredes:   -1 -> No decidida,  0 -> No pared,  1 -> Sí pared
  int paret_nort = -1;
  int paret_sud = -1;
  int paret_est = -1;
  int paret_oest = -1;
  
  int tamany_parets = 1;
  int posicio_x = 0;
  int posicio_y = 0;
  
  
  Casella(int posicio_x, int posicio_y){
    this.posicio_x = posicio_x;
    this.posicio_y = posicio_y;
  }
  
}
