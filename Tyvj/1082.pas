var
	a:array[0..10001] of ansistring;
	b:array[0..10001] of longint;
	i,n:integer;

procedure qsort1(l,r:longint);
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
  if i<r then qsort1(i,r);
  if l<j then qsort1(l,j);
end;

procedure qsort(l,r:longint);
var i,j:longint;m,t:longint;
begin
  i:=l;j:=r;m:=b[(l+r)div 2];
  repeat
    while b[i]<m do inc(i);
    while b[j]>m do dec(j);
    if i<=j then begin
      t:=b[i];b[i]:=b[j];b[j]:=t;
      inc(i);dec(j);
    end;
  until i>j;
  if i<r then qsort(i,r);
  if l<j then qsort(l,j);
end;

begin
  readln(n);
  for i:=1 to n do readln(a[i]);
  qsort1(1,n);
  for i:=1 to n do readln(b[i]);
  qsort(1,n);

  for i:=1 to n do writeln(a[i],' ',b[i]);
end.