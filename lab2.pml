int loopCount = 10;
int x = 0;

mtype = {P, V}
chan sema = [0] of { mtype };

active proctype dijkstra(){
start: sema ! P -> sema ? V; goto start
}

active proctype A() {
    int i = 0;
    int temp;
    do
    :: i < loopCount ->
      i++;
      sema ? P;
      x++;
      sema ! V;
    :: i >= loopCount -> break
    od
}

active proctype B() {
    int j = 0;
    int temp;
    do
    :: j < loopCount ->
      j++;
      sema ? P;
      if :: (x % 2 == 0) -> printf("x=%d\n", x);
         :: (x % 2 != 0) ->skip
      fi
      sema ! V;
    :: j >= loopCount -> break
    od
}
