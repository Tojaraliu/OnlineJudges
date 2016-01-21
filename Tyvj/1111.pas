Const
  inf=1<<29;
  
Type
  int=longint;
  point=^link;
  link=record
    id:int;
    next:point;
  end;
  
Var
  e:Array[0..300] of point;
  dfn,low,s:Array[0..300] of int;
  v:Array[0..300] of boolean;
  ans,top,n,time:int;
  
Function min(x,y:int):int;
begin
  if x<y then exit(x);exit(y);
end;

Procedure add(x,y:int);
var
  p:point;
begin
  new(p);
  p^.id:=y;p^.next:=e[x];e[x]:=p;
end;

Procedure init;
var
  i,j,x,t:int;
begin
  readln(n);
  top:=0;ans:=0;
  for i:=1 to n do begin
    read(t);
    while t<>0 do begin
      add(i,t);read(t);
    end;
    readln;
  end;
end;

Procedure tarjan(x:int);
var
  p:point;
  i,j:int;
begin
  inc(time);dfn[x]:=time;low[x]:=time;
  v[x]:=true;inc(top);s[top]:=x;
  p:=e[x];
  while p<>nil do begin
    if dfn[p^.id]=0 then begin
      tarjan(p^.id);
      low[x]:=min(low[x],low[p^.id]);
    end
    else if v[p^.id] then low[x]:=min(low[x],low[p^.id]);
    p:=p^.next;
  end;
  if dfn[x]=low[x] then begin
    j:=inf;
    inc(ans);
    while j<>x do begin
      j:=s[top];v[j]:=false;dec(top);
    end;
  end;
end;

Procedure main;
var
  i:int;
begin
  fillchar(dfn,sizeof(dfn),0);
  for i:=1 to n do 
    if dfn[i]=0 then tarjan(i);
  writeln(ans);
end;

Begin
  init;
  main;
end.  