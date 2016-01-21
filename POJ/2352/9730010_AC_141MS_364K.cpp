#include<cstdio>
#include<cstring>
#include<algorithm>
using namespace std;

#define MAXN 17000
#define MAX 32001
#define LOWBIT(x) ((x)&(-(x)))
#define REP(i,n) for(i=0;i<(int)n;i++)
#define Clr(x) memset(x,0,sizeof(x))

int s[34000];
inline void update(int x,int delta){
    for(;x<=MAX;x+=LOWBIT(x))
        s[x]+=delta;
}

inline int getSum(int x){
    int res=0;
    for(;x;x-=LOWBIT(x))
        res+=s[x];
    return res;
}

int n,Cnt[MAXN];

int main(){
    int x,y,i,rank;
    scanf("%d",&n);
    Clr(s),Clr(Cnt);
    REP(i,n){
        scanf("%d%d",&x,&y);
        rank=getSum(x+1);
        ++Cnt[rank];
        update(x+1,1);
    }
    REP(i,n) printf("%d\n",Cnt[i]);
    return 0;
}
