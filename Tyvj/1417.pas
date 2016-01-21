var
	a:array[0..1001,0..1001] of longint;
	i,j,n,m,ans:longint;

procedure draw;
var
	i,j:longint;
begin
	for i:=1 to m do
		for j:=1 to n do begin
			if a[i,j]=-1 then continue;
			if a[i-1,j]=-1 then inc(a[i,j]);
			if a[i+1,j]=-1 then inc(a[i,j]);
			if a[i,j-1]=-1 then inc(a[i,j]);
			if a[i,j+1]=-1 then inc(a[i,j]);
			if a[i-1,j-1]=-1 then inc(a[i,j]);
			if a[i+1,j-1]=-1 then inc(a[i,j]);
			if a[i-1,j+1]=-1 then inc(a[i,j]);
			if a[i+1,j+1]=-1 then inc(a[i,j]);
    end;
end;

procedure init;
var i,j:longint;ch:char;
begin
	fillchar(a,sizeof(a),0);
	readln(m,n);
	for i:=1 to m do begin
		for j:=1 to n do begin
			read(ch);
			if ch='*' then a[i,j]:=-1;
		end;
		readln;
	end;
end;

procedure floodfill(x,y,z:longint);
  begin
    if (x<1)or(x>m)or(y<1)or(y>n) then exit;
    if (a[x,y]=-1)or(a[x,y]>10) then exit;
    if a[x,y]>0 then begin a[x,y]:=z; exit; end;
    a[x,y]:=z;
    floodfill(x-1,y,z); floodfill(x+1,y,z);
    floodfill(x,y-1,z); floodfill(x,y+1,z);
    floodfill(x+1,y+1,z); floodfill(x+1,y-1,z);
    floodfill(x-1,y+1,z); floodfill(x-1,y-1,z);
  end;


begin
	init;
    draw;

	ans:=10;
	for i:=1 to m do
		for j:=1 to n do
			if a[i,j]=0 then begin
				inc(ans);floodfill(i,j,ans);
			end;
	for i:=1 to m do for j:=1 to n do 
		if (a[i,j]>0)and(a[i,j]<10) then inc(ans);
	writeln(ans-10);
end.