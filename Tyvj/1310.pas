Const
  inf=1<<29;

Type
  int=longint;
  point=^edge;
  edge=record
    id,v:int;
    next:point;
  end;
  dist=Array[0..1500] of int;

Var
  ee:Array[0..1000000] of edge;
  e:Array[0..1500] of point;
  dxst,dxen,dmst,dmen,q:dist;
  v:Array[0..1500] of boolean;
  x1,y1,x2,y2,m,n,ne,ans:int;

Function max(x,y:int):int;
begin
  if x>y then exit(x);exit(y);
end;

Procedure add(x,y,z:int);
var
  p:point;
begin
  inc(ne);p:=@ee[ne];
  p^.id:=y;p^.v:=z;p^.next:=e[x];e[x]:=p;
end;

Procedure init;
var
  i,j,x,y,z:int;
begin
  readln(n,m,x1,y1,x2,y2);
  ne:=0;
  for i:=1 to m do begin
    readln(x,y,z);add(x,y,z);add(y,x,z);
  end;
end;

Procedure spfa(st:int;var d:dist);
var
  h,t,i:int;
  p:point;
begin
  h:=0;t:=1;q[h]:=st;
  fillchar(v,sizeof(v),false);v[q[h]]:=true;
  for i:=1 to n do d[i]:=inf;d[st]:=0;
  while h<>t do begin
    p:=e[q[h]];
    while p<>nil do begin
      if d[p^.id]>d[q[h]]+p^.v then begin
        d[p^.id]:=d[q[h]]+p^.v;
        if not(v[p^.id]) then begin
          q[t]:=p^.id;v[p^.id]:=true;
          t:=(t+1) mod n;
        end;
      end;
      p:=p^.next;
    end;
    v[q[h]]:=false;h:=(h+1) mod n;
  end;
end;

Procedure main;
var
  i,j:int;
begin
  ans:=0;
  for i:=1 to n do
    if ((dxst[i]+dxen[i])=dxst[y1])and((dmst[i]+dmen[i]=dmst[y2])) then
      for j:=1 to n do
        if ((dxst[j]+dxen[j])=dxst[y1])and((dmst[j]+dmen[j])=dmst[y2]) then
          ans:=max(ans,abs(dxst[i]-dxst[j]));
  writeln(ans);
end;

Begin
  init;
  spfa(x1,dxst);spfa(y1,dxen);spfa(x2,dmst);spfa(y2,dmen);
  main;
end.
