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
  e:Array[0..101] of point;
  d:Array[0..101] of int;
  v:Array[0..101] of boolean;
  q:Array[0..101] of int;
  f:Array[0..300] of int;
  s:string;
  n,m:int;

Function max(x,y:int):int;
begin
  if x>y then exit(x);exit(y);
end;

Procedure add(x,y,z:int);
var
  p:point;
begin
  new(p);
  p^.id:=y;p^.v:=z;p^.next:=e[x];e[x]:=p;
end;
  
Function dp(s:string):int;
var
  i,j:int;
  flag:boolean;
begin
  flag:=true;
  if (s[1] in ['0'..'9']) then begin val(s,i);exit(i); end;
  if s='memory' then exit(0);
  if pos('memory',s)>0 then exit(1);
  f[1]:=1;
  for i:=2 to length(s) do begin
    f[i]:=1;
    for j:=1 to i-1 do
      if s[j]<s[i] then f[i]:=max(f[i],f[j]+1);
    if f[i]>6 then exit(2);
  end;
  exit(length(s));
end;
  
Procedure init;
var
  i,x,y,z:int;
  ch:char;
begin
  readln(n,m);
  for i:=1 to m do begin
    read(x,y,ch,s);z:=dp(s);
    //writeln(z);
    add(x,y,z);add(y,x,z);
  end;
end;

Procedure main;
var
  h,t,i:int;
  p:point;
begin
  h:=0;t:=1;q[h]:=1;
  fillchar(v,sizeof(v),false);v[1]:=true;
  for i:=1 to n do d[i]:=inf;d[1]:=0;
  while h<>t do begin
    p:=e[q[h]];
    while p<>nil do begin
      if d[p^.id]>d[q[h]]+p^.v then begin
        d[p^.id]:=d[q[h]]+p^.v;
        if not(v[p^.id]) then begin
          q[t]:=p^.id;v[q[t]]:=true;
          t:=(t+1) mod n;
        end;
      end;
      p:=p^.next;
    end;
    v[q[h]]:=false;h:=(h+1) mod n;
  end;
end;

Begin
  init;
  main;
  writeln(d[n]);
End.