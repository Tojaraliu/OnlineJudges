var
  n,sum,i:longint;
begin
  read(n);sum:=0;
  if n>1 then for i:=1 to n do inc(sum,i)
    else for i:=1 downto n do inc(sum,i);
  writeln(sum);
end.