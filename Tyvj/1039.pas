//TYVJ 1039 忠诚2
//给定一个10w长度的区间，支持两种操作，修改某点的值，查询某区间的最小值
//裸线段树。
//R766363 Accepted From jnlth941028 P1039.pas 100 / 245ms2012-2-4 11:15:46

Const
  inf=1<<29;

Type
  int=longint;

Var
  l,r,min,mid:Array[0..2000000] of int;
  m,n:int;

Function mn(x,y:int):int;
begin
  if x<y then exit(x);exit(y);
end;

Procedure update(x:int);
begin
  min[x]:=mn(min[x<<1],min[x<<1 or 1]);
end;

Procedure build(x,lf,rt:int);
begin
  l[x]:=lf;r[x]:=rt;mid[x]:=(l[x]+r[x])>>1;
  if lf=rt then begin
    read(min[x]);exit;
  end;
  build(x<<1,lf,mid[x]);
  build(x<<1 or 1,mid[x]+1,rt);
  update(x);
end;

Procedure change(x,xy,col:int);
begin
  if l[x]=r[x] then begin
    min[x]:=col;exit;
  end;
  if (l[x]<=xy)and(xy<=mid[x]) then change(x<<1,xy,col);
  if (mid[x]+1<=xy)and(xy<=r[x]) then change(x<<1 or 1,xy,col);
  update(x);
end;

Function ask(x,lf,rt:int):int;
var
  op:int;
begin
  //writeln('Asking ',l[x],' ',r[x],' ',min[x]);
  if (lf<=l[x])and(r[x]<=rt) then exit(min[x]);
  op:=inf;
  if lf<=mid[x] then op:=mn(op,ask(x<<1,lf,rt));
  if mid[x]<rt then op:=mn(op,ask(x<<1 or 1,lf,rt));
  exit(op);
end;

Procedure solve;
var
  i,x,y,c,t:int;
begin
  for i:=1 to m do begin
    read(t);
    if t=1 then begin readln(x,y);writeln(ask(1,x,y));end
    else begin readln(x,c);change(1,x,c);end;
  end;
end;

Begin
  readln(n,m);
  build(1,1,n);
  solve;
end.