Const
  inf=1<<28;

Type
  int=longint;

Var
  a,f:Array[0..201,0..201] of int;
  p:Array[0..201] of int;
  n,ans:int;

Function min(x,y:int):int;
begin
  if x<y then exit(x);exit(y);
end;

Procedure init;
var
  i,j:int;
begin
  readln(n);
  for i:=1 to n do begin
    for j:=1 to n do begin
      read(a[i,j]);
      if a[i,j]=0 then a[i,j]:=inf;
    end;
    readln;
  end;
  for i:=1 to n do read(p[i]);
end;

Procedure Floyed;
var
  i,j,k:int;
begin
  f:=a;
  for k:=1 to n do
    for i:=1 to n do
      for j:=1 to n do
        f[i,j]:=min(f[i,j],f[i,k]+f[k,j]);
  for i:=1 to n do f[i,i]:=0;
end;

Procedure main;
var
  i,j,t,tt:int;
begin
  ans:=inf;tt:=0;
  for i:=1 to n do begin
    t:=0;
    for j:=1 to n do inc(t,f[i,j]*p[j]);
    if t<ans then begin tt:=i;ans:=t;end;
  end;
  writeln(tt);
  writeln(ans);
end;

Begin
  init;
  Floyed;
  main;
end.
