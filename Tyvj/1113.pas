var
	a:array[0..2001] of string;
	f:array[0..2001] of longint;
	i,j,n,t:longint;
begin
	readln(n);
	for i:=1 to n do begin
		readln(a[i]);t:=0;
		for j:=1 to i do
			if (pos(a[j],a[i])=1)and(f[j]>t) then t:=f[j];
		f[i]:=t+1;
	end;
	t:=0;
	for i:=1 to n do
		if f[i]>t then t:=f[i];
	writeln(t);
end.
		