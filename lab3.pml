mtype = {
    GET, 
    HEAD, 
    POST, 
    PUT, 
    DELETE, 
    TRACE, 
    OPTIONS, 
    CONNECT, 
    PATCH, 
    INFORMATIONAL, 
    SUCCESSFUL, 
    REDIRECTION, 
    CLIENT_ERROR, 
    SERVER_ERROR
}

chan http = [0] of { mtype };

active proctype client() {
start:
    if :: http ! GET -> printf("client: send GET\n")
       :: http ! HEAD -> printf("client: send HEAD\n")
       :: http ! POST -> printf("client: send POST\n")
       :: http ! PUT -> printf("client: send PUT\n")
       :: http ! DELETE -> printf("client: send DELETE\n")
       :: http ! TRACE -> printf("client: send TRACE\n")
       :: http ! OPTIONS -> printf("client: send OPTIONS\n")
       :: http ! CONNECT -> printf("client: send CONNECT\n")
       :: http ! PATCH -> printf("client: send PATCH\n")
    fi
    if :: http ? INFORMATIONAL -> printf("client: recive INFORMATIONAL\n")
       :: http ? SUCCESSFUL -> printf("client: recive SUCCESSFUL\n")
       :: http ? REDIRECTION -> printf("client: recive REDIRECTION\n")
       :: http ? CLIENT_ERROR -> printf("client: recive CLIENT_ERROR\n")
       :: http ? SERVER_ERROR -> printf("client: recive SERVER_ERROR\n")
    fi
    goto start
}



active proctype server() {
start:
    if :: http ? GET -> printf("server: recive GET\n")
       :: http ? HEAD -> printf("server: recive HEAD\n")
       :: http ? POST -> printf("server: recive POST\n")
       :: http ? PUT -> printf("server: recive PUT\n")
       :: http ? DELETE -> printf("server: recive DELETE\n")
       :: http ? TRACE -> printf("server: recive TRACE\n")
       :: http ? OPTIONS -> printf("server: recive OPTIONS\n")
       :: http ? CONNECT -> printf("server: recive CONNECT\n")
       :: http ? PATCH -> printf("server: recive PATCH\n")
    fi
    if :: http ! INFORMATIONAL -> printf("server: send INFORMATIONAL\n")
       :: http ! SUCCESSFUL -> printf("server: send SUCCESSFUL\n")
       :: http ! REDIRECTION -> printf("server: send REDIRECTION\n")
       :: http ! CLIENT_ERROR -> printf("server: send CLIENT_ERROR\n")
       :: http ! SERVER_ERROR -> printf("server: send SERVER_ERROR\n")
    fi
    goto start
}