Const
  inf=1<<29;

Type
  int=longint;
  node=object
    g,h,p:int
  end;
  point=^link;
  link=object
    id,v:int;
    next:point;
  end;
  heap=object
    a:Array[0..1000000] of node;
    size:int;
    Procedure swap(var x,y:node);
    Procedure reset;
    Procedure up(x:int);
    Procedure down(x:int);
    Procedure insert(x:node);
    Function pop:node;
  end;

Procedure heap.swap(var x,y:node);
var
  t:node;
begin
  t:=x;x:=y;y:=t;
end;
Procedure heap.reset;
begin
  fillchar(a,sizeof(a),0);
  size:=0;
end;
Procedure heap.up(x:int);
var
  t:int;
begin
  if x=1 then exit;
  t:=x>>1;
  if (a[x].g+a[x].h)<(a[t].g+a[t].h) then begin
    swap(a[x],a[t]);up(t);
  end;
end;
Procedure heap.down(x:int);
var
  t:int;
begin
  if x<<1>size then exit
  else if x<<1+1>size then t:=x<<1
  else if (a[x<<1].g+a[x<<1].h)<(a[x<<1+1].g+a[x<<1+1].h) then t:=x<<1 else t:=x<<1+1;
  if (a[t].g+a[t].h)<(a[x].g+a[x].h) then begin swap(a[x],a[t]);down(t);end;
end;
Procedure heap.insert(x:node);
begin
  inc(size);
  a[size]:=x;
  up(size);
end;
Function heap.pop:node;
var
  op:node;
begin
  op:=a[1];
  swap(a[size],a[1]);
  dec(size);
  down(1);
  exit(op);
end;

Var
  pq:heap;
  e,re:Array[0..2000020] of point;
  g,q,times:Array[0..2000020] of int;
  v:Array[0..2000020] of boolean;
  n,m,st,fn,kk,ne:int;

Procedure add(x,y,z:int);
var
  p:point;
begin
  new(p);
  p^.id:=y;p^.v:=z;p^.next:=e[x];e[x]:=p;
end;

Procedure addre(x,y,z:int);
var
  p:point;
begin
  new(p);
  p^.id:=y;p^.v:=z;p^.next:=re[x];re[x]:=p;
end;

Procedure init;
var
  i,x,y,z:int;
begin
  readln(n,m);ne:=0;
  for i:=1 to m do begin
    readln(x,y,z);
    add(x,y,z);addre(y,x,z);
  end;
  readln(st,fn,kk);
  if st=fn then inc(kk);
end;

Procedure spfa;
var
  h,t:int;
  p:point;
begin
  h:=0;t:=1;q[h]:=fn;
  fillchar(g,sizeof(g),$39);g[fn]:=0;
  fillchar(v,sizeof(v),0);v[fn]:=true;
  while h<>t do begin
    p:=re[q[h]];
    while p<>nil do begin
      if g[p^.id]>g[q[h]]+p^.v then begin
        g[p^.id]:=g[q[h]]+p^.v;
        if not(v[p^.id]) then begin
          q[t]:=p^.id;t:=(t+1) mod 2000;
          v[p^.id]:=true;
        end;
      end;
      p:=p^.next;
    end;
    h:=(h+1) mod 2000;
  end;
end;

Function main:int;
var
  h,tmp:node;
  p:point;
begin
  pq.reset;
  fillchar(times,sizeof(times),0);
  h.p:=st;h.g:=0;h.h:=0;pq.insert(h);
  while (pq.size<>0) do begin
    h:=pq.pop;
    inc(times[h.p]);
    if (times[h.p]=kk)and(h.p=fn) then exit(h.h+h.g);
    if (times[h.p]>kk) then continue;
    p:=e[h.p];
    while p<>nil do begin
      tmp.h:=h.h+p^.v;
      tmp.g:=g[p^.id];
      tmp.p:=p^.id;
      pq.insert(tmp);
      p:=p^.next;
    end;
  end;
  exit(-1);
end;

Begin
  init;
  spfa;
  writeln(main);
end.
