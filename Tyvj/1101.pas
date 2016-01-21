var
	a:array[1..10000] of ansistring;
	i,n:integer;

procedure qsort(l,r:longint);
var i,j:longint;m,t:ansistring;
begin
  i:=l;j:=r;m:=a[(l+r)div 2];
  repeat
    while a[i]<m do inc(i);
    while a[j]>m do dec(j);
    if i<=j then begin
      t:=a[i];a[i]:=a[j];a[j]:=t;
      inc(i);dec(j);
    end;
  until i>j;
  if i<r then qsort(i,r);
  if l<j then qsort(l,j);
end;

begin
  readln(n);
  for i:=1 to n do readln(a[i]);
  qsort(1,n);
  for i:=1 to n do writeln(a[i]);
end.