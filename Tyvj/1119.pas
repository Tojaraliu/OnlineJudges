var n,i,a,b:longint;
function p(a,b:longint):integer;
begin
  if b=1 then p:=a mod 1012
  else if odd(b)then p:=sqr(p(a,b div 2))*a mod 1012
  else p:=sqr(p(a,b div 2)) mod 1012;
end;
begin
  readln(n);
  for i:=1 to n do begin
    readln(a,b);
    writeln(p(a,b));
  end;
end.