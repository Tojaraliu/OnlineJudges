type
	cow=record x,y:int64; end;
var
	a:array[0..2001] of cow;
	n,i,j,a1,a2:longint;
	min,k:qword;
begin
        //assign(input,'xx');reset(input);
	read(n);
	min:=100000000000000;
	for i:=1 to n do read(a[i].x,a[i].y);
	for i:=1 to n-1 do
		for j:=i+1 to n do begin
		if sqr(a[i].x-a[j].x)+sqr(a[i].y-a[j].y)<min then begin
			min:=sqr(a[i].x-a[j].x)+sqr(a[i].y-a[j].y);
			a1:=i;a2:=j;
		end;
	end;
	writeln(a1,' ',a2);
        //close(input);
end.