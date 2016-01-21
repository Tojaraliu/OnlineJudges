Const
  fn='landcraft';
  inf=1<<29;
  maxn=3333;
  
Type
  int=longint;
  point=^link;
  link=record
    id,v:int;
    next:point;
  end;
  
Var
  e:Array[0..maxn] of point;
  dfn:Array[0..maxn,0..maxn] of int;
  bdfn,d,l:Array[0..maxn] of int;
  v:Array[0..maxn] of boolean;
  n,m:int;
  
Procedure opf;
begin
  Assign(input,fn+'.in');reset(input);
  Assign(output,fn+'.out');rewrite(output);
end;
  
Procedure add(x,y,z:int);
var
  p:point;
begin
  new(p);
  p^.id:=y;p^.v:=z;p^.next:=e[x];e[x]:=p;
end;

Function max(x,y:int):int;
begin
  if x>y then exit(x);exit(y);
end;

Procedure init;
var
  i,j,x,y,z,t,k:int;
begin
  readln(n,m);
  for i:=1 to m do begin
    readln(x,y,z);
    add(x,y,z);
  end;
  fillchar(dfn,sizeof(dfn),0);fillchar(bdfn,sizeof(bdfn),0);
  for i:=1 to n do begin
    read(k);bdfn[i]:=k;
    for j:=1 to k do begin
      read(t);
      inc(dfn[t,0]);dfn[t,dfn[t,0]]:=i;
    end;
  end;
end;

Procedure dij;
var
  i,j,minj,min:int;
  p:point;
begin
  for i:=1 to n do d[i]:=inf;
  d[1]:=0;
  for i:=1 to n do begin
    min:=inf;
    for j:=1 to n do
      if not(v[j])and(d[j]<min)and(bdfn[j]=0) then begin
        min:=d[j];minj:=j;
      end;
    l[minj]:=max(l[minj],d[minj]);
    d[minj]:=max(l[minj],d[minj]);
    v[minj]:=true;
    p:=e[minj];
    while p<>nil do begin
      if (d[minj]+p^.v<d[p^.id]) then d[p^.id]:=d[minj]+p^.v;
      p:=p^.next;
    end;
    for j:=1 to dfn[minj,0] do begin
      l[dfn[minj,j]]:=max(l[dfn[minj,j]],l[minj]);
      dec(bdfn[dfn[minj,j]]);
    end;
  end;
  writeln(l[n]);
end;

Begin
  opf;
  init;
  dij;
  close(output);
end.