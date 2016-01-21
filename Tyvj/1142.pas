var n,f,c:int64;
begin
  readln(n);
  f:=5;c:=0;
  while f<=n do begin
    c:=c+n div f;
    f:=f*5;
  end;
  writeln(c);
end.