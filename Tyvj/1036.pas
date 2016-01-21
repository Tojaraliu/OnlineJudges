var
  i,n,k,time:longint;
  a:array[0..200001]of longint;
procedure qsort(l,r:longint);
var i,j:longint;m,t:longint;
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
	i:=1;
	while i<=n do begin
		k:=a[i];time:=0;
		while a[i]=k do begin inc(time);inc(i);end;
		writeln(k,' ',time);
	end;
end.