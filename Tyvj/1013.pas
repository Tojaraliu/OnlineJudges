var
	a,b,c:array[0..200] of longint;
	r,m,n:longint;
	f:array[0..200,0..200,1..2] of longint;
	
procedure init;
var
	i:longint;
begin
	readln(n);
	for i:=1 to n do readln(a[i],b[i],c[i]);
	readln(m,r);
end;

function moregirls(i,j,k:longint):boolean;
begin
	exit(f[j,k,1]<f[j-a[i],k-b[i],1]+1)
end;

function lesstime(i,j,k:longint):boolean;
begin
	exit((f[j,k,1]=f[j-a[i],k-b[i],1]+1)and(f[j,k,2]>f[j-a[i],k-b[i],2]+c[i]));
end;

procedure dp;
var
	i,j,k:longint;
begin
	fillchar(f,sizeof(f),0);
	for i:=1 to n do
		for j:=m downto 0 do
			for k:=r downto 0 do
				if ((j>=a[i])and(k>=b[i])) then
					if (moregirls(i,j,k))or(lesstime(i,j,k)) then begin
						f[j,k,1]:=f[j-a[i],k-b[i],1]+1;
						f[j,k,2]:=f[j-a[i],k-b[i],2]+c[i];
					end;
end;

begin
	init;
	dp;
	writeln(f[m,r,2]);
end.
