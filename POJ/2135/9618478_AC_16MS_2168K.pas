const maxn=1023; inf=1<<29;
type point=^node;
  node=record
    id,c,w:longint;
    next,o:point;
  end;
var st,fn,ans:longint;
  e,path:array[0..maxn]of point;
  pre,d:array[0..maxn]of longint;
  v:array[0..maxn]of boolean;
  q:array[0..maxn]of longint;
procedure add(x,y,z,c:longint);
  var p,q:point;
  begin
    new(p); new(q);
    p^.id:=y; q^.id:=x;
    p^.w:=c; q^.w:=-c;
    p^.c:=z; q^.c:=0;
    p^.o:=q; q^.o:=p;
    p^.next:=e[x]; q^.next:=e[y];
    e[x]:=p; e[y]:=q;
  end;
procedure init;
  var n,m,i,x,y,z,c:longint;
  begin
    readln(n,m);
    st:=0; fn:=n+1;
    for i:=1 to m do begin
      read(x,y,c);
      add(x,y,1,c);
      add(y,x,1,c);
    end;
    add(st,1,2,0);
    add(n,fn,2,0);
  end;
function spfa:boolean;
  var p:point; i,h,t:longint;
  begin
    fillchar(v,sizeof(v),false);
    for i:=st to fn do begin
      d[i]:=inf; pre[i]:=-1;
    end;
    h:=0; t:=1; q[1]:=st; v[st]:=true; d[st]:=0;
    while h<>t do begin
      h:=(h+1) and maxn; p:=e[q[h]]; v[q[h]]:=false;
      while p<>nil do with p^ do begin
        if (c>0)and(d[id]>d[q[h]]+w) then begin
          d[id]:=d[q[h]]+w;
          pre[id]:=q[h]; path[id]:=p;
          if not v[id] then begin
            t:=(t+1) and maxn; q[t]:=id; v[id]:=true;
          end;
        end;
        p:=next;
      end;
    end;
    exit(d[fn]<>inf);
  end;
procedure change;
  var i,min:longint;
  begin
    i:=fn; min:=inf;
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
begin
  init;
  ans:=0;
  while spfa do change;
  writeln(ans);
end.