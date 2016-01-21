#include<stdio.h>
#include<math.h>
#include<iostream>
#include<string.h>

#define MAXN 101000
#define For(i,l,r) for(int i=l;i<=r;++i)
#define For2(i,l,r) for(int i=r;l<=i;--i)

using namespace std;

int max(int a,int b){
    return (a>b?a:b);
}

int a[MAXN],f[MAXN];
int n;
const int inf=0x7fffffff;

int Init(){
    scanf("%d",&n);
    if (n==0) return 1;
    For(i,1,n) scanf("%d",&a[i]);
    return 0;
}

void Main(){
    int cur=-inf,sum=-inf;
    memset(f,0,sizeof(f));
    For(i,1,n){
        if (cur>0) cur+=a[i];
        else cur=a[i];
        if (cur>sum){
            sum=cur;
            f[i]=sum;
        }
    }
    int ans=-inf;
    cur=0;sum=-inf;
    For2(i,2,n){
        if (cur>0) cur+=a[i];
        else cur=a[i];
        if (cur>sum) sum=cur;
        ans=max(ans,sum+f[i-1]);
    }
    printf("%d\n",ans);
}

int main()
{
    for(;;){
        if (Init()) break;
        Main();
    }
    return 0;
}