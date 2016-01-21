var
	s,st:string;
	
function gcd(x,y:qword):qword;
begin
	if x=0 then exit(y);
	if y=0 then exit(x);
	exit(gcd(y,x mod y));
end;
	
procedure work1(s:string);
var
	h,t,p,fm,k:qword;
    i:longint;
	s1,s2:string;
begin
	p:=pos('.',s);fm:=1;
	s1:=copy(s,1,p-1);s2:=copy(s,p+1,length(s));
	val(s1,h);val(s2,t);
	for i:=1 to length(s2) do fm:=fm*10;
	h:=h*fm+t;
	k:=gcd(h,fm);h:=h div k;fm:=fm div k;
	if fm=1 then writeln(h)
			else writeln(h,'/',fm);
	halt;
end;

procedure work2(s:string);
var
	x,y,a,b,k,fm,fz:qword;
        i:longint;
	ss:string;
begin
	x:=pos('(',s);y:=pos(')',s);
	ss:=copy(s,x+1,y-x-1);
	val(ss,b);
	x:=pos('.',s);
	val(copy(s,1,x-1),a);
	x:=1;
	for i:=1 to length(ss) do
                x:=x*10;
	y:=x*x;
	fz:=(a*y+b*x)-a*x;
	fm:=y-x;
	k:=gcd(fz,fm);fz:=fz div k;fm:=fm div k;
	if fm=1 then writeln(fz)
			else writeln(fz,'/',fm);
    halt;
end;

procedure work3(s:string);
var	
	a,b,c,x,y,z,k,t,fz,fm:qword;
	i:longint;
	s1,s2:string;
begin
	x:=pos('.',s);y:=pos('(',s);s2:=copy(s,y+1,length(s)-y-1);s1:=copy(s,x+1,y-x-1);
	val(copy(s,1,x-1),a);val(s2,c);val(s1,b);x:=1;y:=1;z:=1;
	for i:=1 to length(s1) do x:=x*10;
	for i:=1 to length(s2) do y:=y*10;
	y:=y*x;
	fz:=(a*y+b*(y div x)+c)-(a*x+b);fm:=y-x;
	k:=gcd(fz,fm);fz:=fz div k;fm:=fm div k;
	if fm=1 then writeln(fz)
			else writeln(fz,'/',fm);
	halt;
end;
	
begin
	readln(s);
	if s[1]='-' then begin
		write('-');delete(s,1,1);
	end;
	while (s[1]='0')and(length(s)>1)and(pos('.',s)<>2) do delete(s,1,1);
	while (s[length(s)]='0')and(length(s)>1) do delete(s,length(s),1);
	if pos('(',s)=0 then work1(s);
	if pos('.(',s)<>0 then work2(s);
	work3(s);
end.
