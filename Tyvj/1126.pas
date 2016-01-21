{
设f[i,j]表示要确定高度为i，并且还有j个蛋可用的最小花费
由于始终考虑最坏情况所以要考虑在k层扔蛋的后果(1<=k<=i)
1、如果蛋碎了，那么说明蛋的硬度在1~k-1之间，那么我们就还需要f[k-1,j-1(少了一个蛋)]+1(本次扔蛋)来确定
1、如果蛋没碎，那么说明蛋的硬度在k~i之间，我们就需要f[i-k,j]+1来确定硬度。
由于是在最坏情况下，所以这两者中的较坏情况一定会发生。
所以方程为f[i,j]:=min(max(f[k-1,j-1],f[i-k,j])+1);
10/24/2012
}

Const
  inf=1<<29;
  
Type
  int=longint;
  
Var
  f:Array[0..1010,0..1001] of int;
  n,m:int;
  
Function min(x,y:int):int;
begin
  if x<y then exit(x);exit(y);
end;

Function max(x,y:int):int;
begin
  if x>y then exit(x);exit(y);
end;

Procedure main;
var
  i,j,k:int;
begin
  fillchar(f,sizeof(f),0);
  for i:=1 to n do f[1,i]:=1;
  for i:=1 to m do f[i,1]:=i;
  for i:=2 to m do
    for j:=2 to n do
      for k:=1 to i do
        if f[i,j]>0 then f[i,j]:=min(f[i,j],max(f[k-1,j-1],f[i-k,j])+1)
        else f[i,j]:=max(f[k-1,j-1],f[i-1,j])+1;
  writeln(f[m,n]);
end;

Begin
  readln(n,m);
  n:=min(n,10);
  main;
end.