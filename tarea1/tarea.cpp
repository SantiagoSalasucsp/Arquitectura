#include <iostream>

using namespace std;


int boothMultiplication(int multiplicando, int multiplicador) {
    int m = multiplicando;
    int q = multiplicador;
    int a = 0;
    int sc = 0;  

    int Q1 = 0;  
    int Q0 = 0;  
    int Q_1 = 0; 
    
    while (sc < 8) { 
        int Q_1_prev = Q_1;
        Q_1 = Q0;
        Q0 = Q1;
        Q1 = q & 1;  
        
        if ((Q1 == 1 && Q0 == 0) || (Q1 == 0 && Q0 == 1)) {
            
            if (Q_1 == 0) {
                a += m;
            } else {
                a -= m;
            }
        }
        
        a >>= 1;
        q >>= 1;
        
        sc++;
    }

    return a;
}

int main() {
    int multiplicando, multiplicador;
    cout << "Ingrese el multiplicando: ";
    cin >> multiplicando;
    cout << "Ingrese el multiplicador: ";
    cin >> multiplicador;

    int resultado = boothMultiplication(multiplicando, multiplicador);

    cout << "El resultado de la multiplicación es: " << resultado << endl;

    return 0;
}
