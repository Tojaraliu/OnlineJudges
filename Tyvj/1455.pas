var
	a:array[0..101,0..101] of extended;
	b:array[0..101] of extended;
	i,n,j:longint;

procedure swap(var a,b:extended);
var	
	t:extended;
begin
	t:=a;a:=b;b:=t;
end;

procedure cal;
var
	c:extended;
	i,j,k,t:longint;
begin
	for i:=1 to n do begin
		t:=i;
		for j:=i+1 to n do
			if abs(a[j,i])>abs(a[t,i]) then t:=j;
		for j:=1 to n do
			swap(a[i,j],a[t,j]);
		swap(b[i],b[t]);
		for j:=i+1 to n do a[i,j]:=a[i,j]/a[i,i];
		b[i]:=b[i]/a[i,i];
		for j:=i+1 to n do begin
			for k:=i+1 to n do
				a[j,k]:=a[j,k]-a[j,i]*a[i,k];
			b[j]:=b[j]-a[j,i]*b[i];
		end;
	end;
	
	for i:=n-1 downto 1 do begin
		c:=0;
		for j:=i+1 to n do c:=c+b[j]*a[i,j];
		b[i]:=b[i]-c;
	end;
	for i:=1 to n-1 do write(round(b[i]),' ');
	writeln(round(b[n]));
end;

begin
	read(n);
	for i:=1 to n do begin
		for j:=1 to n do read(a[i,j]);
		read(b[i]);
	end;
	cal;
end.