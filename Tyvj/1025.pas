var
	n,i:integer;
	a:ansistring;

function zh(a:char):integer;
begin
	zh:=ord(a)-48;
end;


procedure work(a:ansistring);
begin
	if (zh(a[length(a)]) mod 2)=0
		then writeln('even')
		else writeln('odd');
end;

begin
	{assign(input,'xx.txt');
	reset(input);}
	readln(n);
	for i:=1 to n do
		begin
			readln(a);
			work(a);
		end;
	{close(input);}
end.