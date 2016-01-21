var
	a:array[0..201,0..101] of boolean;
	n,k,i:longint;
	f:boolean;

procedure init;
var
	i,j:longint;
	ch:char;
begin
	readln(n);
	for i:=1 to n<<1-1 do begin
		for j:=1 to n do begin
			read(ch);
			if ch='#' then a[i,j]:=true;
		end;
		readln;
	end;
end;
function com1:boolean;
var
	b:array[0..201,0..101] of boolean;
	i,j:longint;
begin
	fillchar(b,sizeof(b),false);
	for i:=1 to n<<1-1 do
		b[i,n]:=true;
	for i:=1 to n<<1-1 do 
		for j:=1 to n do
			if a[i,j]<>b[i,j] then exit(false);
	exit(true);
end;

function com2:boolean;
var
	b:array[0..201,0..101] of boolean;
	i,j:longint;
begin
	fillchar(b,sizeof(b),false);
	for i:=1 to n do begin
		b[1,i]:=true;
		b[((n<<1-1) div 2)+1,i]:=true;
		b[(n<<1-1),i]:=true;
	end;
	for i:=1 to ((n<<1-1) div 2)+1 do b[i,n]:=true;
	for i:=((n<<1-1) div 2)+1 to n<<1-1 do b[i,1]:=true;
	for i:=1 to n<<1-1 do
		for j:=1 to n do
			if b[i,j]<>a[i,j] then exit(false);
	exit(true);
end;

function com3:boolean;
var
	b:array[0..201,0..101] of boolean;
	i,j:longint;
begin
	fillchar(b,sizeof(b),false);
	for i:=1 to n do begin
		b[1,i]:=true;
		b[((n<<1-1) div 2)+1,i]:=true;
		b[(n<<1-1),i]:=true;
	end;
	for i:=1 to n<<1-1 do
		b[i,n]:=true;
	for i:=1 to n<<1-1 do
		for j:=1 to n do
			if b[i,j]<>a[i,j] then exit(false);
	exit(true);
end;

function com4:boolean;
var
	b:array[0..201,0..101] of boolean;
	i,j:longint;
begin
	fillchar(b,sizeof(b),false);
	for i:=1 to n do b[((n<<1-1) div 2)+1,i]:=true;
	for i:=1 to ((n<<1-1) div 2)+1 do b[i,1]:=true;
	for i:=1 to (n<<1-1) do b[i,n]:=true;
	for i:=1 to n<<1-1 do 
		for j:=1 to n do
			if a[i,j]<>b[i,j] then exit(false);
	exit(true);
end;

function com5:boolean;
var
	b:array[0..201,0..101] of boolean;
	i,j:longint;
begin
	fillchar(b,sizeof(b),false);
	for i:=1 to n do begin
		b[1,i]:=true;
		b[((n<<1-1) div 2)+1,i]:=true;
		b[(n<<1-1),i]:=true;
	end;
	for i:=1 to ((n<<1-1) div 2)+1 do b[i,1]:=true;
	for i:=((n<<1-1) div 2)+1 to n<<1-1 do b[i,n]:=true;
	for i:=1 to n<<1-1 do
		for j:=1 to n do
			if b[i,j]<>a[i,j] then exit(false);
	exit(true);
end;

function com6:boolean;
var
	b:array[0..201,0..101] of boolean;
	i,j:longint;
begin
	fillchar(b,sizeof(b),false);
	for i:=1 to n do begin
		b[1,i]:=true;
		b[((n<<1-1) div 2)+1,i]:=true;
		b[(n<<1-1),i]:=true;
	end;
	for i:=1 to n<<1-1 do b[i,1]:=true;
	for i:=((n<<1-1) div 2)+1 to n<<1-1 do b[i,n]:=true;
	for i:=1 to n<<1-1 do
		for j:=1 to n do
			if a[i,j]<>b[i,j] then exit(false);
	exit(true);
end;

function com7:boolean;
var
	b:array[0..201,0..101] of boolean;
	i,j:longint;
begin
	fillchar(b,sizeof(b),false);
	for i:=1 to n do b[1,i]:=true;
	for i:=1 to n<<1-1 do b[i,n]:=true;
	for i:=1 to n<<1-1 do
		for j:=1 to n do
			if a[i,j]<>b[i,j] then exit(false);
	exit(true);
end;

function com8:boolean;
var
	b:array[0..201,0..101] of boolean;
	i,j:longint;
begin
	fillchar(b,sizeof(b),false);
	for i:=1 to n do begin
		b[1,i]:=true;
		b[((n<<1-1) div 2)+1,i]:=true;
		b[(n<<1-1),i]:=true;
	end;
	for i:=1 to n<<1-1 do begin
		b[i,1]:=true;
		b[i,n]:=true;
	end;
	for i:=1 to n<<1-1 do
		for j:=1 to n do
			if a[i,j]<>b[i,j] then exit(false);
	exit(true);
end;

function com9:boolean;
var
	b:array[0..201,0..101] of boolean;
	i,j:longint;
begin
	fillchar(b,sizeof(b),false);
	for i:=1 to n do begin
		b[1,i]:=true;
		b[((n<<1-1) div 2)+1,i]:=true;
		b[(n<<1-1),i]:=true;
	end;
	for i:=1 to n<<1-1 do b[i,n]:=true;
	for i:=1 to ((n<<1-1) div 2)+1 do b[i,1]:=true;
	for i:=1 to n<<1-1 do
		for j:=1 to n do
			if a[i,j]<>b[i,j] then exit(false);
	exit(true);
end;

function com0:boolean;
var
	b:array[0..201,0..101] of boolean;
	i,j:longint;
begin
	fillchar(b,sizeof(b),false);
	for i:=1 to n do begin
		b[1,i]:=true;
		b[(n<<1-1),i]:=true;
	end;
	for i:=1 to n<<1-1 do begin
		b[i,1]:=true;
		b[i,n]:=true;
	end;
	for i:=1 to n<<1-1 do
		for j:=1 to n do
			if a[i,j]<>b[i,j] then exit(false);
	exit(true);
end;

function compare(k:longint):boolean;
begin
	case k of 
		1:exit(com1);
		2:exit(com2);
		3:exit(com3);
		4:exit(com4);
		5:exit(com5);
		6:exit(com6);
		7:exit(com7);
		8:exit(com8);
		9:exit(com9);
		0:exit(com0);
	end;
end;

begin
	for k:=1 to 5 do begin
		fillchar(a,sizeof(a),false);
		init;
		f:=true;
		for i:=0 to 9 do
			if compare(i) then begin f:=false;write(i);break;end;
		if f then write('?');
	end;
end.