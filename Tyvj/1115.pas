{
假设我们已经找到了这个答案a，那么对于所有数都有
y=x*a+b
且所有的b都相等，x不是我们关心的。
任意两式相减可以有y1-y2=(x1-x2)*a，要求最大的a，只要求y1-y2的最大公约数即可
但是没有比要求任意两两之间的GCD，只要求所有数减去最小的那个a[i]的最大公约数即可。
TyvjAC200
}

Const
  inf=1<<29;
  
Type
  int=longint;

Var
  n,ans:int;
  a:Array[0..200] of int;

Function gcd(x,y:int):int;
begin
  if x=0 then exit(y);
  if y=0 then exit(x);
  exit(gcd(y,x mod y));
end;

Procedure init;
Var
  i,minj,min,t:int;
begin
  readln(n);
  for i:=1 to n do read(a[i]);
  minj:=1;min:=a[1];
  for i:=2 to n do
    if a[i]<min then begin
      min:=a[i];minj:=i;
    end;
  t:=a[minj];a[minj]:=a[n];a[n]:=t;
end;

Procedure main;
var
  i:int;
begin
  for i:=1 to n-1 do dec(a[i],a[n]);
  dec(n);
  ans:=a[1];
  for i:=2 to n do ans:=gcd(ans,a[i]);
  writeln(ans);
end;

Begin
  init;
  main;
end.