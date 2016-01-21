Type
  int=longint;

var
  a,b,f:array[0..10000] of int;
  n:int;
  
function max(a,b:int):int;
begin
  if a>b then exit(a);
  exit(b);
end;

procedure init;
var
  i:int;
begin
  read(n);
  for i:=1 to n do read(a[i]);
  for i:=1 to n do read(b[i]);
end;

procedure main;
var
  i,j,max:int;
begin
  for i:=1 to n do begin
    max:=0;
    for j:=1 to n do begin
      if (a[i]>b[j])and(f[j]>max) 
        then max:=f[j]
        else if (a[i]=b[j])and(f[j]<max+1) then f[j]:=max+1;
    end;
  end;
end;

procedure print;
var
  i,ans:int;
begin
  ans:=0;
  for i:=1 to n do ans:=max(f[i],ans);
  writeln(ans);
end;

begin
  init;
  main;
  print;
end.