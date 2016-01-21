Type
  int=longint;

Var
  f,g,a:array[0..320] of int;
  n,ans,i:int;

Function max(a,b:longint):longint;
begin
  if a>b then exit(a);exit(b);
end;

Procedure init;
var
  i:int;
begin
  readln(n);
  fillchar(f,sizeof(f),0);fillchar(g,sizeof(g),0);
  for i:=1 to n do read(a[i]);
end;

Procedure main;
var
  i,j:int;
begin
  for i:=1 to n do begin
    f[i]:=1;
    for j:=1 to i-1 do
      if a[j]<a[i] then f[i]:=max(f[i],f[j]+1);
  end;

  for i:=n downto 1 do begin
    g[i]:=1;
    for j:=i+1 to n do
      if a[j]<a[i] then g[i]:=max(g[i],g[j]+1);
  end;
end;

begin
  init;
  main;
  ans:=0;
  for i:=1 to n do ans:=max(ans,g[i]+f[i]);
  writeln(n-ans+1);
  close(output);
end.