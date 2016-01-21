var
	f:array[0..1000000] of longint;
	n,i,j,k:longint;
	
begin
	read(n);
	f[1]:=1;f[2]:=2;k:=1000000000;
	for i:=3 to n do begin
		if ((i and 1)=0)
			then f[i]:=(f[i-1]+f[i>>1]) mod k
			else f[i]:=f[i-1];
	end;
	writeln(f[n]);
end.
