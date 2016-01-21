type
	arr=array[0..40001] of integer;
var
	a,b:arr;
	i,j,m,n:longint;
	s:string;
	
function mul(a,b:arr):arr;
var i,j:longint;c:arr;
begin
        fillchar(c,sizeof(c),0);
        for i:=1 to a[0] do
			for j:=1 to b[0] do begin
				inc(c[i+j-1],a[i]*b[j]);
				inc(c[i+j],c[i+j-1] div 10);
				c[i+j-1]:=c[i+j-1] mod 10;
			end;
        c[0]:=a[0]+b[0]-1;
        if c[c[0]+1]>0 then inc(c[0]);
		mul:=c;
end;

procedure divide;
var
	i,k:longint;
begin
	for i:=200 downto 1 do begin
		a[i]:=a[i]+k*10;
		k:=a[i] mod 4;
		a[i]:=a[i]div 4;
	end;
end;

begin
	readln(s);
    fillchar(a,sizeof(a),0);
    fillchar(b,sizeof(b),0);
	a[0]:=length(s);
	for i:=1 to length(s) do a[i]:=ord(s[a[0]-i+1])-48;
	b:=mul(a,a);
	a:=b;
        divide;
        while a[a[0]]=0 do dec(a[0]);
	for i:=a[0] downto 1 do
		write(a[i]);
end.