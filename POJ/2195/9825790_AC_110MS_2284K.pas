Const
  inf=1<<29;
  
Type
  int=longint;
  point=^link;
  link=record
    id,c,w:int;
    o,next:point;
  end;
  hehe=record
    x,y,id:int;
  end;
  
Var
  e,path:Array[0..255] of point;
  ee:Array[0..255] of link;
  v:Array[0..255] of boolean;
  pre,d,q:Array[0..255] of int;
  home,peo:Array[0..255] of hehe;
  n,m,hh,mm,ans,pp,fn,st:int;
  
Procedure add(x,y,c,z:longint); 
var 
  p,q:point;
begin
  new(p);new(q);
  //writeln(x,' ',y,' ',c,' ',z);
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
          q[t]:=p^.id;t:=(t+1) mod 255;
          v[p^.id]:=true;
        end;
      end;
      p:=p^.next;
    end;
    v[q[h]]:=false;h:=(h+1) mod 255;
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

Function dis(i,j:int):int;
begin
  //writeln(abs(home[i].x-peo[j].x));writeln(abs(home[i].y-peo[j].y));
  exit(abs(abs(home[i].x-peo[j].x)+abs(home[i].y-peo[j].y)));
end;

Procedure init;
var
  i,j:int;
  ch:char;
begin
  hh:=0;mm:=0;pp:=0;
  for i:=1 to n do begin
    for j:=1 to m do begin
      read(ch);
      if ch='H' then begin
        inc(hh);inc(pp);
        with home[hh] do begin
          x:=i;y:=j;id:=pp;
        end;
      end
      else 
      if ch='m' then begin
        inc(mm);inc(pp);
        with peo[mm] do begin
          x:=i;y:=j;id:=pp;
        end;
      end;
    end;
    readln;
  end;
  fillchar(e,sizeof(e),0);fillchar(ee,sizeof(ee),0);
  st:=0;fn:=254;
  for i:=1 to mm do add(st,peo[i].id,1,0);
  for i:=1 to hh do add(home[i].id,fn,1,0);
  for i:=1 to mm do
    for j:=1 to hh do add(peo[i].id,home[j].id,1,dis(i,j));
end;

Procedure main;
begin
  ans:=0;
  while spfa do change;
  writeln(ans);
end;

Begin
  while true do begin
    readln(n,m);
    if (n=0)and(m=0) then halt;
    init;
    main;
  end;
end.