var
  n:string;k:shortint;
begin
  readln;readln(n);
  k:=ord(n[length(n)]);
  if k mod 2=0 then writeln('No') else writeln('Yes');
end.