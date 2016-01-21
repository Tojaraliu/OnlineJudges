Const
  inf=1<<29;
  
Type
  int=longint;
  point=^link;
  link=record
    id,c,w:int;
    o,next:point;
  end;
  
Var
  b,a:Array[0..101,0..101] of int;
  n,m,k,nn,st,fn,ans:int;
  e,path:Array[0..10010] of point;
  d,pre,q:Array[0..10010] of int;
  v:Array[0..10010] of boolean;

Procedure add(x,y,c,z:int);
var
  p,q:point;
begin
  new(p);new(q);
  p^.id:=y;p^.w:=z;p^.c:=c;p^.o:=q;p^.next:=e[x];e[x]:=p;
  q^.id:=x;q^.w:=-z;q^.c:=0;q^.o:=p;q^.next:=e[y];e[y]:=q;
end;

Function spfa:boolean;
var
  p:point;
  i,h,t:int;
begin
  fillchar(v,sizeof(v),false);v[st]:=true;
  for i:=st to fn do begin
    d[i]:=inf;pre[i]:=-1;
  end;
  h:=0;t:=1;q[h]:=st;d[st]:=0;
  while h<>t do begin
    p:=e[q[h]];
    while p<>nil do begin
      if (p^.c>0)and(d[p^.id]>d[q[h]]+p^.w) then begin
        d[p^.id]:=d[q[h]]+p^.w;
        pre[p^.id]:=q[h];path[p^.id]:=p;
        if not(v[p^.id]) then begin
          q[t]:=p^.id;t:=(t+1) mod 10010;
          v[p^.id]:=true;
        end;
      end;
      p:=p^.next;
    end;
    v[q[h]]:=false;h:=(h+1) mod 10010;
  end;
  exit(d[fn]<>inf);
end;

procedure change;
var 
  i,min:longint;
begin
  i:=fn;min:=inf;
  repeat
    if path[i]^.c<min then min:=path[i]^.c;
    i:=pre[i];
  until i=st;
  i:=fn;
  repeat
    dec(path[i]^.c,min);
    inc(path[i]^.o^.c,min);
    i:=pre[i];
  until i=st;
  inc(ans,d[fn]*min);
end;

Procedure init;
var
  i,j,t:int;
begin
  readln(k,m,n);t:=0;
  for i:=1 to n do begin
    for j:=1 to m do begin
      read(a[i,j]);inc(t);b[i,j]:=t;
    end;
    readln;
  end;
  st:=0;fn:=10005;
  nn:=b[n,m];
  add(st,b[1,1],k,0);add(b[n,m]+nn,fn,k,0);
  for i:=1 to n do begin 
    for j:=1 to m do begin
      add(b[i,j],b[i,j]+nn,inf,0);add(b[i,j],b[i,j]+nn,1,-a[i,j]);
    end;
  end;
  for i:=1 to n do begin
    for j:=1 to m do begin
      if i+1<=n then add(b[i,j]+nn,b[i+1,j],inf,0);
      if j+1<=m then add(b[i,j]+nn,b[i,j+1],inf,0);
    end;
  end;
end;

Procedure main;
begin
  ans:=0;
  while spfa do change;
  writeln(-ans);
end;

Begin
  init;
  main;
end.