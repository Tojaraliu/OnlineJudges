var
	n,k:longint;
	num,f:array[0..200,0..200] of longint;
	s:array[0..200] of longint;
	
procedure init;
var
	i,j,t,l:longint;ch:char;
begin
	readln(n,k);
	for i:=1 to n do begin
		read(ch);
		s[i]:=ord(ch)-48;
		num[i,i]:=s[i];
	end;
	
	for l:=2 to n do
		for i:=1 to n-l+1 do begin
			j:=i+l-1;
			num[i,j]:=num[i,j-1]*10+s[j];
	end;
	for i:=1 to n do f[i,0]:=num[1,i];
end;

procedure main;
var
	i,j,p:longint;
begin
	for i:=1 to n do f[i,0]:=num[1,i];
	for i:=1 to n do
		for j:=1 to k do
			for p:=1 to i-1 do begin
				if f[i,j]<(f[p,j-1]*num[p+1,i]) then
					f[i,j]:=(f[p,j-1]*num[p+1,i]);
			end;
end;

	
begin
	init;
	main;
	writeln(f[n,k]);
end.
