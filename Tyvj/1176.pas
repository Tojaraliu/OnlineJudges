Const
  inf=1<<29;

Type
  int=longint;
  bool=boolean;
  point=^link;
  link=record
    id,v:int;
    next:point;
  end;

Var
  e:Array[0..50001] of point;
  ee:array[0..100001] of link;
  v:Array[0..50001] of bool;
  d:Array[0..50001] of int64;
  q:Array[0..50000] of int;
  ans,n,m,maxv,mid,l,r,ne:int;

Procedure add(x,y,z:int);
var
  p:point;
begin
  inc(ne);p:=@ee[ne];
  p^.id:=y;p^.v:=z;p^.next:=e[x];
  e[x]:=p;
end;

Procedure init;
var
  i,x,y,z:int;
begin
  readln(n,m);maxv:=0;
  for i:=1 to m do begin
    read(x,y,z);add(x,y,z);
    if z>maxv then maxv:=z;
  end;
end;

Function check(x:int):bool;
var
  i,h,t:int;
  p:point;
begin
  fillchar(v,sizeof(v),false);
  fillchar(d,sizeof(d),0);
  h:=0;t:=1;q[h]:=1;v[1]:=true;d[1]:=x;
  while h<>t do begin
    p:=e[q[h]];
    while p<>nil do begin
      if (d[p^.id]<((d[q[h]]<<1)+p^.v))and(((d[q[h]]<<1)+p^.v)>0) then begin
        if p^.id=n then exit(true);
        d[p^.id]:=(d[q[h]]<<1)+p^.v;
        if not(v[p^.id]) then begin
          q[t]:=p^.id;v[p^.id]:=true;
          if t=n then t:=0 else inc(t);
        end;
      end;
      p:=p^.next;
    end;
    v[q[h]]:=false;
    if h=n then h:=0 else inc(h);
  end;
  exit(false);
end;

Begin
  init;
  l:=1;r:=10000;
  while 0=0 do begin
    if l=r then break;
    mid:=(l+r)>>1;
    if check(mid) then r:=mid else l:=mid+1;
  end;
  writeln(l);
End.