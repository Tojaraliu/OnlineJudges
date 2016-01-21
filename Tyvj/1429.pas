var 
	n,i:integer;
begin
	readln(n);
	if n and 1=0 
		then begin
			for i:=1 to n>>1 do write(i,' ',n-i+1,' ');
		end 
		else begin
			write(1,' '); i:=2;
			while i<n do begin
				write(n,' ',i,' ');
				inc(i); dec(n);
			end;
	end;
	writeln;
end.