#include<stdio.h>
#include<string.h>
#include<algorithm>
using namespace std;
int qw[203];
struct node
{
 int to;
 int rev;
 int next;
 int u;
}e[20003];
int head[251];
int flag[251];
int q[251];
int f[251];
int g[251];
int dp[251];
int low[251];
int gap[251];
int ans;
int s;
int t;
int N;
const int INF=1073741824;
void make(void)
{
 //bfs make distance
 memset(flag,0,sizeof(flag));
 memset(gap,0,sizeof(gap));
 int i;
 for(i=0;i<=N;i++)
 dp[i]=N;
 int tail,top;
 tail=0;
 top=1;
 q[++tail]=t;
 dp[t]=0;
 flag[t]=1;
 gap[0]++;
 while(top<=tail)
 {
  int x=q[top];
  top++;
  int i;
  for(i=head[x];i!=0;i=e[i].next)
  {
   int y=e[i].to;
   if(flag[y]==0&&e[i].u==0)
   {
    dp[y]=dp[x]+1;
    gap[dp[y]]++;
    flag[y]=1;
    q[++tail]=y;
   }
  }
 }
 
}
int isap(void)
{
 make();//make distance
 int top=s;
 int sum=0;
 low[top]=INF;
 while(dp[s]<N)
 {
//  printf("%d %d\n",top,dp[top]);
  int i,y;
  int vis=0;
  for(i=head[top];i!=0;i=e[i].next)
  {
     y=e[i].to;
   if(dp[top]==dp[y]+1&&e[i].u>0)
   {
    vis=1;
    break;
   }
  }
  //find the illegal edge
  if(vis)
  {
   
   low[y]=min(e[i].u,low[top]);
   f[y]=top;
   g[y]=i;
   top=y;
   if(top==t)
   {
    sum+=low[top];
    for(i=t;i!=s;i=f[i])
    {
     e[g[i]].u-=low[top];
     e[e[g[i]].rev].u+=low[top];
    }
    top=s;
   }
  }
  else
  {
   int i;
   int mi=INF;
   for(i=head[top];i!=0;i=e[i].next)
   {
    if(e[i].u>0)
    {
     mi=min(mi,dp[e[i].to]+1);
    }
   }
   gap[dp[top]]--;
   if(gap[dp[top]]==0)
    break;
   dp[top]=mi;
   gap[mi]++;
   if(top!=s)
    top=f[top];
  }
 }
 return sum;
}
void add(int x,int y,int u)
{
 e[ans].to=y;
 e[ans].next=head[x];
 e[ans].u=u;
 e[ans].rev=ans+1;
 head[x]=ans++;
 e[ans].to=x;
 e[ans].next=head[y];
 e[ans].u=0;
 e[ans].rev=ans-1;
 head[y]=ans++;
}
int judge(int n)
{
 int i;
 int sum=0;
 for(i=1;i<=n;i++)
 {
  if(qw[i]>0)
  {
   if(qw[i]%2==1)
    return 0;
   add(s,i,qw[i]/2);
   sum+=qw[i]/2;
  }
  else
  {
   int u=-qw[i];
   if(u%2==1)
   return 0;
   add(i,t,u/2);
  }
 }
 int z=isap();
 if(z==sum)
  return 1;
 else
  return 0;
}
 
int main()
{
 int rt;
 scanf("%d",&rt);
 while(rt--)
 {
  int n,m;
  scanf("%d %d",&n,&m);
  int i;
  s=n+1;
  t=n+2;
  N=n+2;
  ans=1;
  memset(qw,0,sizeof(qw));
  memset(head,0,sizeof(head));
  for(i=1;i<=m;i++)
  {
   int x,y,d;
   scanf("%d %d %d",&x,&y,&d);
   qw[x]++;
   qw[y]--;
   if(d==0)
   {
    add(x,y,1);
   }
  }
  int z=judge(n);
  if(z)
   printf("possible\n");
  else
   printf("impossible\n");
 }
 return 0;
}