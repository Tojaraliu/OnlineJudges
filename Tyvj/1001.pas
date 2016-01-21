var
  i,n,t:longint;
  k:integer;
  a:array[1..10000]of longint;

function zs(a:longint):string;
var
        i:integer;
begin
        for i:=2 to trunc(sqrt(abs(a))) do
                if (abs(a) mod i)=0
                        then begin zs:='NO';exit;end;
        zs:='YES';
end;

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
  readln(n,k);
  for i:=1 to n do read(a[i]);
  qsort(1,n);
  t:=a[n-k+1]-a[k];
  writeln(zs(t));
  writeln(t);
end.