#include <iostream>
#include <vector>

using namespace std;

void convbinario(float x){


    vector<bool> vec;
    vector<bool> ent;


    float k=0;
    int y=0;
    int o=0;
    for(y=0;x>0;y++){
        k=x;
        x--;
        
    }
    y--;
    cout<<"y es: "<<y<<endl;
    //k=k-y;

    cout<<"k es: "<<k<<endl;
    
    for(int m=0;m<23;m++){
        k=k*2;
        o=k/1;
        cout<<k/1<<endl;
        int p=(int)(k);
        bool l=(bool)(p);
        cout<<"l es: "<<l<<endl;
        cout<<"p es: "<<p<<endl;
        if(l){
            k--;
        }

        vec.push_back(p);
        cout<<vec[m]<<endl;

    }

    for(int m=0;m<4;m++){
        cout<<vec[m];
    }

    int res=0;
    int r=1;

    /*for(int e=0;r!=0;e++){
        cout<<"R es: "<<y/2<<endl;
        r=y/2;
        res=y%2;

        ent.push_back((bool)(res));

    }*/

    cout<<"vamos a ver"<<endl;

    for(int m=4;m>0;m++){
        cout<<ent[m];
    }



}


int main(){


    float x=2.375;
    convbinario(x);




}
