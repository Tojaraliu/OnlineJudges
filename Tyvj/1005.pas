var
  f:array[0..1001] of longint;
  i,j,t,m,n,nt,nm:longint;
begin
  readln(t,m);f[0]:=0;
  for i:=1 to m do begin
    readln(nt,nm);
    for j:=t downto nt do begin
      if f[j-nt]+nm>f[j] then f[j]:=f[j-nt]+nm;
    end;
  end;
  writeln(f[t]);
end.