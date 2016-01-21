var i,j,t,n:longint;
  num:set of 1..9;
function yes(x:longint):boolean; {判断x中每一位是否在那N个数中}
begin
  repeat
    if not((x mod 10)in num)then exit(false);
    x:=x div 10;
  until x=0;
  exit(true);
end;
begin
  readln(n);num:=[];
  for i:=1 to n do begin read(t);num:=num+[t];end;
  t:=0;
  for i:=111 to 999 do if yes(i) then
    for j:=11 to 99 do if yes(j) then begin {写到下面的条件时我晕了}
      if(yes(i*j))and(i*j<10000)and(yes(i*(j div 10)))and(i*(j div 10)<1000)and(yes(i*(j mod 10)))and(i*(j mod 10)<1000)then inc(t);
    end;
  writeln(t);
end.