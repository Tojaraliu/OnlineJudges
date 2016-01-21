Const
  inf=1<<29;
  
Type
  int=longint;
  
Var
  f,f0:Array[0..300,0..300] of int;
  d:Array[0..300,0..300] of int;
  n,l,ans:int;
  
Procedure init;
var
  i,j:int;
begin
  readln(l,n);
  for i:=1 to l do
    for j:=1 to l do read(d[i,j]);
end;

Function min(x,y:int):int;
begin
  if x<y then exit(x);exit(y);
end;

Procedure main;
var
  i,j,t,p,q:int;
begin
  fillchar(f0,sizeof(f0),$3F);
  f0[1,2]:=0;p:=3;
  for t:=1 to n do begin
    q:=p;
    read(p);
    fillchar(f,sizeof(f),$3F);
    for i:=1 to l do
      for j:=1 to l do
        if f0[i,j]<$3F3F3F3F then begin
          if (j<>p)and(q<>p) then f[j,q]:=min(f[j,q],f0[i,j]+d[i,p]);
          if (i<>p)and(q<>p) then f[i,q]:=min(f[i,q],f0[i,j]+d[j,p]);
          if (i<>p)and(j<>p) then f[i,j]:=min(f[i,j],f0[i,j]+d[q,p]);
        end;
    f0:=f;
  end;
  ans:=maxlongint;
  for i:=1 to l do
    for j:=1 to l do ans:=min(ans,f[i,j]);
  writeln(ans);
end;

Begin
  init;
  main;
end.