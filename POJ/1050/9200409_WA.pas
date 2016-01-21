const
  inf=1<<29;

var
  s,a:array[0..200,0..200] of longint;
  f,ft:array[0..200] of longint;
  ans,n:longint;

procedure init;
var
  i,j:longint;
begin
  read(n);
  fillchar(s,sizeof(s),0);
  for i:=1 to n do
    for j:=1 to n do begin
      read(a[i,j]);
      s[i,j]:=s[i,j-1]+a[i,j];
  end;
end;

function max(a,b:longint):longint;
begin
  if a>b then exit(a);exit(b);
end;

function get(x,y:longint):longint;
var
  i:longint;
begin
  for i:=1 to n do f[i]:=s[i,y]-s[i,x-1];
  fillchar(ft,sizeof(ft),0);
  for i:=1 to n do ft[i]:=max(ft[i-1]+f[i],f[i]);
  exit(ft[n]);
end;

procedure work;
var
  i,j:longint;
begin
  ans:=0;
  for i:=1 to n do 
    for j:=i to n do ans:=max(ans,get(i,j));
end;

begin
  init;
  work;
  writeln(ans);
end.