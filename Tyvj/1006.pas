program isbn;

var
	s:string;
	b:array[1..10] of integer;
	i:1..13;
	n:integer;
	
function work(k:char):shortint;
begin
        work:=ord(k)-48;
end;

begin
        read(s);
	n:=0;
	b[1]:=work(s[1]);

	b[2]:=work(s[3])*2;
	b[3]:=work(s[4])*3;
	b[4]:=work(s[5])*4;

	b[5]:=work(s[7])*5;
	b[6]:=work(s[8])*6;
	b[7]:=work(s[9])*7;
	b[8]:=work(s[10])*8;
	b[9]:=work(s[11])*9;

	for i:=1 to 9 do
		n:=n+b[i];
	n:=n mod 11;


	if s[13]='X'
		then b[10]:=10
		else b[10]:=work(s[13]);

	if n=b[10]
		then write('Right')
		else
			begin
				for i:=1 to 12 do
					write(s[i]);
				if n=10
					then write('X')
					else write(n);
			end;

end.