var
  a:array[0..101,0..101] of shortint;
  f:array[0..101,0..101] of longint;
  n,m:longint;

function max(x,y:longint):longint;
begin
  if x>y then exit(x);exit(y);
end;

procedure init;
var
  i,j:longint;
begin
  readln(n,m);
  for i:=1 to n do
    for j:=1 to m do read(a[i,j]);
  fillchar(f,sizeof(f),0);
  for i:=1 to n do f[i,0]:=-1<<29;
end;

procedure dp;
var
  i,j:longint;
begin
  for i:=1 to n do
    for j:=1 to m do
      f[i,j]:=max(f[i-1,j-1]+a[i,j],f[i,j-1]);
end;

begin
  init;
  dp;
  writeln(f[n,m]);
end.
