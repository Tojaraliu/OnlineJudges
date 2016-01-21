var
	n,len,k:longint;
	s:qword;
	i:longint;
        t:string;
begin
        s:=1;readln(n,k);
	for i:=1 to n do
		begin
			s:=s*i;
			while s mod 10 =0 do s:=s div 10;
		if s>1000000000000 then s:=s mod 1000000000000;
        end;
	str(s,t);
    len:=length(t);
	if k>len
		then writeln(t)
		else writeln(copy(t,len-k+1,len));
end.