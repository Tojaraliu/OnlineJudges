Type
  int=longint;

Var
  n,x,y,i:int;

Begin
  readln(n);
  for i:=1 to n do begin
    readln(x,y);
    if x>=y then writeln('NO BRAINS') else writeln('MMM BRAINS');
  end;
end.