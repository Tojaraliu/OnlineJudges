var
	a,b:longint;

function gcd(a,b:longint):longint;
begin
	if (a=0) then exit(b);
	if b=0 then exit(a);
	exit(gcd(b,a mod b));
end;

begin
	readln(a,b);
	if (a mod b)=0 then begin writeln(a);halt;end;
	writeln(a+b-gcd(a,b));
end.