const
  inf=1<<29;

var
  s,a:array[0..200,0..200] of longint;
  f,ft:array[0..200] of longint;
  ans,n,tmp:longint;

procedure init;
var
  i,j:longint;
begin
  read(n);
  fillchar(s,sizeof(s),0);
  for i:=1 to n do
    for j:=1 to n do begin
      read(s[i,j]); inc(s[i,j],s[i,j-1]);
  end;
end;

function max(a,b:longint):longint;
begin
  if a>b then exit(a);exit(b);
end;

procedure work;
var
  i,j,k:longint;
begin
  ans:=-inf;
  for i:=1 to n do
    for j:=i to n do begin
      tmp:=0;
      for k:=1 to n do begin
        tmp:=max(tmp,0)+s[k,j]-s[k,i-1];
        ans:=max(ans,tmp);
      end;
    end;
end;

begin
  init;
  work;
  writeln(ans);
end.
