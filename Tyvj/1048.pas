const
  inf=1<<29;
var
  a,b:array[0..1001] of longint;
  f:array[-1..1001,-1..1001] of longint;
  n,i,j,ans:longint;

procedure swap(var a,b:longint);
begin
  if a=b then exit;
  a:=a xor b;
  b:=a xor b;
  a:=a xor b;
end;

procedure qsort1(l,r:longint);
var i,j:longint;m,t:longint;
begin
  i:=l;j:=r;m:=a[(l+r)div 2];
  repeat
    while a[i]>m do inc(i);
    while a[j]<m do dec(j);
    if i<=j then begin
      swap(a[i],a[j]);
      inc(i);dec(j);
    end;
  until i>j;
  if i<r then qsort1(i,r);
  if l<j then qsort1(l,j);
end;

procedure qsort2(l,r:longint);
var i,j:longint;m,t:longint;
begin
  i:=l;j:=r;m:=b[(l+r)div 2];
  repeat
    while b[i]>m do inc(i);
    while b[j]<m do dec(j);
    if i<=j then begin
      swap(b[i],b[j]);
      inc(i);dec(j);
    end;
  until i>j;
  if i<r then qsort2(i,r);
  if l<j then qsort2(l,j);
end;

function max(a,b:longint):longint;
begin
  if a>b then exit(a);
  exit(b);
end;

procedure init;
var
  i,j:longint;
begin
  read(n);
  for i:=1 to n do read(b[i]);
  for i:=1 to n do read(a[i]);
  qsort1(1,n);
  qsort2(1,n);
  filldword(f,sizeof(f)>>2,-inf);
  f[0,0]:=0;
end;

procedure main;
var
  i,j:longint;
begin
  for i:=0 to n-1 do
    for j:=0 to i do
      if f[i,j]>-inf then
        begin
          if a[i+1]<b[j+1] then f[i+1,j+1]:=max(f[i+1,j+1],f[i,j]+200);
          if a[i+1]>b[n-i+j] then f[i+1,j]:=max(f[i+1,j],f[i,j]-200);
          if a[i+1]=b[j+1] then f[i+1,j+1]:=max(f[i+1,j+1],f[i,j]);
          if a[i+1]=b[n-i+j] then f[i+1,j]:=max(f[i+1,j],f[i,j]);
        end;
end;
  
begin
  init;
  main;
  for i:=1 to n do ans:=max(ans,f[n,i]);
  writeln(ans);
end.