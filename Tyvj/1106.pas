Const
  inf=1<<29;

Type
  int=longint;
  point=^link;
  link=record
    id,v:int;
    next:point;
  end;

Var
  e:Array[0..200011] of point;
  v:Array[0..200011] of boolean;
  heap,pos,q:Array[0..200110] of int;
  d:Array[0..201100] of int;
  a,b:Array[0..1011,0..1010] of int;
  n,m,mm,size,i,ans:int;

Procedure add(x,y,z:int);
var
  p:point;
begin
  new(p);
  p^.id:=y;p^.v:=z;p^.next:=e[x];e[x]:=p;
end;

Procedure swap(x,y:int);
var
  t:int;
begin
  pos[heap[x]]:=y;pos[heap[y]]:=x;
  t:=heap[x];heap[x]:=heap[y];heap[y]:=t;
end;

Procedure down(x:int);
var
  t:int;
begin
  if ((x<<1)>size) then exit
  else if ((x<<1)=size) then t:=x<<1
  else if ((d[heap[x<<1]])<d[heap[x<<1+1]]) then t:=x<<1 else t:=x<<1+1;
  if d[heap[t]]<d[heap[x]] then begin swap(t,x);down(t);end;
end;

Procedure up(x:int);
begin
  if x=1 then exit;
  if d[heap[x]]<d[heap[x>>1]] then begin
    swap(x,x>>1);up(x>>1);
  end;
end;

Procedure sift(x:int);
begin
  if (x>>1<>0)and(d[heap[x]]<d[heap[x>>1]]) then up(x) else down(x);
end;

Procedure init;
var
  i,j:int;
begin
  readln(n);mm:=0;
  fillchar(b,sizeof(b),0);
  for i:=1 to n do begin
    for j:=1 to i do begin
      inc(mm);b[i,j]:=mm;
      read(a[i,j]);
    end;
  end;
end;

Procedure init_Graph;
var
  i,j,t1,t2:int;
begin
  for i:=2 to n do begin
    for j:=1 to i-1 do begin
      add(b[i,j],b[i,j+1],a[i,j+1]);add(b[i,j+1],b[i,j],a[i,j]);
    end;
    add(b[i,1],b[i,i],a[i,i]);add(b[i,i],b[i,1],a[i,1]);
  end;
  for i:=2 to n do begin
    for j:=1 to i do begin
      t1:=b[i,j];
      t2:=b[i-1,j];
      if t2<>0 then begin
        add(t1,t2,a[i-1,j]);
      end;
      t2:=b[i-1,j-1];
      if t2<>0 then begin
        add(t1,t2,a[i-1,j-1]);
      end;
    end;
    add(b[i,1],b[i-1,i-1],a[i-1,i-1]);
    add(b[i,i],b[i-1,1],a[i-1,1]);
  end;
  fillchar(d,sizeof(d),63);
  for i:=1 to mm do begin
    heap[i]:=i;pos[i]:=i;
  end;
end;

Procedure heapdij;
var
  i,j,k,maxj:int;
  p:point;
begin
  d[b[n,1]]:=a[n,1];size:=mm;
  up(pos[b[n,1]]);
  for i:=1 to mm do begin
    j:=heap[1];
    swap(1,size);dec(size);down(1);
    p:=e[j];
    while p<>nil do begin
      if (d[p^.id]>d[j]+p^.v) then begin
        d[p^.id]:=d[j]+p^.v;
        up(pos[p^.id]);
      end;
      p:=p^.next;
    end;
  end;
  writeln(d[b[1,1]]);
end;

Begin
  init;
  init_Graph;
  heapdij;
end.
