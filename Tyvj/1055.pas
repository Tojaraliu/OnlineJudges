var
	i,j,k,n,min:longint;
	f,sum:array[0..500,0..500] of longint;
	a:array[0..500] of longint;

procedure init;
var
	i,j,k,t:longint;
begin
	read(n);
	for i:=1 to n do read(a[i]);
	for i:=1 to n do sum[i,i]:=a[i];
	for i:=1 to n do for j:=i+1 to n do
		sum[i,j]:=sum[i,j-1]+a[j];
end;
	
procedure main;
var
	i,j,k,p:longint;
begin
	fillchar(f,sizeof(f),0);
	for p:=1 to n do
		for i:=1 to n-p do begin
			j:=i+p;
			min:=1<<29;
			for k:=i to j-1 do
				if min>f[i,k]+f[k+1,j]
					then min:=f[i,k]+f[k+1,j];
			f[i,j]:=min+sum[i,j];
	end;
end;

begin
	init;
	main;
	writeln(f[1,n]);
end.