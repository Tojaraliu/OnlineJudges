Type
  int=longint;

Var
  f,root:Array[0..31,0..31] of int;
  a:Array[0..31] of int;
  n:int;

Procedure init;
var
  i:int;
begin
  readln(n);
  for i:=1 to n do read(a[i]);
end;

Function dfs(l,r:int):int;
var
  i,j,x,y:int;
begin
  if l>r then exit(1);
  if l=r then exit(a[l]);
  if f[l,r]>0 then exit(f[l,r]);
  for i:=l to r do begin
    x:=dfs(l,i-1);y:=dfs(i+1,r);
    if x*y+a[i]>f[l,r] then begin
      root[l,r]:=i;
      f[l,r]:=x*y+a[i];
    end;
  end;
  exit(f[l,r]);
end;

Procedure print(l,r:int);
begin
  if l>r then exit;
  if l=r then begin write(l,' ');exit;end;
  write(root[l,r],' ');
  print(l,root[l,r]-1);print(root[l,r]+1,r);
end;

Begin
  init;
  writeln(dfs(1,n));
  print(1,n);
end.