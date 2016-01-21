var
	a,f:array[0..101,0..101] of longint;
	i,j,n,m,l:longint;
begin
	read(n,m);
	for i:=0 to 101 do for j:=0 to 101 do begin f[i,j]:=0;a[i,j]:=0;end;
	for i:=1 to n do
		for j:=1 to m do begin
			read(a[i,j]);
			if a[i,j]>0 then f[i,j]:=a[i,j];
		end;
	for i:=1 to n do
		for j:=1 to m do
			for l:=1 to j do
				if f[i-1,l]+a[i,j-l]>f[i,j] then f[i,j]:=f[i-1,l]+a[i,j-l];
	writeln(f[n,m]);
end.