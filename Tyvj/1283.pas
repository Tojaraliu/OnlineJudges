const
	move:array[0..9,1..2] of shortint=((2,2),(0,1),(1,0),(0,-1),(-1,0),(-1,2),(2,-1),(-2,1),(1,-2),(-2,-2));
var
	n,a,b,k,tmp,x,y:int64;
	i,j:longint;
	
function work(a,n:int64):int64;
begin
	work:=1;
	while n>0 do
	  begin
	    if odd(n) then work:=work*a mod b;
		a:=a*a mod b;
		n:=n>>1;
	  end;
end;
	
begin
	readln(n);x:=0;y:=0;
	for i:=1 to n do begin
		read(a,b,k);
		tmp:=a*work(10,k-1) mod b;
		tmp:=trunc(frac(tmp/b)*10);
		write(tmp);
		x:=x+move[tmp,1];
		y:=y+move[tmp,2];
	end;
	writeln;
	writeln('(',x,',',y,')');
end.