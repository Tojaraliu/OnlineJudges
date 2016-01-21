const
  inf=1<<29;

var
  n,m:longint;
  a:array[0..2001] of longint;
  f:array[0..2001,0..1001] of longint;
 
function max(x,y:longint):longint;
begin
  if x>y then exit(x);exit(y);
end;

procedure init;
var
  i:longint;
begin
  readln(n,m);
  for i:=1 to n do read(a[i]);
end;

procedure main;
var
  i,j:longint;
begin
  f[0,0]:=0;
  for i:=1 to n do begin
    for j:=0 to m do begin
      if j<>0 then f[i,j]:=max(f[i,j],f[i-1,j-1]+a[i]);
      if i>=j then f[i,0]:=max(f[i,0],f[i-j,j]);
      f[i,0]:=max(f[i,0],f[i-1,0]);
    end;
  end;
  writeln(f[n,0]);
end;

begin
  init;
  main;
end.