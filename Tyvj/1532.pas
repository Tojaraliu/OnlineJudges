var
	f:array[1..10000000] of qword;
	a:array[1..10] of qword;
	i,j,k,l,t:longint;
	n,m:longint;

function gcd(a,b:longint):longint;
begin
	if a=0 then exit(b);
	if b=0 then exit(a);
	exit(gcd(b,a mod b));
end;
	
begin
	fillchar(f,sizeof(f),0);f[1]:=1;f[2]:=1;f[3]:=2;k:=3;
	for l:=1 to 10 do begin
		readln(n,m);
		t:=gcd(n,m);
		if f[t]<>0 then begin a[l]:=f[t];continue;end;
		for i:=k to t do f[i]:=f[i-1]+f[i-2];
		a[l]:=f[t];
		k:=t;
	end;
	for i:=1 to 10 do writeln(a[i]);
end.