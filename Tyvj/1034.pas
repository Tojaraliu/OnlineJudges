Type
  int=longint;
  point=^link;
  link=record
    id:int;
    next:point;
  end;
  
Var
  f:Array[0..10001] of int;
  e:Array[0..10001] of point;
  n,k:int;
  
Procedure add(x,y:int);
var
  p:point;
begin
  new(p);
  p^.id:=x+y;p^.next:=e[x];e[x]:=p;
end;

Function max(x,y:int):int;
begin
  if x>y then exit(x);exit(y);
end;

Procedure init;
var
  i,x,y:int;
begin
  readln(n,k);
  for i:=1 to k do begin
    read(x,y);add(x,y);
  end;
end;

Procedure main;
var
  i:int;
  p:point;
begin
  for i:=n downto 1 do begin
    p:=e[i];
    if p=nil then begin f[i]:=f[i+1]+1;continue;end;
    while p<>nil do begin
      f[i]:=max(f[i],f[p^.id]);
      p:=p^.next;
    end;
  end;
end;

Begin
  init;
  main;
  writeln(f[1]);
end.