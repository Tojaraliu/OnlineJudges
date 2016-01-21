Const dlt=maxlongint>>2;
var
	n:longint;
	i,j:longint;
	f:array[0..260,0..260] of longint;
	tmp,ans:longint;
	
function max(a,b:longint):longint;
begin if a>b then exit(a); 	exit(b); end;
	
begin
	readln(n);
	for i:=1 to n do 
		for j:=1 to i do begin
			read(tmp);
			if (i=(n div 2))and(j=(n div 2)) then inc(tmp,dlt); 
			f[i,j]:=max(f[i-1,j-1],f[i-1,j])+tmp;
		end;
	for i:=1 to n do
		if f[n,i]>ans then ans:=f[n,i];
    writeln(ans-dlt);
end.