Type
  int=longint;
  
Var
  a:Array[0..101] of int;
  f:Array[0..101,0..101] of int;
  n:int;
  
Procedure init;
var
  i:int;
begin
  readln(n);
  for i:=1 to n do begin
    read(a[i]);f[i,i]:=a[i];
  end;
end;

Function max(x,y:int):int;
begin
  if x>y then exit(x);exit(y);
end;

Function dp(l,r:int):int;
var
  k:int;
begin
  if f[l,r]>0 then exit(f[l,r]);
  for k:=l to r-1 do
    f[l,r]:=max(f[l,r],max(abs(a[l]-a[r])*(r-l+1),dp(l,k)+dp(k+1,r)));
  exit(f[l,r]);
end;
  
Begin
  init;
  writeln(dp(1,n));
end.