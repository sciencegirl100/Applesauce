#ifndef CLEAR_H
#define CLEAR_H

#include <conio.h>

void clear(int w, int h){
    int i = 0;
    int j = 0;
    for(i=0; i<h; i++) {
        for(j=0; j<w; j++) {
            cputs(" ");
        }
        cputs("\n\r");
    }
}
#endif