Const
  inf=1<<29;
  
Type
  int=longint;
  
Var
  ls:Array[0..55555] of int;
  c:Array[0..55555] of int;
  n,m:int;

Function lowbit(x:int):int;
begin
  exit(x and (-x));
end;

Procedure change(x,dlt:int);
begin
  while x<=n+2 do begin
    inc(c[x],dlt);
    inc(x,lowbit(x));
  end;
end;

Function getsum(x:int):int;
begin
  getsum:=0;
  while x>0 do begin
    inc(getsum,c[x]);
    dec(x,lowbit(x));
  end;
end;

Procedure init;
begin
  readln(n,m);
  fillchar(c,sizeof(c),0);
  fillchar(ls,sizeof(ls),0);ls[0]:=0;
  change(1,1);change(n+2,1);
end;

Function f1(l,r,key:int):int;
var
  mid:int;
begin
  while l<>r do begin
    mid:=(l+r)>>1;
    if getsum(mid)<key then l:=mid+1 else r:=mid;
    if l=r then exit(l);
  end;
  exit(l);
end;

Function f2(l,r,key:int):int;
var
  mid:int;
begin
  while l<>r do begin
    mid:=(l+r)>>1;
    if getsum(mid)=key then l:=mid+1 else r:=mid;
    if l=r then exit(l);
  end;
  exit(l);
end;

Procedure work(x:int);
var
  i,t,k,ll,rr:int;
begin
  k:=getsum(x);
  if getsum(x-1)=k-1 then begin writeln(0);exit;end;
  ll:=f1(1,x-1,k);rr:=f2(x+1,n+2,k);
  writeln(rr-ll-1);
end;

Procedure main;
var
  i,j,t:int;
  ch:char;
begin
  for i:=1 to m do begin
    read(ch);
    case ch of
      'D':begin
        readln(t);
        inc(ls[0]);ls[ls[0]]:=t+1;
        change(t+1,1);
      end;
      'R':begin
        change(ls[ls[0]],-1);dec(ls[0]);
        readln;
      end;
      'Q':begin
        readln(t);
        work(t+1);
      end;
    end;
  end;
end;

Begin
  init;
  main;
end.