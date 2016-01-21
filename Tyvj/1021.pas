var
	a:array[0..10000] of longint;
	i,n,j:integer;
	total:int64;

procedure qsort(l,r:longint);
var
	i,j:longint;m,t:longint;
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

  for i:=1 to n do	
	for j:=i+1 to n do
                begin
		total:=total+a[j]-a[i];
                {writeln(total,' ',a[j],'-',a[i]);}
                end;
	writeln(total*2);

end.