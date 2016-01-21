var
	a,b:array[0..1000000] of longint;
	c,len,key,n:longint;

procedure init;
var
	i:longint;s:ansistring;
begin
	readln(s);read(c);
	len:=length(s);
	for i:=1 to len do
		a[i]:=ord(s[i])-48;
	key:=a[1] xor c;
end;

procedure main;
var
	i:longint;
begin
	for i:=1 to len do b[i]:=(a[i] xor key) mod 10;
end;

procedure print;
var
	i,ans:longint;
begin
	for i:=1 to len-1 do write(b[i]);
	writeln(b[len]);
end;

begin
	init;
	main;
	print;
end.
