Const
  inf=1<<29;
  maxn=20000;
  
Type
  int=longint;
  cow=record
    v,x:int;
  end;
  tbit=object
    size:int;
    c:Array[0..maxn+10] of int;
    a:Array[0..maxn+10] of boolean;
    Procedure reset(x:int);
    Procedure change(x,del:int);
    Function lowbit(x:int):int;
    Function gs(x:int):int;
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
Procedure tbit.change(x,del:int);
begin
  while x<=size do begin
    inc(c[x],del);
    inc(x,lowbit(x));
  end;
end;
Function tbit.gs(x:int):int;
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
  count,tot:tbit;
  s:Array[0..maxn+10] of cow;
  n:int;
  k,ans:qword;
  
Procedure swap(var x,y:cow);
var
  t:cow;
begin
  t:=x;x:=y;y:=t;
end;
  
Procedure init;
var
  i,mv,mx:int;
begin
  readln(n);mv:=-inf;mx:=-inf;
  for i:=1 to n do with s[i] do begin
    read(v,x);
    if v>mv then mv:=v;
    if x>mx then mx:=x;
  end;
  count.reset(maxn);tot.reset(maxn);
end;

Procedure sort(l,r:int);
var
  mid,i,j:int;
begin
  i:=l;j:=r;mid:=s[(l+r)>>1].v;
  repeat
    while (s[i].v<mid) do inc(i);
    while (s[j].v>mid) do dec(j);
    if i<=j then begin
      swap(s[i],s[j]);
      inc(i);dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

Function cal(i,x:int):int;
begin
  exit(int64(s[i].v)*( (count.gs(x) * s[i].x - tot.gs(x)) + (k - tot.gs(x) - (i - count.gs(x) - 1) * x)));
end;

Procedure main;
var
  i,t:int;
begin
  ans:=0;k:=0;
  for i:=1 to n do begin
    t:=s[i].x;
    inc(ans,cal(i,t));
    count.change(t,1);tot.change(t,t);
    inc(k,t);
  end;
  writeln(ans);
end;

Begin
  init;
  sort(1,n);
  main;
end.