#define msgtype 1 
chan name = [0] of { byte, byte }; 
proctype A() {
    name ! msgtype(4)
    name ! msgtype(1) 
} 
proctype B() {
    byte state
    name ? msgtype(state) 
    printf("recive: %d\n", state); 
    name ? msgtype(state) 
    printf("recive: %d\n", state); 
} 
init {
    atomic { run A(); run B() } 
}