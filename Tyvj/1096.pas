var
	n,m,i,j,t:longint;
	f:array[0..100000] of longint;
begin
	read(n,m);
	f[0]:=1;
	
	for i:=1 to n do begin
		read(t);
		for j:=m downto 0 do 
			if f[j]>0 then inc(f[j+t],f[j]);
	end;
	writeln(f[m]);
end.
