#include<stdio.h>
#include<string.h>
#include<iostream>
#include<algorithm>
using namespace std;
typedef struct
{
 int x;
 int y;
 int id;
}edge;
edge s[100005];
int maxa;
int c[100005],tag[100005];
bool cmp(edge s1,edge s2)
{
 if(s1.y!=s2.y)
 {
  return s1.y>s2.y;
 }
 else
 {
  return s1.x<s2.x;
 }
}
int lowbit(int t)
{
 return (t&(-t));
}
int getsum(int end)
{
 int sum;
 sum=0;
 while(end>0)
 {
  sum+=c[end];
  end-=lowbit(end);
 }
 return sum;
}
void modify(int pos,int detal)
{
 while(pos<=maxa)
 {
  c[pos]+=detal;
  pos+=lowbit(pos);
 }
}
int main()
{
 int n,i;
 while(scanf("%d",&n)!=EOF)
 {
  if(n==0)
  {
   break;
  }
  maxa=0;
  for(i=0;i<n;i++)
  {
   scanf("%d%d",&s[i].x,&s[i].y);
   s[i].x++;
   s[i].y++;
   s[i].id=i;
   if(maxa<s[i].x)
   {
    maxa=s[i].x;
   }
  }
  sort(s,s+n,cmp);
  memset(tag,0,sizeof(tag));
  memset(c,0,sizeof(c));
  for(i=0;i<n;i++)
  {
   if(i==0)
   {
    tag[s[i].id]=getsum(s[i].x);
    modify(s[i].x,1);
    
   }
   else
   {
    if(s[i].x==s[i-1].x&&s[i].y==s[i-1].y)
    {
     tag[s[i].id]=tag[s[i-1].id];
    }
    else
    {
     tag[s[i].id]=getsum(s[i].x);
    }
    modify(s[i].x,1);
   }
  }
  for(i=0;i<n;i++)
  {
   printf("%d",tag[i]);
   if(i!=n-1)
   {
    printf(" ");
   }
  }
  printf("\n");
 }
}