Const dlt=maxlongint>>2;
var
	n,x,y:longint;
	f,a:array[0..260,0..260] of longint;
	tmp,ans:longint;

function max(a,b:longint):longint;
begin if a>b then exit(a); 	exit(b); end;

procedure init;
var
	i,j:longint;
begin
	readln(n);
	for i:=1 to n do
		for j:=1 to i do
			read(a[i,j]);
	read(x,y);
end;

procedure cal;
var
	i,j:longint;
begin
	for i:=1 to n do
		for j:=1 to i do begin
			if (i=x)and(j=y) then inc(a[i,j],dlt);
			f[i,j]:=max(f[i-1,j],f[i-1,j-1])+a[i,j];
		end;
	ans:=0;
	for i:=1 to n do
		if f[n,i]>ans then ans:=f[n,i];
end;

begin
	fillchar(a,sizeof(a),0);
	fillchar(f,sizeof(f),0);
	init;
	cal;
	writeln(ans-dlt);
end.