Type
  int=longint;
  point=record
    x,y,step:int;
  end;

Var
  dx:array[1..8] of int=(-1,-1,-1,0,0,1,1,1);
  dy:array[1..8] of int=(-1,0,1,-1,1,-1,0,1);
  v:Array[0..111,0..111] of boolean;
  q:array[0..100000] of point;
  mx,my,x,y:int;
  ans:int;

Function max(x,y:int):int;
begin
  if x>y then exit(x);exit(y);
end;

Procedure init;
var
  i,j:int;
  ch:char;
begin
  readln(x,y,mx,my);
  fillchar(v,sizeof(v),false);
  for i:=y downto 1 do begin
    for j:=1 to x do begin
      read(ch);
      if ch='*' then v[j,i]:=true;
    end;
    readln;
  end;
  v[mx,my]:=true;
end;

Procedure main;
var
  h,t,xt,yt,i,j:int;
begin
  h:=0;t:=1;ans:=0;
  with q[0] do begin
    x:=mx;y:=my;step:=0;
  end;
  while h<t do begin
    for i:=1 to 8 do begin
      xt:=q[h].x+dx[i];yt:=q[h].y+dy[i];
      if (xt in [1..x])and(yt in [1..y])and(not(v[xt,yt])) then begin
        q[t].x:=xt;q[t].y:=yt;q[t].step:=q[h].step+1;
        v[xt,yt]:=true;
        if q[t].step>ans then ans:=q[t].step;
        inc(t);
      end;
    end;
    inc(h);
  end;
end;

Begin
  init;
  main;
  writeln(ans);
End.
