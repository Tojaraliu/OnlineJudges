Const
  inf=1<<29;
  
Type
  int=longint;
  
Var
  f:Array[0..100,0..100] of int;
  n,m,ans:int;
  
Function max(x,y:int):int;
begin
  if x>y then exit(x);exit(y);
end;

Function min(x,y:int):int;
begin
  if x<y then exit(x);exit(y);
end;

Procedure init;
var
  i,j,x,y:int;
begin
  readln(n,m);
  for i:=1 to n do for j:=1 to n do f[i,j]:=inf;
  for i:=1 to n do f[i,i]:=0;
  for i:=1 to m do begin
    read(x,y);
    f[x,y]:=1;f[y,x]:=1;
  end;
end;

Procedure floyed;
var
  i,j,k:int;
begin
  for k:=1 to n do 
    for i:=1 to n do
      for j:=1 to n do
        f[i,j]:=min(f[i,j],f[i,k]+f[k,j]);
  for i:=1 to n do
    for j:=1 to n do ans:=max(ans,f[i,j]);
end;

Begin
  init;
  floyed;
  writeln(ans);
End.