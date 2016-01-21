var x,i,j:longint;
  n,b,ans,sum:int64;
  a:array[1..10000]of longint;
begin
  readln(n,b);
  for i:=1 to n do begin
    readln(x);inc(a[x]);
  end;
  for i:=10000 downto 1 do
    if a[i]>0 then
      for j:=1 to a[i] do begin
        inc(ans);inc(sum,i);
        if sum>=b then begin
          writeln(ans);
          halt;
        end;
      end;
end.