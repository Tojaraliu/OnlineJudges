var a,b,i:longint;
s:int64;
begin
readln(a,b);
s:=1;
for i:=1 to b do
s:=(s*a) mod 1012;
writeln(s);
end.