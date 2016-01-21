Const
  inf=1<<29;
  
Type
  int=longint;
  point=record
    x,y:int;
  end;
  
Var
  lev,a,c:Array[0..50000] of int;
  k:Array[0..50000] of point;
  n,m:int;
  
Procedure init;
var
  i:int;
begin
  read(n);
  for i:=1 to n do begin 
    read(k[i].x,k[i].y);
    inc(k[i].x);
    inc(k[i].y);
  end;
end;

Function lowbit(x:int):int;
begin
  exit(x and (-x));
end;
  
Procedure change(i,delta:int);
begin
  while i<=n do begin
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

Procedure swap(var x,y:point);
var
  t:point;
begin
  t:=x;x:=y;y:=t;
end;

Procedure sort(l,r:int);
var
  m1,m2,i,j:int;
begin
  i:=l;j:=r;m1:=k[(l+r)>>1].x;m2:=k[(l+r)>>1].y;
  repeat
    while (k[i].x<m1)or((k[i].x=m1)and(k[i].y<m2)) do inc(i);
    while (k[j].x>m1)or((k[j].x=m1)and(k[j].y>m2)) do dec(j);
    if i<=j then begin
      swap(k[i],k[j]);
      inc(i);dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

Procedure main;
var
  t,i:int;
begin
  m:=-inf;
  for i:=1 to n do begin
    if k[i].y>m then m:=k[i].y;
  end;
  for i:=1 to m do begin
    a[i]:=0;
    change(i,a[i]);
  end;
  for i:=1 to n do begin
    t:=getsum(k[i].y);
    inc(lev[t]);
    change(k[i].y,1);
  end;
  //Output
  for i:=0 to n-1 do writeln(lev[i]);
end;

Begin
  init;
  sort(1,n);
  main;
End.