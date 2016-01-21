Const
  inf=1<<29;
  
Type
  int=longint;
  Arr=Array[0..20,0..20] of int;

Var
  a,b,c:Arr;
  n,m,i:int;
  
Procedure init;
var
  i,j:int;
begin
  fillchar(a,sizeof(a),0);
  readln(n,m);
  if (n=0)and(m=0) then halt;
  dec(n);
  for i:=0 to 15 do
    for j:=0 to 15 do
      if ((i or j)=15)and((i and j) in [0,3,6,12,15]) then a[i,j]:=1;
end;

Function mul(a,b:arr):arr;
var
  i,j,k:int;
  c:Arr;
begin
  fillchar(c,sizeof(c),0);
  for i:=0 to 15 do
    for j:=0 to 15 do
      for k:=0 to 15 do c[i,j]:=(b[i,k]*a[k,j]+c[i,j]) mod m;
  exit(c);
end;

Procedure main;
var
  i:int;
  t:Arr;
begin
  c:=a;t:=a;
  while n>0 do begin
    if odd(n) then c:=mul(c,a);
    a:=mul(a,a);
    n:=n>>1;
  end;
  writeln(c[15,15]);
end;

Begin
  while not(eof) do begin
    init;
    main;
  end;
end.