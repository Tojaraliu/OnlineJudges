Const
  inf=1<<29;
  maxn=50050;
  
Type
  int=longint;
  tbit=object
    size:int;
    c:Array[0..maxn] of int;
    Function lowbit(x:int):int;
    Procedure reset(x:int);
    Function getsum(x:int):int;
    Procedure change(x,t:int);
  end;
  
Function tbit.lowbit(x:int):int;
begin
  exit(x and (-x));
end;
Procedure tbit.reset(x:int);
begin
  size:=x;
  fillchar(c,sizeof(c),0);
end;
Function tbit.getsum(x:int):int;
var
  op:int;
begin
  op:=0;
  while x>0 do begin
    inc(op,c[x]);
    dec(x,lowbit(x));
  end;
  exit(op);
end;
Procedure tbit.change(x,t:int);
begin
  while x<=size do begin
    inc(c[x],t);
    inc(x,lowbit(x));
  end;
end;

Var
  c1,c2:tbit;
  n,m:int;

Procedure main;
Var
  opt,i,x,y:int;
begin
  for i:=1 to m do begin
    readln(opt,x,y);
    if opt=1 then begin
      c1.change(x,1);c2.change(y,1);
    end
    else begin
      writeln(c1.getsum(y)-c2.getsum(x-1));
    end;
  end;
end;

Begin
  readln(n,m);
  c1.reset(n);c2.reset(n);
  main;
end.