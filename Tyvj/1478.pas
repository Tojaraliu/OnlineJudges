var
  n,i,t,j:longint;
  ans:int64;
  a,c,s,f,g,sum:array[0..100001] of int64;
  
begin
  readln(n);sum[0]:=0;
  for i:=1 to n do read(c[i],a[i]);
  for i:=1 to n do sum[i]:=sum[i-1]+c[i];
  f[n]:=a[n]; g[n]:=n;
  for i:=n-1 downto 1 do
  if (f[i+1]>=a[i])
    then begin
    f[i]:=f[i+1]; g[i]:=g[i+1];
    end
    else begin
    f[i]:=a[i]; g[i]:=i;
  end;
  ans:=0;
  i:=0; j:=0;
  while i<n do begin
    j:=G[i+1];
    inc(ans,(sum[j]-sum[i])*a[j]);
    i:=j;
  end;
  writeln(ans);
end.