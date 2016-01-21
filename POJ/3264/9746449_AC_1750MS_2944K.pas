Const
  inf=1<<29;
  
Type
  int=longint;
  
Var
  l,r,mn,mx:Array[0..300030] of int;
  n,m:int;
  
Function min(x,y:int):int;
begin if x<y then exit(x);exit(y);end;
Function max(x,y:int):int;
begin if x>y then exit(x);exit(y);end;

Procedure update(x:int);
begin
  mn[x]:=min(mn[x<<1],mn[x<<1 or 1]);
  mx[x]:=max(mx[x<<1],mx[x<<1 or 1]);
end;

Procedure build(x,lf,rt:int);
var
  mid,t:int;
begin
  l[x]:=lf;r[x]:=rt;
  if lf=rt then begin
    read(t);
    mn[x]:=t;mx[x]:=t;
    exit;
  end;
  mid:=(lf+rt)>>1;
  build(x<<1,lf,mid);
  build(x<<1 or 1,mid+1,rt);
  update(x);
end;

Function gmax(x,lf,rt:int):int;
var
  mid:int;
begin
  if (lf<=l[x])and(r[x]<=rt) then exit(mx[x]);
  mid:=(l[x]+r[x])>>1;gmax:=-inf;
  if lf<=mid then gmax:=max(gmax,gmax(x<<1,lf,rt));
  if mid<rt then gmax:=max(gmax,gmax(x<<1 or 1,lf,rt));
end;

Function gmin(x,lf,rt:int):int;
var
  mid:int;
begin
  if (lf<=l[x])and(r[x]<=rt) then exit(mn[x]);
  mid:=(l[x]+r[x])>>1;gmin:=inf;
  if lf<=mid then gmin:=min(gmin,gmin(x<<1,lf,rt));
  if mid<rt then gmin:=min(gmin,gmin(x<<1 or 1,lf,rt));
end;

Procedure solve;
var
  i,x,y:int;
begin
  for i:=1 to m do begin
    read(x,y);
    writeln(gmax(1,x,y)-gmin(1,x,y));
  end;
end;

Begin
   readln(n,m);
   build(1,1,n);
   solve;
end.
