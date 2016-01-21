Const
  inf=1<<29;
  maxn=100000;

Type
  int=longint;
  point=record
    tag,mt,next:int;
  end;
  edge=record
    x,next:int;
  end;
  tbit=object
    size:int;
    c:Array[0..maxn+10] of int;
    a:Array[0..maxn+10] of boolean;
    Procedure reset(x:int);
    Procedure change(x:int);
    Function lowbit(x:int):int;
    Function getsum(x:int):int;
  end;

Function tbit.lowbit(x:int):int;
begin
  exit(x and (-x));
end;
Procedure tbit.reset(x:int);
begin
  size:=x;
  fillchar(c,sizeof(c),0);
end;
Procedure tbit.change(x:int);
var
  t:int;
begin
  if a[x] then t:=-1 else t:=1;
  a[x]:=not(a[x]);
  while x<=size do begin
    inc(c[x],t);
    inc(x,lowbit(x));
  end;
end;
Function tbit.getsum(x:int):int;
var
  op:int;
begin
  op:=0;
  while x>0 do begin
    inc(op,c[x]);
    dec(x,lowbit(x));
  end;
  exit(op);
end;

Var
  tr:tbit;
  v:Array[0..maxn+10] of boolean;
  e:Array[0..maxn*2+10] of edge;
  p:Array[0..maxn+20] of point;
  n,m,time,ne:int;

Procedure add(x,y:int);
begin
  e[ne].x:=y;
  e[ne].next:=p[x].next;
  p[x].next:=ne;
  inc(ne);
end;

Procedure dfs(x:int);
var
  pt:int;
begin
  v[x]:=true;
  p[x].mt:=time;
  pt:=p[x].next;
  while pt>=0 do begin
    if not(v[e[pt].x]) then dfs(e[pt].x);
    pt:=e[pt].next;
  end;
  //inc(time);
  p[x].tag:=time;
  inc(time);
end;

Procedure init;
var
  i,x,y:int;
begin
  readln(n);ne:=0;
  for i:=1 to n do p[i].next:=-1;
  for i:=1 to n-1 do begin
    readln(x,y);
    add(x,y);add(y,x);
  end;
  fillchar(tr.a,sizeof(tr.a),true);
  fillchar(v,sizeof(v),false);
  time:=1;
  dfs(1);
  tr.reset(n);
  for i:=1 to n do tr.c[i]:=tr.lowbit(i);
end;

Procedure solve;
var
  ch:char;
  t,i:int;
begin
  readln(m);
  for i:=1 to m do begin
    read(ch);readln(t);
    if ch='Q'
      then writeln(tr.getsum(p[t].tag)-tr.getsum(p[t].mt-1))
      else tr.change(p[t].tag);
  end;
end;

Begin
  init;
  solve;
end.
