var
	map:array[1..5,1..5] of char;
	i,j,k,ans:longint;
	
procedure swap1(p,q:longint);
var
	i:longint;t:char;
begin
	for i:=1 to 4 do begin
		t:=map[i,p];
		map[i,p]:=map[i,q];
		map[i,q]:=t;
	end;
end;

procedure swap2(p,q:longint);
var
	i:longint;t:char;
begin
	for i:=1 to 4 do begin
		t:=map[p,i];
		map[p,i]:=map[q,i];
		map[q,i]:=t;
	end;
end;
	
begin
	for i:=1 to 4 do begin
		for j:=1 to 4 do read(map[i,j]);
		readln;
	end;
	
	for k:=1 to 4 do
		for i:=1 to 3 do
			if map[1,i]>map[1,i+1] then begin
			swap1(i,i+1);inc(ans);
			end;
	
	for k:=1 to 4 do
		for i:=1 to 3 do
			if map[i,1]>map[i+1,1] then begin
			swap2(i,i+1);inc(ans);
			end;
			
	writeln(ans);
end.