Const
  inf=1<<29;
  maxn=1100;
  
Type
  int=longint;
  
Var
  c:Array[0..maxn,0..maxn] of int;
  n,m:int;
  
Function lowbit(x:int):int;
begin
  exit(x and (-x));
end;
  
Procedure change(x,y,t:int);
var
  yt:int;
begin
  while x<=n do begin
    yt:=y;
    while yt<=n do begin
      inc(c[x,yt],t);
      inc(yt,lowbit(yt));
    end;
    inc(x,lowbit(x));
  end;
end;
  
Function get(x,y:int):int;
var
  t:int;
begin
  get:=0;
  while x>0 do begin
    t:=y;
    while t>0 do begin
      inc(get,c[x,t]);
      dec(t,lowbit(t));
    end;
    dec(x,lowbit(x));
  end;
end;

Procedure main;
var
  i,j,x1,y1,x2,y2,opt,t:int;
begin
  while 0=0 do begin
    read(opt);
    case opt of
      1:begin
          readln(x1,y1,t);inc(x1);inc(y1);
          change(x1,y1,t);
        end;
      2:begin
          readln(x1,y1,x2,y2);inc(x1);inc(y1);inc(x2);inc(y2);
          t:=get(x2,y2)-get(x1-1,y2)-get(x2,y1-1)+get(x1-1,y1-1);
          writeln(t);
        end;
      3:exit;
    end;
  end;
end;

Begin
  readln(n);inc(n);
  main;
end.