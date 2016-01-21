var
  n,i,j,total:longint;
  a:array[0..1000] of longint;
begin
  readln(n);
  if n=0 then begin writeln(0);halt;end;
  while n<>0 do begin
    inc(total);
    a[total]:=abs(n mod -2);
    if n<0 then dec(n);
    n:=n div -2;
  end;
  for i:=total downto 1 do write(a[i]);
  writeln;
end.