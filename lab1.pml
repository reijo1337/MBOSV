#define msgtype 1 
chan name = [0] of { byte, byte }; 
active proctype A() {
    int i = 0;
    do
    :: i < 2 ->
      name ! msgtype(4);
      name ! msgtype(1) ;
      i++;
    :: i >=2 -> break
    od
} 
active proctype B() {
    byte state
    int j = 0
    do
    :: j < 4 ->
      name ? msgtype(state); 
      printf("recive: %d\n", state); 
      j++
    :: j >= 4 -> break
    od
}