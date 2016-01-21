var
  a:array[0..51,0..51] of longint;
  n,m:longint;
  f:array[0..51,0..51,0..51,0..51]of longint;

procedure init;
var
  i,j:longint;
begin
  readln(m,n);
  for i:=1 to m do begin
    for j:=1 to n do read(a[i,j]);
    readln;
  end;
end;

function max(a,b,c,d:longint):longint;
var
  m:longint;
begin
  m:=-1;
  if a>m then m:=a;
  if b>m then m:=b;
  if c>m then m:=c;
  if d>m then m:=d;
  exit(m);
end;

procedure dp;
var
  x1,x2,y1,y2:longint;
begin
  for x1:=1 to m do 
    for y1:=1 to n do 
      for x2:=x1+1 to m do begin
        y2:=x1+y1-x2;
        if (y2 in[1..n]) then 
          f[x1,y1,x2,y2]:=max(f[x1-1,y1,x2-1,y2],f[x1-1,y1,x2,y2-1],
                              f[x1,y1-1,x2-1,y2],f[x1,y1-1,x2,y2-1])+a[x1,y1]+a[x2,y2];
  end;
  f[m,n,m,n]:=max(f[m-1,n,m-1,n],f[m-1,n,m,n-1],
                  f[m,n-1,m-1,n],f[m,n-1,m,n-1])+a[m,n]+a[m,n];
end;

begin
  opf;
  init;
  dp;
  writeln(f[m,n,m,n]);
  close(output);
end.
