const
	maxs=2000000;
	maxn=100000;
var
	l,r:array[0..maxs]of longint;
	add,sum:array[0..maxs]of int64;
	a:array[0..maxn]of int64;
	n,m,i,x,y:longint; o:char; z:int64;
procedure swap(var a,b:longint);
	var t:longint;
	begin
		t:=a; a:=b; b:=t;
	end;	
procedure build(left,right,t:longint);
	var mid:longint;
	begin
		l[t]:=left; r[t]:=right; add[t]:=0;
		if l[t]=r[t] then begin
			sum[t]:=a[l[t]]; exit;
		end;
		mid:=(l[t]+r[t])>>1;
		if left<=mid then build(left,mid,t<<1);
		if right>mid then build(mid+1,right,t<<1 or 1);
		sum[t]:=sum[t<<1]+sum[t<<1 or 1];
	end;
procedure change(t:longint; x:int64);
	begin
		inc(add[t],x);
		inc(sum[t],x*int64(r[t]-l[t]+1));
	end;
procedure spread(t:longint);
	begin
		if l[t]=r[t] then exit;
		if add[t]<>0 then begin
			change(t<<1,add[t]);
			change(t<<1 or 1,add[t]);
			add[t]:=0;
		end;
	end;
procedure update(left,right:longint; x:int64; t:longint);
	var mid:longint;
	begin
		if (left<=l[t]) and (r[t]<=right) then begin
			change(t,x); exit;
		end;
		spread(t); mid:=(l[t]+r[t])>>1;
		if left<=mid then update(left,right,x,t<<1);
		if right>mid then update(left,right,x,t<<1 or 1);
		sum[t]:=sum[t<<1]+sum[t<<1 or 1];
	end;
	
function ask(left,right,t:longint):int64;
	var mid:longint;
	begin
		if (left<=l[t]) and (r[t]<=right) then exit(sum[t]);
		spread(t); mid:=(l[t]+r[t])>>1; ask:=0;
		if left<=mid then inc(ask,ask(left,right,t<<1));
		if right>mid then inc(ask,ask(left,right,t<<1 or 1));
	end;
	
begin
	readln(n,m);
	for i:=1 to n do read(a[i]); readln;
	build(1,n,1);
	for i:=1 to m do begin
		read(o);
		if o='C' then begin
			readln(x,y,z); if x>y then swap(x,y); update(x,y,z,1);
		end else begin
			readln(x,y); if x>y then swap(x,y); writeln(ask(x,y,1));
		end;
	end;
end.