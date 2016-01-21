Const
  inf=1<<29;
  max=32001;
  
Type
  int=longint;
  
Var
  lev,a,c:Array[0..50000] of int;
  n,m:int;

Function lowbit(x:int):int;
begin
  exit(x and (-x));
end;
  
Procedure change(i,delta:int);
begin
  while i<=max do begin
    inc(c[i],delta);
    inc(i,lowbit(i));
  end;
end;

Function getsum(i:int):int;
begin
  getsum:=0;
  while i>0 do begin
    inc(getsum,c[i]);
    i:=i-lowbit(i);
  end;
end;

Procedure main;
var
  t,i,x,y:int;
begin
  fillchar(c,sizeof(c),0);fillchar(lev,sizeof(lev),0);
  readln(n);
  for i:=1 to n do begin
    readln(x,y);
    t:=getsum(x+1);
    inc(lev[t]);
    change(x+1,1);
  end;
  //Output
  for i:=0 to n-1 do writeln(lev[i]);
end;

Begin
  main;
End.