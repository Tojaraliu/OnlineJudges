var n,k,i,s:longint;
	a,b:array[0..10] of longint;
procedure search(o,e:longint);
var i:longint;
begin
	if (o=n) and (abs(e-a[1])<=k) then inc(s)
	else begin
		for i:=1 to n do
			if (b[i]=0) and (abs(e-a[i])<=k) then
				begin
					b[i]:=1;
					search(o+1,a[i]);
					b[i]:=0;
				end;
	end;
end;
begin
	readln(n,k);
	for i:=1 to n do read(a[i]);
	b[1]:=1;
	s:=0;
	search(1,a[1]);
	writeln(s);
end.