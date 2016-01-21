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
  e,path:Array[0..1005] of point;
  pre,d,q:Array[0..1005] of int;
  v:Array[0..1005] of boolean;
  n,m,st,fn,ans:int;

Procedure add(x,y,c,z:int);
var
  p,q:point;
begin
  new(p);new(q);
  p^.id:=y;p^.o:=q;p^.c:=c;p^.w:=z;p^.next:=e[x];e[x]:=p;
  q^.id:=x;q^.o:=p;q^.c:=0;q^.w:=-z;q^.next:=e[y];e[y]:=q;
end;
  
Procedure init;
var
  i,x,y,z:int;
begin
  readln(n,m);
  for i:=1 to m do begin
    readln(x,y,z);
    add(x,y,1,z);add(y,x,1,z);
  end;
  st:=0;fn:=1000;
  add(st,1,2,0);add(n,fn,2,0);
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
          q[t]:=p^.id;t:=(t+1) mod n;
          v[p^.id]:=true;
        end;
      end;
      p:=p^.next;
    end;
    v[q[h]]:=false;h:=(h+1) mod n;
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

Procedure main;
begin
  ans:=0;
  while spfa do change;
  writeln(ans);
end;

Begin
  init;
  main;
end.