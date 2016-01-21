const
  inf=1<<29;

var
  m,n,max:longint;
  a:array[0..1001,0..1001] of boolean;
  f:array[0..1001,0..1001] of longint;
  
function min(a,b,c:longint):longint;
var
  t:longint;
begin
  t:=a;
  if b<t then t:=b;
  if c<t then t:=c;
  exit(t);
end;

procedure init;
var
  i,j,t:longint;
begin
  fillchar(a,sizeof(a),false);
  readln(n,m);
  for i:=1 to n do begin
    for j:=1 to m do begin
      read(t);
      if t=1 then a[i,j]:=true;
    end;
    readln;
  end;
end;

procedure main;
var
  i,j:longint;
begin
  fillchar(f,sizeof(f),0);
  max:=0;
  for i:=1 to n do
    for j:=1 to m do begin
      if a[i,j]
        then f[i,j]:=min(f[i-1,j],f[i,j-1],f[i-1,j-1])+1
        else f[i,j]:=0;
      if f[i,j]>max then max:=f[i,j];
  end;
  writeln(max);
end;

begin
  init;
  main;
end.
