var 
  i,j,k,m,n:longint;
  a:array[1..100] of longint;
  f:array[1..100,1..101] of longint;
begin
  readln(n);
  for i:=1 to n do read(a[i]);
  for i:=1 to n-1 do f[i,i+1]:=0;
  for i:=n-2 downto 1 do
    for j:=i+2 to n do begin
      f[i,j]:=maxlongint;
      for k:=i+1 to j-1 do
        if f[i,k]+f[k,j]+a[i]*a[k]*a[j]<f[i,j] then f[i,j]:=f[i,k]+f[k,j]+a[i]*a[k]*a[j];
  end;
  writeln(f[1,n]);
end.