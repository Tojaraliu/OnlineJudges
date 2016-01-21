Const
  inf=1<<29;
  inff=1<<60;
  maxn=50000;

Type
  int=longint;
  point=^link;
  link=record
    id,v:int;
    next:point;
  end;

Var
  cc,cases,n,m:int;
  e:Array[0..maxn+10] of point;
  v:Array[0..maxn+10] of boolean;
  q,w:Array[0..maxn+10] of int;
  d:Array[0..maxn+10] of qword;
  ans:qword;

Procedure add(x,y,z:int);
var
  p:point;
begin
  new(p);
  p^.id:=y;p^.v:=z;p^.next:=e[x];e[x]:=p;
end;

Procedure init;
var
  i,x,y,z:int;
begin
  fillchar(e,sizeof(e),0);
  readln(n,m);
  for i:=1 to n do read(w[i]);
  for i:=1 to m do begin
    readln(x,y,z);
    add(x,y,z);add(y,x,z);
  end;
end;

Procedure spfa;
var
  h,t,i:int;
  p:point;
begin
  h:=0;t:=1;q[h]:=1;
  for i:=1 to n do d[i]:=inff;d[1]:=0;
  fillchar(v,sizeof(v),0);v[1]:=true;
  while h<>t do begin
    p:=e[q[h]];
    while p<>nil do begin
      if d[p^.id]>d[q[h]]+p^.v then begin
        d[p^.id]:=d[q[h]]+p^.v;
        if not(v[p^.id]) then begin
          q[t]:=p^.id;v[p^.id]:=true;
          t:=(t+1) mod maxn;
        end;
      end;
      p:=p^.next;
    end;
    v[q[h]]:=false;h:=(h+1) mod maxn;
  end;
end;

Procedure main;
var
  i:int;
begin
  for i:=1 to n do
    if d[i]=inf then begin writeln('No Answer');exit;end;
  ans:=0;
  for i:=2 to n do inc(ans,d[i]*w[i]);
  writeln(ans);
end;

Begin
  readln(cases);
  for cc:=1 to cases do begin
    init;
    spfa;
    main;
  end;
End.
