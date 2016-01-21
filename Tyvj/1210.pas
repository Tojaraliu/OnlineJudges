var
	t1,t2,t3,n:qword;
begin	
	readln(n);t1:=1;t2:=1;t3:=2;
	while t3<n do begin
		t1:=t2;
		t2:=t3;
		t3:=t1+t2;
	end;
	writeln(t1,'/',t2);
end.