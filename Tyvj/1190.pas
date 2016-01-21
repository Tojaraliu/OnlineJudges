var
	i,j,n,t:longint;
	f:array[0..101,0..10000] of boolean;
	
function check(p:longint):boolean;
var
	i:longint;
begin
	for i:=1 to n do
		if not(f[i,p]) then exit(false);
	exit(true);
end;
	
begin
	readln(n);
	for i:=1 to n do begin
		f[i,0]:=true;
		while 0=0 do begin
			read(t);if t=-1 then break;
			for j:=10000 downto t do 
				 if f[i,j-t] then f[i,j]:=true;
		end;
	end;
	for i:=10000 downto 0 do
		if check(i) then begin
			writeln(i);halt;
	end;
end.