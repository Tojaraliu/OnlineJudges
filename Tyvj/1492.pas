var
	line,point,ans:string;
	i,a,b,c1,x,y,c2,gy:longint;

function gcd(x,y:longint):longint;
begin
    if x=0 then exit(y);
	if y=0 then exit(x);
	exit(gcd(y,x mod y));
end;

function cstr(i:longint):string;
begin
	str(i,cstr);
end;

begin
	readln(line);
	readln(point);
	ans:=''; i:=1;
	if line[1]='x' then insert('1',line,1);
	while i<length(line) do begin
		if (line[i]in['x','y'])and((line[i-1]in['+','-'])or(i=1)) then insert('1',line,i);
		inc(i);
	end;
	i:=pos('x',line);
	if i=0 then a:=0 else begin
		val(copy(line,1,i-1),a);
		delete(line,1,i);
	end;
	i:=pos('y',line);
	if i=0 then b:=0 else begin
		val(copy(line,1,i-1),b);
		delete(line,1,i);
	end;
	i:=pos('=',line);
	val(copy(line,1,i-1),c1);
	point:=copy(point,2,length(point)-2);
	i:=pos(',',point);
	val(copy(point,1,i-1),x); delete(point,1,i);
	val(point,y);
	c2:=-2*(a*x+b*y)-c1;
	gy:=gcd(gcd(abs(a),abs(b)),abs(c2));
	a:=a div gy; b:=b div gy; c2:=c2 div gy;
	if a=1
		then ans:=ans+'x'
		else if a=-1
			then ans:=ans+'-x'
			else if a<>0 then ans:=ans+cstr(a)+'x';
	if b>0
		then begin
			if b=1
				then ans:=ans+'+y'
				else ans:=ans+'+'+cstr(b)+'y';
		end
		else if b<0
			then begin
				if b=-1 then ans:=ans+'-y' else ans:=ans+cstr(b)+'y';
			end;
	if c2>0 then ans:=ans+'+';
	if c2<>0 then ans:=ans+cstr(c2);
	if ans[1]='+' then delete(ans,1,1);
	writeln(ans,'=0');
end.
