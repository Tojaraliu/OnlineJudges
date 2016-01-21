var
	n:longint;
	i,j:longint;
	f:array[0..26,0..26] of longint;
	tmp,ans:longint;
	
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
	
begin
	fillchar(f,sizeof(f),0);
	readln(n);readln(f[1,1]);
	for i:=2 to n do begin
		for j:=1 to i do begin
			read(tmp);
			f[i,j]:=max(f[i-1,j-1],f[i-1,j])+tmp;
		end;
		readln;
	end;
	ans:=0;
	for i:=1 to n do
		if f[n,i]>ans then ans:=f[n,i];
	writeln(ans);
end.