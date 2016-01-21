type num=record data:longint;odr:longint;end;
var i,n,k:longint;a:array[1..100000]of num;
procedure qsort(l,r:longint);
var i,j:longint;m,t:num;
begin
  i:=l;j:=r;m:=a[(l+r)div 2];
  repeat
    while a[i].data<m.data do inc(i);
    while a[j].data>m.data do dec(j);
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
  for i:=1 to n do begin read(a[i].data);a[i].odr:=i;end;
  read(k);qsort(1,n);
  writeln(a[k].odr);
end.