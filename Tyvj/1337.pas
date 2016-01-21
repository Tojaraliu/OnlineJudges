var n,i,s1,s2,s3:longint;
begin
  readln(n);
  n:=n mod 49152;
  s1:=1;s2:=1;i:=2;
  while i<=n do begin
    inc(i);
    s3:=(s1+s2)mod 32768;
    s1:=s2;s2:=s3;
  end;
  writeln(s1);
end.