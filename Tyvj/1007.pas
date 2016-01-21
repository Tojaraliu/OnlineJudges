var 
  m,n,l,k,d,x1,y1,x2,y2,q,max:longint;
  a,h,s:array[0..5000] of longint;
  i,j:longint;

function min(a,b:longint):longint;
begin
  if a<b then exit(a);
  exit(b);
end;

procedure qsort(l,r:longint);
var 
  i,j,x,y:longint;
begin
  i:=l;j:=r;
  x:=a[(l+r) div 2];
  repeat
  while a[i]<x do inc(i);
  while x<a[j] do dec(j);
  if i<=j then begin
    y:=a[i];a[i]:=a[j];a[j]:=y;
    inc(i);dec(j);
  end;
  until i>j;
  if l<j then qsort(l,j);
  if i<r then qsort(i,r);
end;

begin
  readln(m,n,k,l,d);
  for i:=1 to d do begin
    readln(x1,y1,x2,y2);
    if x1=x2 then inc(s[min(y1,y2)]);
    if y1=y2 then inc(h[min(x1,x2)]);
  end;
  for i:=1 to k do begin
    max:=-maxlongint;
    for j:=1 to m do
      if h[j]>max then begin
        max:=h[j];
        q:=j;
      end;
    h[q]:=-maxlongint;
    a[i]:=q;
  end;
  qsort(1,k);
  for i:=1 to k-1 do
  write(a[i],' ');
  writeln(a[k]);

  for i:=1 to l do
  begin
    max:=-maxlongint;
    for j:=1 to n do
      if s[j]>max then begin
        max:=s[j];
        q:=j;
      end;
    s[q]:=-maxlongint;
    a[i]:=q;
  end;
  qsort(1,l);
  for i:=1 to l-1 do write(a[i],' ');
  writeln(a[l]);
end.