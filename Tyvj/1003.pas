var
	m,mt:1..10000000;
	ut,ft,dt:1..100;
	t,i,total:1..100000;
	a:array[1..100000] of char;

function time(a:char):longint;
begin
	case a of
		'u':time:=ut+dt;
		'f':time:=ft*2;
		'd':time:=dt+ut;
	end;
end;

begin
	read(m,t,ut,ft,dt);
        readln;
	for i:=1 to t do
		readln(a[i]);
	total:=0;
	mt:=0;
	
	for i:=1 to t do	
		begin
			if (mt+time(a[i]))>m
				then begin writeln(total);halt;end
				else
					begin
						inc(total);
						inc(mt,time(a[i]));
					end;
                end;
	
	writeln(total);
	
end.