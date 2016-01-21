{
ID:ToJaRa
LANG:PASCAL
PROG:milk
}
const
	inp='milk.in';
	outp='milk.out';

type
  arr=array[0..5000] of longint;

var
  n,m:longint;
  p,a:arr;

procedure openf;
begin
  assign(input,inp);reset(input);
	assign(output,outp);rewrite(output);
end;

procedure closef;
begin
  close(input);
  close(output);
end;

procedure init;
var
  i:longint;
begin
  readln(n,m);
  for i:=1 to m do readln(p[i],a[i]);
end;

procedure swap(var x,y:longint);
var t:longint;
begin t:=x;x:=y;y:=t;end;

procedure qsort(l,r:longint);
var
  i,j,x:longint;
begin
  i:=l;j:=r;x:=p[(l+r)>>1];
  repeat
		while p[i]<x do inc(i);
		while p[j]>x do dec(j);
		if i<=j then
		begin
			swap(p[i],p[j]);swap(a[i],a[j]);
			inc(i);dec(j);
		end;
	until i>j;
	if i<r then qsort(i,r);
	if j>l then qsort(l,j);
end;

procedure work;
var
  ans:longint;tot,i:longint;
begin
  qsort(1,m);
  ans:=0;tot:=n;
  for i:=1 to m do begin
    if tot>a[i]
      then begin inc(ans,p[i]*a[i]);dec(tot,a[i]);end
      else begin inc(ans,tot*p[i]);break;end;
  end;
  writeln(ans);
end;

begin
  openf;
  init;
  work;
  closef;
end.
