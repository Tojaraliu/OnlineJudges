var
	n,i:longint;
	a,b,c:qword;
begin
	readln(n);
	a:=1;
	b:=2;
	case n of
		0:writeln(1);
		1:writeln(2);
		else begin	
			for i:=2 to n do begin
				c:=a+b;a:=b;b:=c;
                        end;
			writeln(c);
		end;
	end;
end.