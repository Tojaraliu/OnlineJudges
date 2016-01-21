type
	com=record
		x:qword;
		n:string;
	end;

var
	a:array[0..100000] of com;
	n,m:longint;

procedure swap(var a,b:com);
var
        t:com;
begin
        t:=a;a:=b;b:=t;
end;

procedure init;
var
	i:longint;
	ch:char;
begin
	readln(n,m);
	for i:=1 to n do read(a[i].x,ch,a[i].n);
end;

procedure shift(x:longint);
var
	t,i:longint;
begin
	while x<=n>>1 do begin
		t:=x<<1;
		if (t<n)and((a[t].x>a[t+1].x)or((a[t].x=a[t+1].x)and(a[t].n>a[t+1].n))) then inc(t);
		if (a[x].x>a[t].x)or((a[x].x=a[t].x)and(a[x].n>a[t].n))
			then begin swap(a[x],a[t]);x:=t;end
			else break;
	end;		
end;

procedure main;
var
	i:longint;
begin
	for i:=n>>1 downto 1 do shift(i);
end;

procedure print;
begin
	while n>0 do begin
		if m=0 then halt;
		writeln(a[1].n);
		a[1].x:=a[1].x<<1;
		if a[1].x>=(1<<32) then begin
			a[1]:=a[n];dec(n);
		end;
		shift(1);
		dec(m);
	end;
end;

begin
	init;
	main;
	print;
end.