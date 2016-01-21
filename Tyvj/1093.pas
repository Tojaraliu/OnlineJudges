program shudu;

type
	arr=array[1..9,1..9] of shortint;

var
	a:arr;
	n,i:1..20;

procedure reada(var a:arr);
var
	i,j:1..9;
begin
	for i:=1 to 9 do
		begin
			for j:=1 to 9 do
				read(a[i,j]);
			readln;
		end;
end;

function heng(a:arr;x:integer):boolean;
var
	b:array[1..9] of 0..2=(0,0,0,0,0,0,0,0,0);
	k:1..9;
begin
	for k:=1 to 9 do
		begin
			inc(b[a[k,x]]);
			if b[a[k,x]]=2
				then begin heng:=false;exit;end;
		end;
	heng:=true;
end;

function zong(a:arr;x:integer):boolean;
var
	b:array[1..9] of 0..2=(0,0,0,0,0,0,0,0,0);
	i:1..9;
begin
	for i:=1 to 9 do
		begin
			inc(b[a[x,i]]);
			if b[a[x,i]]=2
				then begin zong:=false;exit;end;
		end;
	zong:=true;
end;

function jgg(a:arr;x,y:shortint):boolean;
var
	b:array[1..9] of 0..2=(0,0,0,0,0,0,0,0,0);
	p,q:1..3;
begin
	for p:=x to x+2 do
		for q:=y to y+2 do
			begin
				inc(b[a[p,q]]);
				if b[a[p,q]]=2
				then begin jgg:=false;exit;end;
			end;
	jgg:=true;
end;
	

procedure pd(a:arr);
var
	i:1..9;
	j:1..3;
	n,m:1..9;
begin
	for i:=1 to 9 do
		begin
			if (heng(a,i)=false)
				then begin writeln('Wrong');exit;end;
			if (zong(a,i)=false)
				then begin writeln('Wrong');exit;end;
		end;
	for i:=1 to 3 do
		for j:=1 to 3 do
			begin
				case i of
					1:n:=1;
					2:n:=4;
					3:n:=7;
				end;
				case j of
					1:m:=1;
					2:m:=4;
					3:m:=7;
                                end;
				if (jgg(a,n,m)=false)
                                        then begin writeln('Wrong');exit;end;
			end;

	writeln('Right');
end;

begin
	{assign(input,'xx.txt');
	reset(input);}
	readln(n);
	for i:=1 to n do
		begin
			reada(a);
			pd(a);
			readln;
		end;
	{close(input);}
end.