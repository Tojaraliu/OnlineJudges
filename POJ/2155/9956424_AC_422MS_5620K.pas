Const
  inf=1<<29;
  
Type
  int=longint;
  
Var
  c:Array[0..1100,0..1100] of int;
  n,m,i,j,x1,y1,x2,y2,cc,cases:int;
  opt:char;

Procedure swap(var x,y:int);
var
  t:int;
begin
  t:=x;x:=y;y:=t;
end;

Function lowbit(x:int):int;
begin
  exit(x and (-x));
end;

Procedure change(x,y,dlt:int);
var
  yt:int;
begin
  yt:=y;
  while x<=n do begin
    y:=yt;
    while y<=n do begin
      inc(c[x,y],dlt);inc(y,lowbit(y));
    end;
    inc(x,lowbit(x));
  end;
end;

Function sum(x,y:int):int;
var
  yt:int;
begin
  sum:=0;yt:=y;
  while x>0 do begin
    y:=yt;
    while y>0 do begin
      inc(sum,c[x,y]);dec(y,lowbit(y));
    end;
    dec(x,lowbit(x));
  end;
end;

Begin
  readln(cases);
  for cc:=1 to cases do begin
    readln(n,m);
    fillchar(c,sizeof(c),0);
    for i:=1 to m do begin
      read(opt);
      case opt of
        'C':begin
              readln(x1,y1,x2,y2);
              change(x1,y1,1);
              change(x2+1,y1,1);change(x1,y2+1,1);
              change(x2+1,y2+1,1);
            end;
        'Q':begin
              readln(x1,y1);
              writeln(sum(x1,y1) mod 2);
            end;
      end;
    end;
    writeln;
  end;
end.