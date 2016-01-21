Const
  inf=1<<29;
  
Type
  int=longint;
  
Var
  l,r:Array[0..2000001] of int;
  add,sum:Array[0..2000001] of int64;
  a:Array[0..100001] of int64;
  n,m:int;

Procedure swap(var x,y:int);
var
  t:int;
begin
  t:=x;x:=y;y:=t;
end;
  
Procedure change(t:int;x:int64);
begin
  inc(add[t],x);
  inc(sum[t],x*int64(r[t]-l[t]+1));
end;

Procedure infosub(t:int);
begin
  if l[t]=r[t] then exit;
  if add[t]<>0 then begin
    change(t<<1,add[t]);
    change(t<<1+1,add[t]);
    add[t]:=0;
  end;
end;

Procedure upup(x,lf,rt:int;t:int64);
var
  mid:int;
begin
  if (lf<=l[x])and(r[x]<=rt) then begin
    change(x,t);exit;
  end;
  infosub(x);
  mid:=(l[x]+r[x])>>1;
  if lf<=mid then upup(x<<1,lf,rt,t);
  if rt>mid then upup(x<<1+1,lf,rt,t);
  sum[x]:=sum[x<<1]+sum[x<<1+1];
end;

Function ask(x,lf,rt:int):int64;
var
  mid:int;
begin
  if (lf<=l[x])and(r[x]<=rt) then exit(sum[x]);
  infosub(x);
  mid:=(l[x]+r[x])>>1;ask:=0;
  if lf<=mid then inc(ask,ask(x<<1,lf,rt));
  if rt>mid then inc(ask,ask(x<<1+1,lf,rt));
end;

Procedure build(x,lf,rt:int);
var
  mid:int;
begin
  l[x]:=lf;r[x]:=rt;add[x]:=0;
  if lf=rt then begin
    sum[x]:=a[l[x]];exit;
  end;
  mid:=(lf+rt)>>1;
  if lf<=mid then build(x<<1,lf,mid);
  if rt>mid then build(x<<1+1,mid+1,rt);
  sum[x]:=sum[x<<1]+sum[x<<1+1];
end;
 
Procedure init;
var
  i:int;
begin
  readln(n,m);
  for i:=1 to n do read(a[i]);readln;
  build(1,1,n);
end;

Procedure solve;
var
  i,x,y:int;
  z:int64;
  ch:char;
begin
  for i:=1 to m do begin
    read(ch);
    if ch='C' then begin
      readln(x,y,z);
      if x>y then swap(x,y);upup(1,x,y,z);
    end else begin
      readln(x,y);
      if x>y then swap(x,y);writeln(ask(1,x,y));
    end;
  end;
end;

Begin
  init;
  solve;
end.