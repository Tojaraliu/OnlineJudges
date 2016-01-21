Type
  int=longint;
  segment=record
    p,p1,p2,b:int;
  end;
  
Var
  x1,y1,x2,y2:Array[0..5050] of int;
  c:array[-10011..10011] of int;
  n,i,ans:int;
  seg:array[0..5050*2] of segment;
  
Procedure qsort(l,r:int);
var 
  i,j:int; 
  t,x:segment;
begin
  i:=l; j:=r; x:=seg[(l+r)>>1];
  repeat
    while (seg[i].p<x.p) or (seg[i].p=x.p) and (seg[i].b>x.b) do inc(i);
    while (seg[j].p>x.p) or (seg[j].p=x.p) and (seg[j].b<x.b) do dec(j);
    if i<=j then begin
      t:=seg[i]; seg[i]:=seg[j]; seg[j]:=t;
      inc(i);dec(j);
    end;
  until i>j;
  if l<j then qsort(l,j); if i<r then qsort(i,r);
end;

Procedure add(lf,rt,b:int);
var 
  i:int;
begin
  for i:=lf to rt do inc(c[i],b);
end;

Function many(lf,rt:int):int;
var 
  i:int;
begin
  many:=0;
  for i:=lf to rt do
    if c[i]=1 then inc(many);
end;

begin
  readln(n);
  for i:=1 to n do readln(x1[i],y1[i],x2[i],y2[i]);
  for i:=1 to n do begin
    with seg[i] do begin
      p:=y1[i]; p1:=x1[i]; p2:=x2[i]; b:=1;
    end;
    with seg[i+n] do begin
      p:=y2[i]; p1:=x1[i]; p2:=x2[i]; b:=-1;
    end;
  end;
  ans:=0;
  qsort(1,n<<1);
  for i:=1 to n<<1 do with seg[i] do begin
    if b<0 then inc(ans,many(p1+1,p2));
    add(p1+1,p2,b);
  end;
  for i:=1 to n do begin
    with seg[i] do begin
      p:=x1[i]; p1:=y1[i]; p2:=y2[i]; b:=1;
    end;
    with seg[i+n] do begin
      p:=x2[i]; p1:=y1[i]; p2:=y2[i]; b:=-1;
    end;
  end;
  qsort(1,n<<1);
  for i:=1 to n<<1 do with seg[i] do begin
    if b<0 then inc(ans,many(p1+1,p2));
    add(p1+1,p2,b);
  end;
  writeln(ans<<1);
end.
