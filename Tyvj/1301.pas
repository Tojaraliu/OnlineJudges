Type
  int=longint;
  sgt=record
    l,r,mid:int;
    sum:int;
  end;

Var
  tr:array[1..1000000]of sgt;
  b,c,d,q:array[1..50000]of int;
  a:array[1..200000]of int;
  cmd:array[1..50000]of char;
  t1,t2,n,m,i,j,x,y,tot:int;

Function getsum(p,i:int):int;
begin
  with tr[p] do begin
    if (l=i)and(r=i) then exit(sum);
    if i<=mid then exit(sum+getsum(p<<1,i))
    else exit(sum+getsum(p<<1+1,i));
  end;
end;

Procedure change(p,i,j,k:int);
begin
  with tr[p] do begin
    if (l=i)and(r=j) then begin
      inc(sum,k); exit;
    end;
    if j<=mid then change(p<<1,i,j,k)
    else if i>mid then change(p<<1+1,i,j,k)
    else begin change(p<<1,i,mid,k); change(p<<1+1,mid+1,j,k); end;
  end;
end;

Procedure build(p,i,j:int);
begin
  with tr[p] do begin
    l:=i; r:=j; mid:=(l+r)>>1;
    if l<>r then begin
      build(p<<1,l,mid); build(p<<1+1,mid+1,r);
    end;
  end;
end;

Procedure sort(l,r:int);
var
 i,j,x,t:int;
begin
  i:=l; j:=r; x:=a[(l+r)>>1];
  while i<=j do begin
    while a[i]<x do inc(i); 
    while a[j]>x do dec(j);
    if i<=j then begin
      t:=a[i]; a[i]:=a[j]; a[j]:=t;
      inc(i); dec(j);
    end;
  end;
  if i<r then sort(i,r); 
  if l<j then sort(l,j);
end;

Function find(x:int):int;
var
  l,r,mid:int;
begin
  l:=1; r:=n;
  while l<>r do begin
    mid:=(l+r)>>1;
    if a[mid]>=x then r:=mid else l:=mid+1;
  end;
  exit(l);
end;

Procedure add(x:int);
begin
  inc(tot); a[tot]:=x;
end;

begin
  readln(n,m);
  for i:=1 to m do begin
    read(cmd[i]);
    case cmd[i] of
      'W':begin inc(t1); readln(b[t1],c[t1],d[t1]); add(b[t1]); add(c[t1]) end;
      'S':begin inc(t2); readln(q[t2]); add(q[t2]); end;
    end;
  end;
  sort(1,tot);
  for i:=2 to tot do if a[i]=a[i-1] then
  for j:=i to tot do if a[j]=a[i-1] then a[j]:=inf else break;
  sort(1,tot);
  while a[tot]=inf do dec(tot); build(1,1,tot); n:=tot;
  t1:=0; t2:=0;
  for i:=1 to m do begin
    case cmd[i] of
      'W':begin
            inc(t1); x:=find(b[t1]); y:=find(c[t1]); change(1,x,y,d[t1]);
          end;
      'S':begin
            inc(t2); x:=find(q[t2]); writeln(getsum(1,x));
          end;
    end;
  end;
end.