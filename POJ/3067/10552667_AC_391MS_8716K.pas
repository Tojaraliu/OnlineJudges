Const
  inf=1<<29;
  
Type
  int=longint;
  edge=record
    a,b:int;
  end;
  
Var
  e:Array[0..1000001] of edge;
  a,c:Array[0..1001] of int;
  n,m,k,t,i:int;
  ans:int64;
  
Function lowbit(x:int):int;
begin
  exit(x and (x xor (x-1)));
end;

Procedure change(i,delta:int);
begin
  while i<=m do begin
    inc(c[i],delta);
    inc(i,lowbit(i));
  end;
end;

Function getsum(i:int):int;
begin
  getsum:=0;
  while i>0 do begin
    inc(getsum,c[i]);
    i:=i-lowbit(i);
  end;
end;
  
Procedure init;
var
  i:int;
begin
  fillchar(e,sizeof(e),0);
  fillchar(a,sizeof(a),0);fillchar(c,sizeof(c),0);
  readln(n,m,k);
  for i:=1 to k do read(e[i].a,e[i].b);
end;

Procedure swap(var a,b:edge);
var
  t:edge;
begin
  t:=a;a:=b;b:=t;
end;

Procedure sort(l,r:int);
var
  t,x1,x2,i,j:int;
begin
  i:=l;j:=r;
  x1:=e[(l+r)>>1].a;x2:=e[(l+r)>>1].b;
  repeat
    while (e[i].a<x1)or((e[i].a=x1)and(e[i].b<x2)) do inc(i);
    while (e[j].a>x1)or((e[j].a=x1)and(e[j].b>x2)) do dec(j);
    if (i<=j) then begin
      swap(e[i],e[j]);
      inc(i);dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

Procedure main;
var
  i:int;
begin
  m:=-inf;
  for i:=1 to k do begin
    if e[i].b>m then m:=e[i].b;
  end;
  for i:=1 to m do begin
    a[i]:=0;
    change(i,a[i]);
  end;
  ans:=0;
  for i:=1 to k do begin
    inc(ans,getsum(m)-getsum(e[i].b));
    change(e[i].b,1);
  end;
end;

Begin
  readln(t);
  for i:=1 to t do begin
    init;
    sort(1,k);
    main;
    writeln('Test case ',i,': ',ans);
  end;
end.