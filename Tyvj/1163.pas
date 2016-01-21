Const
  inf=1<<29;

Type
  int=longint;
  point=^link;
  link=record
    id,v:int;
    next:point;
  end;

Var
  e:Array[0..1111] of point;
  d:Array[0..1111] of int;
  v:Array[0..1111] of boolean;
  q:Array[0..111100] of int;
  n,p,k,maxv,ans:int;

Procedure add(x,y,z:int);
var
  p:point;
begin
  new(p);
  p^.id:=y;p^.v:=z;p^.next:=e[x];
  e[x]:=p;
end;

Function spfa(x:int):boolean;
forward;

Procedure init;
var
  i,x,y,z:int;
begin
  readln(n,p,k);maxv:=-inf;writeln(stderr,n,' ',p,' ',k);
  for i:=1 to p do begin
    read(x,y,z);add(x,y,z);add(y,x,z);
    writeln(stderr,x,' ',y,' ',z);
    if z>maxv then maxv:=z;
  end;
  if spfa(0) then begin
    writeln(0);
    writeln(stderr,0);
    halt;
  end;
end;

Function spfa(x:int):boolean;
var
  l,r,i,di:int;
  p:point;
begin
  fillchar(v,sizeof(v),false);v[1]:=true;
  for i:=0 to n do d[i]:=inf;d[1]:=0;
  l:=0;r:=1;q[l]:=1;
  while l<>r do begin
    p:=e[q[l]];
    while p<>nil do begin
      di:=p^.v;
      if di>x then di:=1 else di:=0;
      if d[p^.id]>d[q[l]]+di then begin
        d[p^.id]:=d[q[l]]+di;
        if not(v[p^.id]) then begin
          q[r]:=p^.id;v[p^.id]:=true;
          r:=(r+1) mod n;
        end;
      end;
      p:=p^.next;
    end;
    v[q[l]]:=false;l:=(l+1) mod n;
  end;
  if d[n]=d[0] then begin
    writeln(-1);
    writeln(stderr,-1);
    halt;
  end;
  if d[n]>k then exit(false) else exit(true);
end;

Function find(l,r:int):int;
var
  mid:int;
begin
  if l=r then exit(l);
  mid:=(l+r)>>1;
  if spfa(mid) then exit(find(l,mid));
  exit(find(mid+1,r));
end;

Procedure main;
begin
  ans:=find(1,maxv);
  writeln(ans);
  writeln(stderr,ans);
end;

Begin
  init;
  main;
End.
