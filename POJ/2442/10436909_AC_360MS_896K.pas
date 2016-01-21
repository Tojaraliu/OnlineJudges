type
 arr=array[0..2000]of longint;
var
 a,b,f:arr;
 t,n,m,i,j,k:longint;

procedure qsort(var a:arr);
 procedure sort(l,r:longint);
  var
   i,j,x,y:longint;
  begin
   i:=l; j:=r;
   x:=a[(l+r)>>1];
   repeat
    while a[i]<x do inc(i);
    while x<a[j] do dec(j);
    if not(i>j) then
     begin
      y:=a[i]; a[i]:=a[j]; a[j]:=y;
      inc(i); dec(j);
     end;
   until i>j;
   if l<j then sort(l,j);
   if i<r then sort(i,r);
  end;
 begin
  sort(1,n);
 end;

procedure swap(var x,y:longint);
 var
  z:longint;
 begin
  z:=x; x:=y; y:=z;
 end;

procedure down(l,r:longint);
 var
  p:longint;
 begin
  p:=l<<1;
  while p<=r do
   begin
    if (p<r)and(f[p]<f[p+1]) then inc(p);
    if f[l]<f[p] then
     begin
      swap(f[l],f[p]);
      l:=p; p:=l<<1;
     end
    else break;
   end;
 end;

begin
 read(t);
 repeat
  dec(t);
  read(m,n);
  for i:=1 to n do read(a[i]);
  qsort(a);
  for i:=2 to m do begin
    for j:=1 to n do read(b[j]);
    qsort(b);
    for j:=1 to n do f[j]:=b[1]+a[j];
    for j:=n>>1 downto 1 do down(j,n);
    for j:=2 to n do
     for k:=1 to n do
      if b[j]+a[k]<f[1] then
       begin f[1]:=b[j]+a[k]; down(1,n); end
      else break;
    a:=f;
    qsort(a);
   end;
  for i:=1 to n-1 do write(a[i],' ');
  writeln(a[n]);
 until t=0;
end.