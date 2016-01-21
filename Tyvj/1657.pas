Type
  int=longint;
  
Var
  p,a,b,f,g:Array[0..1001,0..1001] of int;
  n:int;
  
Procedure init;
var
  i,j,x:int;
begin
  readln(n);
  for i:=1 to n do
    for j:=1 to n do read(p[i,j]);
  for i:=1 to n do
    for j:=1 to n do begin
      if p[i,j]<>0 then begin
        x:=p[i,j];
        while (x mod 2=0) do begin 
          inc(a[i,j]);
          x:=x>>1;
        end;
        x:=p[i,j];
        while (x mod 5=0) do begin
          inc(b[i,j]);
          x:=x div 5;
        end;
      end;
    end;
end;

Function min(x,y:int):int;
begin
  if X<y then exit(x);exit(y);
end;

Procedure main;
var
  i,j:int;
begin
  fillchar(f,sizeof(f),127);f[1,1]:=a[1,1];
  fillchar(g,sizeof(g),127);g[1,1]:=b[1,1];
  for i:=1 to n do
    for j:=1 to n do begin
      if p[i-1,j]<>0 then begin
        f[i,j]:=min(f[i,j],f[i-1,j]+a[i,j]);
        g[i,j]:=min(g[i,j],g[i-1,j]+b[i,j]);
      end;
      if p[i,j-1]<>0 then begin
        f[i,j]:=min(f[i,j],f[i,j-1]+a[i,j]);
        g[i,j]:=min(g[i,j],g[i,j-1]+b[i,j]);
      end;
  end;
  writeln(min(f[n,n],g[n,n]));
end;

Begin
  init;
  main;
end.
  