const
  inf=1<<29;

var
  ans,n,x,y,i,k:longint;
  f:array[0..500] of longint;

procedure swap(var x,y:longint);
var
  t:longint;
begin
  t:=x;x:=y;y:=t;
end;

procedure main;
var
  i,j,k:longint;
begin
  fillchar(f,sizeof(f),0);
  read(n);ans:=0;
  for i:=1 to n do begin
    read(x,y);
    if x>y then swap(x,y);
    for j:=(x+1)>>1 to (y+1)>>1 do inc(f[j])
  end;
  for i:=1 to 400 do
    if f[i]>ans then ans:=f[i];
  writeln(ans*10);
end;

begin
  read(k);
  for i:=1 to k do main;
end.
