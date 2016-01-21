const
  inf=1<<29;

var
  n,k,i,curb:longint;
  ans:real;
  b,p:array[0..101,0..101] of longint;
  m:array[0..101] of longint;

procedure init;
var
  i,j:longint;
begin
  read(n);ans:=-inf;
  fillchar(b,sizeof(b),0);
  fillchar(p,sizeof(p),0);
  fillchar(m,sizeof(m),0);
  for i:=1 to n do begin
    read(m[i]);
    for j:=1 to m[i] do read(b[i,j],p[i,j]);
  end;
end;

function max(x,y:real):real;
begin
  if x>y then exit(x);
  exit(y);
end;

function min(x,y:longint):longint;
begin
  if x<y then exit(x);
  exit(y);
end;

function get_sum(tb:longint):longint;
var
  i,j,tmp,sum:longint;
begin
  sum:=0;
  for i:=1 to n do begin
    tmp:=inf;
    for j:=1 to m[i] do if b[i,j]>=tb then tmp:=min(tmp,p[i,j]);
    if tmp>=inf then exit(inf);
    inc(sum,tmp);
  end;
  exit(sum);
end;

procedure work;
var
  i,j:longint;
begin
  for i:=1 to n do
    for j:=1 to m[i] do begin
      curb:=b[i,j];
      ans:=max(ans,curb/get_sum(curb));
  end;
end;

begin
  read(k);
  for i:=1 to k do begin
    init;
    work;
    writeln(ans:0:3);
  end;
end.
