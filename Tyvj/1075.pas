Type
  int=longint;
  
Var
  f:Array[0..2001,0..2011] of int;
  s:Array[0..2001] of int;
  n:int;

Procedure init;
var
  i,j:int;
begin
  readln(n);
  for i:=1 to n do read(s[i]);
  for i:=n downto 1 do inc(s[i],s[i+1]);
end;

Function max(x,y:int):int;
begin
  if x>y then exit(x);exit(y);
end;

Function dp(x,y:int):int;
begin
  if f[x,y]>0 then exit(f[x,y]);
  if y>=n-x+1 then exit(s[x]);
  if y=1 then f[x,y]:=s[x]-dp(x+y,y<<1)
         else f[x,y]:=max(dp(x,y-1),s[x]-dp(x+y,y<<1));
  exit(f[x,y]);
end;

Begin
  init;
  writeln(dp(1,2));
End.