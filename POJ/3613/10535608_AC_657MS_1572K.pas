Const
  inf=1<<29-10;
  
Type
  int=longint;
  Arr=Array[0..210,0..210] of int;
  
Var
  f,ans:Arr;
  b:Array[0..2000000] of int;
  n,m,st,ed,tot:int;
  
Function min(x,y:int):int;
begin
  if x<y then exit(x);exit(y);
end;
  
Procedure init;
var
  i,j,x,y,z:int;
begin
  readln(n,m,st,ed);tot:=0;
  fillchar(f,sizeof(f),$3f);
  for i:=1 to m do begin
    readln(z,x,y);
    if b[x]=0 then begin
      inc(tot);
      b[x]:=tot;
    end;
    if b[y]=0 then begin
      inc(tot);
      b[y]:=tot;
    end;
    f[b[x],b[y]]:=z;
    f[b[y],b[x]]:=z;
  end;
  st:=b[st];ed:=b[ed];
end;

Function floyd(var b,c:Arr):Arr;
var
  i,j,k:int;
  tmp:Arr;
begin
  fillchar(tmp,sizeof(tmp),$3f);
  for k:=1 to tot do
    for i:=1 to tot do
      for j:=1 to tot do tmp[i,j]:=min(tmp[i,j],b[i,k]+c[k,j]);
  exit(tmp);
end;

Procedure main;
var
  i,j:int;
begin
  fillchar(ans,sizeof(ans),$3f);
  for i:=1 to tot do ans[i,i]:=0;
  while n>0 do begin
    if (n and 1)=1 then ans:=floyd(ans,f);
    n:=n>>1;
    f:=floyd(f,f);
  end;
  writeln(ans[st,ed]);
end;

Begin
  init;
  main;
end.