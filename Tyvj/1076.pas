var
	n:longint;
	i,j,k:longint;
	f:array[0..260,0..260,0..99] of boolean;
	a:array[0..260,0..260] of longint;
	tmp,ans:longint;
	
function max(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
end;
	
begin
	fillchar(f,sizeof(f),0);
	readln(n);
	for i:=1 to n do
		for j:=1 to i do
			read(a[i,j]);
	f[1,1,a[1,1]]:=true;

	for i:=1 to n do
		for j:=1 to i do
			for k:=1 to 99 do
			if f[i,j,k] then begin
				f[i+1,j,(k+a[i+1,j])mod 100]:=true;
				f[i+1,j+1,(k+a[i+1,j+1])mod 100]:=true;
			end;
	ans:=0;
	for i:=99 downto 1 do
		for j:=1 to n do
			if f[n,j,i] then begin writeln(i);halt;end;
end.