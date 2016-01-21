var
	s:ansistring;
	m:longint;
	t,i:longint;
begin
	readln(m);t:=0;
	readln(s);i:=1;
	while i<=length(s) do begin
		if s[i] in ['0'..'9']
			then begin
				t:=0;
				while s[i]in ['0'..'9'] do begin
					t:=t*10+(ord(s[i])-48);
					inc(i);
				end;
				inc(t,m);
				write(t);
			end
			else begin
				if (s[i]='e')and(s[i+1]='n')and(s[i+2]='d')and(i+2=length(s))
					then halt;
				write(s[i]);
				inc(i);
			end;
	end;
end.