{
ID:ToJaRa
PROG:frac1
LANG:PASCAL
}

Const
  inp='frac1.in';
  outp='frac1.out';
  inf=1000000;

Type
  node=record
    fz,fm:integer;
    fs:int64;
  end;

Var
  a:Array[0..100000] of node;
  n,m,i:longint;

function gcd(x,y:longint):longint;
begin
  if x=0 then exit(y);
  if y=0 then exit(x);
  exit(gcd(y,x mod y));
end;

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

procedure work;
var
  i,j,t:longint;
begin
  m:=2;a[1].fz:=0;a[1].fm:=1;a[1].fs:=0;
  a[2].fz:=1;a[2].fm:=1;a[2].fs:=inf;
  for i:=2 to n do
    for j:=1 to i-1 do begin
      t:=gcd(i,j);
      if t<>1 then continue;
      inc(m);a[m].fz:=j;a[m].fm:=i;a[m].fs:=trunc((j/i)*inf);
  end;
end;

procedure swap(var x,y:node);
var
	t:node;
begin
	t:=x;x:=y;y:=t;
end;

procedure qsort(l,r:longint);
var
	i,j,x:longint;
begin
	i:=l;j:=r;x:=a[(l+r) div 2].fs;
	repeat
		while a[i].fs<x do inc(i);
		while a[j].fs>x do dec(j);
		if i<=j then
		begin
			swap(a[i],a[j]);
			inc(i);
			dec(j);
		end;
	until i>j;
	if i<r then qsort(i,r);
	if j>l then qsort(l,j);
end;

begin
  openf;
  readln(n);
  work;
  qsort(1,m);
  for i:=1 to m do writeln(a[i].fz,'/',a[i].fm);
  closef;
end.
