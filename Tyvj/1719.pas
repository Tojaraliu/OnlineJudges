//TYVJ 1719 生日蛋糕
//DP，f[i,j]表示以(i,j)为三角形下方节点，处理向上j层所获得的最小值最大。

Const
  inf=1<<60;

Type
  int=longint;
  
Var
  a,s,f:array[0..300,0..300]of int64;
  v:array[0..300,0..300]of boolean;
  n,i,j:int;

Function min(x,y:int64):int64;
begin
  if x<y then exit(x);exit(y);
end;

Function max(x,y:int64):int64;
begin
  if x>y then exit(x);exit(y);
end;

Function sum(x1,y1,x2,y2:int):int64;
begin
  exit(s[x2,y2]-s[x2,y1-1]-s[x1-1,y2]+s[x1-1,y1-1]);
end;

function dp(x,y:int):int64;
var
  i:int;
begin
  if y=0 then exit(inf);
  if v[x,y] then exit(f[x,y]);
  v[x,y]:=true;
  for i:=1 to y do
    f[x,y]:=max(f[x,y],min(sum(x-y+1,n-x+1,x-i+1,n-x+i),
                       min(dp(x,i-1),dp(x-i,y-i))));
  exit(f[x,y]);
end;

Begin
  read(n);
  for i:=1 to n do 
    for j:=1 to n-i+1 do read(a[i,j]);
  for i:=1 to n do 
    for j:=1 to n-i+1 do s[i,j]:=s[i,j-1]+s[i-1,j]-s[i-1,j-1]+a[i,j];
  fillchar(f,sizeof(f),$8f); 
  writeln(dp(n,n));
End.