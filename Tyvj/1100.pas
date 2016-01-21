var
	f:array[1..20000001] of boolean;
	n,b,k:longint;
	i:longint;

procedure push(x:longint);
var
	i:longint;
begin
	for i:=b downto 0 do
		if f[i] then f[i+x]:=true;
end;

begin
	readln(n,b);f[0]:=true;
        fillchar(f,sizeof(f),false);
	for i:=1 to n do begin
		read(k);
		push(k);
	end;
	for i:=b to 20000001 do
		if f[i] then begin
			writeln(i-b);halt;
		end;
end.