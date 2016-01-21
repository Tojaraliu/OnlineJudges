var
  a:array[0..101] of longint;
  n,sum:longint;

procedure swap(var x,y:longint);
var
	t:longint;
begin
	t:=x;x:=y;y:=t;
end;

procedure init;
var
  i:longint;
begin
  read(n);
  for i:=1 to n do read(a[i]);
end;

procedure qsort(l,r:longint);
var
  i,j,x:longint;
begin
  i:=l;j:=r;x:=a[(l+r)>>1];
  repeat
    while a[i]<x do inc(i);
    while a[j]>x do dec(j);
    if i<=j then begin
      swap(a[i],a[j]);
      inc(i);dec(j);
    end;
  until i>j;
  if i<r then qsort(i,r);
  if j>l then qsort(l,j);
end;

procedure print;
var
  i:longint;
begin
  sum:=0;
  for i:=1 to (n>>1)+1 do inc(sum,(a[i]>>1)+1);
  writeln(sum);
end;

begin
  init;
  qsort(1,n);
  print;
end.
