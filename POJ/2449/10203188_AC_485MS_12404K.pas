Const
  inf=1<<29;
  
Type
  int=longint;
  node=object
    f,g,p,h:int;
  end;
  point=^link;
  link=object
    id,v:int;
    next:point;
  end;
  heap=object
    a:Array[0..500000] of node;
    size:int;
    Procedure swap(var x,y:node);
    Procedure reset;
    Procedure up(x:int);
    Procedure down(x:int);
    Procedure push(x:node);
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
  size:=0;
  fillchar(a,sizeof(a),0);
end;
Procedure heap.up(x:int);
var
  t:int;
begin
  if x=1 then exit;
  t:=x>>1;
  if a[t].f>a[x].f then begin
    swap(a[t],a[x]);
    up(t);
  end;
end;
Procedure heap.down(x:int);
var
  t:int;
begin
  if (x<<1>size) then exit
  else if ((x<<1)=size) then t:=x<<1
  else if (a[x<<1].f)<a[x<<1+1].f then t:=x<<1 else t:=x<<1+1;
  if a[t].f<a[x].f then begin swap(a[t],a[x]);down(t);end;
end;
Procedure heap.push(x:node);
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
  swap(a[1],a[size]);dec(size);
  down(1);
  exit(op);
end;
  
Var
  he:heap;
  e,re:Array[0..100000] of point;
  q,g,times:Array[0..100000] of int;
  v:Array[0..100000] of boolean;
  n,m,fn,st,kk:int;

Procedure add(x,y,z:int);
var
  p:point;
begin
  new(p);
  p^.id:=y;p^.v:=z;p^.next:=e[x];e[x]:=p
end;

Procedure addre(x,y,z:int);
var
  p:point;
begin
  new(p);
  p^.id:=y;p^.v:=z;p^.next:=re[x];re[x]:=p
end;

Procedure init;
var
  i,x,y,z:int;
begin
  readln(n,m);
  for i:=1 to m do begin
    readln(x,y,z);
    add(x,y,z);addre(y,x,z);
  end;
  readln(st,fn,kk);
  if st=fn then inc(kk);
end;

Procedure spfa;
var
  h,t,i:int;
  p:point;
begin
  h:=0;t:=1;q[h]:=fn;
  fillchar(v,sizeof(v),0);v[fn]:=true;
  for i:=1 to n do g[i]:=inf;g[fn]:=0;
  while h<>t do begin
    p:=re[q[h]];
    while p<>nil do begin
      if g[p^.id]>g[q[h]]+p^.v then begin
        g[p^.id]:=g[q[h]]+p^.v;
        if not(v[p^.id]) then begin
          q[t]:=p^.id;t:=(t+1) mod 100000;
          v[p^.id]:=true;
        end;
      end;
      p:=p^.next;
    end;
    v[q[h]]:=false;h:=(h+1) mod 100000;
  end;
end;

Function main:int;
var
  p:point;
  h,tmp:node;
begin
  he.reset;
  h.p:=st;h.g:=0;h.h:=0;he.push(h);
  fillchar(times,sizeof(times),0);
  while (he.size>0) do begin
    h:=he.pop;
    inc(times[h.p]);
    if (times[h.p]=kk)and(h.p=fn) then exit(h.h+h.g);
    if (times[h.p]>kk) then continue;
    p:=e[h.p];
    while p<>nil do begin
      tmp.h:=h.h+p^.v;
      tmp.g:=g[p^.id];
      tmp.f:=tmp.h+tmp.g;
      tmp.p:=p^.id;
      he.push(tmp);
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