const
	a:array[0..10] of longint=(1,1,2,6,24,120,720,5040,40320,362880,3628800);
var
	s:ansistring;
	t,x,j,i:longint;
	b:array[1..11] of longint;
	
procedure op(k:longint);
var
	i:longint;
begin
	if k=0 then begin writeln('No!'); halt; end;
	write(s,'=',b[j],'!');
	for i:=j-1 downto 1 do write('+',b[i],'!');
        writeln;
	halt;
end;
	
begin
	readln(s);j:=0;
	if (length(s)>7)or(s='0') then op(0) else val(s,t);

	x:=t;
	for i:=10 downto 0 do begin
		if t=a[i]
			then begin
				inc(j);b[j]:=i;op(1);
			end;
		if t>a[i]*2 then op(0);
		if t>a[i] then begin
			inc(j);
			b[j]:=i;
			dec(t,a[i]);
		end;
	end;
end.