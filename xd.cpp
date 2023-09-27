#include <iostream>
#include <vector>

using namespace std;


int elevadoa(int x,int y){

    for(int k=x;y-1;y--){
        x*=2;
    }


    return x;
}


void invertir(int *ini, int *fin){
    while(ini<fin){
        swap(*ini,*fin);
        ini++;
        fin--;
    }
}


void convbinario(float x){


    vector<bool> vec;
    //vector<bool> ent;

    int ent[8]={0,0,0,0,0,0,0,0};


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
        //cout<<"l es: "<<l<<endl;
        //cout<<"p es: "<<p<<endl;
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

    while(y>0){
        cout<<"Funciona? ";
        if(y%2==1){
            y--;
            ent[0]=1;
        }
        int n=0;
        int e=2;
        while(y>=elevadoa(e,n)){
            n++;

        }
        ent[n-1]=1;
        y-=elevadoa(e,n-1);
    }



    for(int *h=ent;h<ent+8;h++){
        cout<<*h<<" ";
    }
    cout<<endl;
    invertir(ent,ent+7);

    for(int *h=ent;h<ent+8;h++){
        cout<<*h<<" ";
    }
    cout<<" . ";

    for(int m=0;m<4;m++){
        cout<<vec[m];
    }

    



}


int main(){


    float x=2.375;
    convbinario(x);
    



}
