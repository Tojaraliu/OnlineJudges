const
	mx:array[1..4] of shortint=(0,-1,0,1);
	my:array[1..4] of shortint=(1,0,-1,0);
var
	a:array[0..51,0..81] of boolean;
	i,j,n,m,ans:longint;
	ch:char;

procedure print;
var
	i,j:longint;
begin
	for i:=1 to n do begin
		for j:=1 to m do
			if a[i,j] then write(1) else write(0);
		writeln;
	end;
end;

procedure bfs(x,y:longint);
var
	i,p,q:longint;
begin
	a[x,y]:=false;
	for i:=1 to 4 do begin
		p:=x+mx[i];
		q:=y+my[i];
		if (a[p,q])and(p>0)and(p<=n)and(q>0)and(q<=m) then bfs(p,q);
	end;
end;

begin
	readln(n,m);
	fillchar(a,sizeof(a),false);
	for i:=1 to n do begin
		for j:=1 to m do begin
			read(ch);
			if ch<>'0' then a[i,j]:=true;
		end;
		readln;
	end;
	ans:=0;

	for i:=1 to n do
		for j:=1 to m do
			if a[i,j] then begin
				inc(ans);
				bfs(i,j);
			end;
	writeln(ans);
end.