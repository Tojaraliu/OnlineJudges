const
	mx:array[1..4] of longint=(1,0,-1,0);
	my:array[1..4] of longint=(0,1,0,-1);
var
	n,xx,yy,m:longint;
	a:array[0..300,0..300] of longint;
    v:array[0..300,0..300] of boolean;

procedure init;
var
	ch:char;
	i,j:longint;
begin
	fillchar(v,sizeof(v),true);
	fillchar(a,sizeof(a),-$7f);
	readln(n,xx,yy,m);
	for i:=1 to xx do begin
		for j:=1 to yy do begin
			read(ch);
			case ch of
				'#':a[i,j]:=1;
				'0':a[i,j]:=2;
				'.':a[i,j]:=0;
			end;
		end;
		readln;
	end;
end;

procedure dfs(x,y,g:longint);
var
	i,j,tx,ty:longint;
begin
	if g=n then begin writeln('yes');halt;end;
	for j:=1 to 2 do begin
		for i:=1 to 4 do begin
			tx:=x+mx[i];ty:=y+my[i];
			if (tx>xx)or(ty>yy)or(tx=0)or(ty=0) then continue;
			if not(v[tx,ty]) then continue;
			case a[tx,ty] of
				1:
					begin
						v[x,y]:=false;
						dfs(tx,ty,g+1);
						v[x,y]:=true;
					end;
				2:
					begin
						if (j=1)or(m=0) then continue;
						dec(m);v[x,y]:=false;
						dfs(tx,ty,g);
						inc(m);v[x,y]:=true;
					end;
			end;
		end;
	end;
end;
			
begin
	init;
	dfs(1,yy,0);
	writeln('no');
end.
