Const
  s='impossible';

Type
  int=longint;

Var
  f:Array[0..21,0..1001] of int;
  m,v,n:int;

Function max(x,y:int):int;
begin
  if x>y then exit(x);exit(y);
end;

Procedure main;
var
  i,j,k,x,y:int;
begin
  read(m,v,n);
  fillchar(f,sizeof(f),128);f[0,0]:=0;
  for i:=1 to n do begin
    read(x,y);
    for j:=m downto 1 do
      for k:=v downto x do
        f[j,k]:=max(f[j,k],f[j-1,k-x]+y);
  end;
  if f[m,v]<0 then writeln(s) else writeln(f[m,v]);
end;

Begin
  main;
end.
