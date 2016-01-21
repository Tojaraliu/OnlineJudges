{
设dis[i]表示i点在当前攻占局面下的最小距离，每次攻占一个城市之后，就从他开始做一次SPFA，向外扩展，如果长度超过k，则不更改答案。
这样单次扩展的复杂度就是k，总复杂度为O(kn)。
}

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
  e:Array[0..11111] of point;
  dis,q:Array[0..11111] of int;
  v:Array[0..10101] of boolean;
  n,m,a,k,ans:int;
  
Procedure add(x,y,z:int);
var
  p:point;
begin
  new(p);
  p^.id:=y;p^.v:=z;p^.next:=e[x];e[x]:=p;
end;

Procedure init;
var
  i,j,x,y,z:int;
begin
  readln(n,m,a,k);
  for i:=1 to m do begin
    readln(x,y,z);
    add(x,y,z);add(y,x,z);
  end;
end;

Procedure flood(x:int);
var
  i,j,h,t:int;
  p:point;
begin
  if dis[x]>=k then dec(ans);
  dis[x]:=0;
  fillchar(v,sizeof(v),false);v[x]:=true;
  h:=0;t:=1;q[h]:=x;
  while h<>t do begin
    p:=e[q[h]];
    while p<>nil do begin
      if dis[p^.id]>dis[q[h]]+p^.v then begin
        if (dis[p^.id]>=k)and((dis[q[h]]+p^.v)<k) then dec(ans);
        dis[p^.id]:=dis[q[h]]+p^.v;
        if not(v[p^.id]) then begin
          v[p^.id]:=true;
          q[t]:=p^.id;
          t:=(t+1) mod 10101;
        end;
      end;
      p:=p^.next;
    end;
    v[q[h]]:=false;h:=(h+1) mod 10101;
  end;
end;

Procedure main;
var
  i,j:int;
begin
  fillchar(dis,sizeof(dis),63);
  ans:=n;
  for i:=1 to a do begin
    read(j);
    flood(j);
    writeln(ans);
  end;
end;

Begin
  init;
  main;
end.