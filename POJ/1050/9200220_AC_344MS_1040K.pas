const
  inf=1<<29;

var
  s,a:array[0..200,0..200] of longint;
  ans,n:longint;

procedure init;
var
  i,j:longint;
begin
  read(n);
  for i:=1 to n do
    for j:=1 to n do read(a[i,j]);
  for i:=1 to n do
    for j:=1 to n do s[i,j]:=s[i-1,j]+s[i,j-1]-s[i-1,j-1]+a[i,j];
end;

function max(a,b:longint):longint;
begin
  if a>b then exit(a);exit(b);
end;

function get(x1,x2,y1,y2:longint):longint;
begin
  exit(s[x2,y2]+s[x1-1,y1-1]-s[x1-1,y2]-s[x2,y1-1]);
end;

procedure work;
var
  x1,x2,y1,y2:longint;
begin
  for x1:=1 to n do 
    for x2:=x1 to n do 
      for y1:=1 to n do 
        for y2:=y1 to n do 
          ans:=max(ans,get(x1,x2,y1,y2));
end;

begin
  init;
  work;
  writeln(ans);
end.
