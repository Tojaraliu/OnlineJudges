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
  a:Array[0..707] of int;
  d,q:Array[0..1000] of int;
  v:Array[0..800] of boolean;
  e:Array[0..800] of point;
  ee:Array[0..800*100] of link;
  n,ans1,ans2,sum,ne,suma:int;

Function getlen(i,j:int):int;
begin
  exit(((i*j)mod 10)+((i+j)mod 6) +1);
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
  i,j:int;
begin
  ne:=0;suma:=0;
  for i:=1 to n do begin a[i]:=((i-1) mod 10)+1;inc(suma,a[i]);end;
  for i:=1 to 5 do
    for j:=1 to 5 do add(i,j,getlen(i,j));
  for i:=6 to n do begin
    add(i,i-1,getlen(i,i-1));add(i-1,i,getlen(i-1,i));
    add(i,i-3,getlen(i,i-3));add(i-3,i,getlen(i-3,i));
  end;
end;

Procedure spfa(x:int);
var
  i,l,r:int;
  p:point;
begin
  l:=0;r:=1;q[l]:=x;
  for i:=1 to n do d[i]:=inf;
  fillchar(v,sizeof(v),false);
  d[x]:=0; v[x]:=true;
  while l<>r do begin
    p:=e[q[l]];
    while p<>nil do begin
      if d[p^.id]>d[q[l]]+p^.v then begin
        d[p^.id]:=d[q[l]]+p^.v;
        if not v[p^.id] then begin
          q[r]:=p^.id; v[p^.id]:=true;
          r:=(r+1) mod n;
        end;
      end;
      p:=p^.next;
    end;
    v[q[l]]:=false;l:=(l+1) mod n;
  end;
end;

Procedure main;
var
  i,j:int;
begin
  ans1:=inf+1000000;
  for i:=1 to n do begin
    spfa(i);sum:=0;
    for j:=1 to n do inc(sum,d[j]*a[j]);
    if sum<ans1 then begin ans1:=sum;ans2:=i;end;
  end;
  writeln(ans1+suma);writeln(ans2);
end;

Begin
  readln(n);
  init;
  main;
end.
