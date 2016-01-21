program p1394;

var
	a:string;
	l,r,i,j:1..10000;
	total:longint;

begin
	read(l,r);
	for i:=l to r do
		begin
			str(i,a);
			for j:=1 to length(a) do
				if a[j]='2'
					then inc(total);
		end;
	writeln(total);
end.