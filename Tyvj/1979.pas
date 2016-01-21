Const
  inf=1<<29;
  
Type
  int=longint;
  
Var
  a:Array[0..200000] of int;
  c:Array[0..200000] of int64;
  n,l:int;
  cnt,tot:int64;
  ans:extended;
  
Procedure init;
var
  i,j:int;
begin
  //Assign(input,'k.in');reset(input);
  readln(n,l);
  for i:=1 to n do read(a[i]);
end;

Function lowbit(x:int):int64;
begin
  exit(x and (-x));
end;

Procedure change(x:int);
begin
  while x<=200000 do begin
    inc(c[x],1);
    inc(x,lowbit(x));
  end;
end;

Function get(x:int):int;
begin
  get:=0;
  while x>0 do begin
    inc(get,c[x]);
    dec(x,lowbit(x));
  end;
end;

Procedure main;
var
  i,j:int;
begin
  tot:=int64(n)*(n-1) div 2;
  cnt:=0;
  fillchar(c,sizeof(c),0);
  for i:=1 to n do begin
    inc(cnt,get(l-a[i]));
    change(a[i]);
  end;
  writeln(cnt/tot:0:2);
end;

Begin
  init;
  main;
end.