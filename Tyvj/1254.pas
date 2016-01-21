var
	a,z:array[0..100000] of longint;
	ans,n:longint;
	
procedure init;
var
	i:longint;
begin
	read(n);ans:=0;z[0]:=-1<<29;
	for i:=1 to n do read(a[i]);
end;

procedure main;
var
	i,p:longint;
begin
	for i:=1 to n do begin
		p:=ans+1;
		while z[p-1]>a[i] do dec(p);
		z[p]:=a[i];
		if p>ans then ans:=p;
	end;
end;
	
begin
	init;
	main;
	writeln(ans);
end.
