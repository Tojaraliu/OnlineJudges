type
	arr=array[1..10000] of integer;

var
  i,n,k,total:longint;
  a,b:arr;

procedure swap(var a,b:integer);
var
	t:integer;
begin
	t:=a;
	a:=b;
	b:=t;
end;

procedure qsort(l,r:longint;var a:arr);
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
  if i<r then qsort(i,r,a);
  if l<j then qsort(l,j,a);
end;

begin
  readln(n);
  for i:=1 to n do read(a[i]);
  readln;
  for i:=1 to n do	read(b[i]);
  qsort(1,n,a);
  qsort(1,n,b);
  k:=1;

	while k<=(n div 2) do
		begin
			swap(b[k],b[n-k+1]);
			inc(k);
		end;

	{for i:=1 to n do
		write(a[i]);
	writeln;
	for i:=1 to n do
		write(b[i]);}
        for i:=1 to n do
                inc(total,abs(a[i]-b[i]));
        writeln(total);


end.