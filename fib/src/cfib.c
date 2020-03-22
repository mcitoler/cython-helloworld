#include <cfib.h>

long cfib(int n){
    int i;
    long a=0, b=1, tmp=0;
    for (i=0; i<n; ++i) {
        tmp = a; a = a + b; b = tmp;
    }
    return a;
}
