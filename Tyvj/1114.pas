var
	f:array[0..2000,0..2000]of boolean;
	a,h:array[0..200]of longint;
	i,j,k,n,m:longint;
begin
	f[0,0]:=true;
	readln(n);
	for i:=1 to n do begin
		read(a[i]);
		h[i]:=h[i-1]+a[i];
		for j:=h[i-1] downto 0 do
			for k:=h[i-1] downto 0 do
				if f[j,k] then begin
					f[j+a[i],k]:=true;
					f[j,k+a[i]]:=true;
			end;
	end;
	for i:=1500 downto 1 do
		if f[i,i] then begin
			writeln(i);halt;
		end;
	writeln('Impossible');
end.
