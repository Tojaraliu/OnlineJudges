Type
  int=longint;

Var
  st,en,w,fa:Array[0..100001] of int;
  p:Array[0..10001] of int;
  n,m,ans,ing:int;

Procedure swap(var x,y:int);
var
  t:int;
begin
  t:=x;x:=y;y:=t;
end;

Procedure qsort(l,r:int);
var
  i,j,mid:int;
begin
  i:=l;j:=r;mid:=w[(l+r)>>1];
  repeat
    while w[i]<mid do inc(i);
    while w[j]>mid do dec(j);
    if i<=j then begin
      swap(w[i],w[j]);swap(st[i],st[j]);swap(en[i],en[j]);
      inc(i);dec(j);
    end;
  until i>j;
  if i<r then qsort(i,r);
  if l<j then qsort(l,j);
end;

Procedure init;
var
  i,x,y,z:int;
begin
  readln(n,m);
  for i:=1 to n do read(p[i]);
  for i:=1 to m do begin
    read(st[i],en[i],w[i]);
    w[i]:=p[st[i]]+p[en[i]]+w[i]<<1;
  end;
  qsort(1,m);
end;

Function find(x:int):int;
begin
  if fa[x]=x then exit(x);
  fa[x]:=find(fa[x]);
  exit(fa[x]);
end;

Procedure union(x,y:int);
begin
  fa[find(x)]:=find(fa[y]);
end;

Procedure main;
var
  i,min:int;
begin
  ing:=1;ans:=0;i:=0;
  for i:=1 to n do fa[i]:=i;i:=0;
  while ing<n do begin
    inc(i);
    if find(st[i])<>find(en[i]) then begin
      inc(ing);inc(ans,w[i]);union(st[i],en[i]);
    end;
  end;
  min:=1<<29;
  for i:=1 to n do if p[i]<min then min:=p[i];
  inc(ans,min);
end;

Begin
  init;
  main;
  writeln(ans);
End.
