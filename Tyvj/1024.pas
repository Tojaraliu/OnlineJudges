var 
	a:array['a'..'z'] of longint;
    b:array[0..1000]of char;
    f:array[0..1000]of longint;
    i,j,n,max:longint;
    ch:char;
	
begin
	for i:=1 to 26 do begin read(ch);a[ch]:=i;end;
	readln;
	n:=0;
	while not eoln do begin
		read(ch);
		if ch=' ' then begin
			for i:=n-1 downto 1 do
			  for j:=i+1 to n do
				if(a[b[j]]>=a[b[i]])and(f[i]<f[j]+1)then
				  f[i]:=f[j]+1;
			max:=0;
			for i:=1 to n do
			  if f[i]>max then max:=f[i];
			write(max);
			n:=0;
		end
		else begin
			inc(n);
			b[n]:=ch;
			f[n]:=1;
		end;
	end;
	for i:=n-1 downto 1 do
		for j:=i+1 to n do
		  if(a[b[j]]>=a[b[i]])and(f[i]<f[j]+1)then
			f[i]:=f[j]+1;
	max:=0;
	for i:=1 to n do
		if f[i]>max then max:=f[i];
	writeln(max);
end.