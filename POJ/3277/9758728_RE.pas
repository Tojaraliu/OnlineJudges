Const
  inf=1<<29;
  maxn=40001;
  
Type
  int=longint;
  
Var
  l,r,mid,c:Array[0..maxn*10] of int;
  n,ans,ll,rr:int;
  
Procedure update(x:int);
begin
  if c[x<<1]=c[x<<1] then c[x]:=c[x<<1];
  if (c[x<<1]=-1)and(c[x<<1 or 1]=-1) then c[x]:=-1;
  c[x]:=-1;
end;

Procedure infosub(x:int);
begin
  if c[x]>=0 then begin
    c[x<<1]:=c[x];
    c[x<<1 or 1]:=c[x];
    c[x]:=-1;
  end;
end;

Procedure build(x,lf,rt:int);
begin
  l[x]:=lf;r[x]:=rt;mid[x]:=lf;c[x]:=0;
  if lf=rt then begin
    c[x]:=0;exit;
  end;
  mid[x]:=(l[x]+r[x])>>1;
  build(x<<1,l[x],mid[x]);
  build(x<<1 or 1,mid[x]+1,r[x]);
  update(x);
end;

Procedure add(x,lf,rt,col:int);
begin
  if (lf<=l[x])and(r[x]<=rt) then begin
    c[x]:=col;
    exit;
  end;
  infosub(x);
  if lf<=mid[x] then add(x<<1,lf,rt,col);
  if mid[x]<rt then add(x<<1 or 1,lf,rt,col);
  update(x);
end;

Procedure check(x:int);
begin
  if c[x]>=0 then begin
    inc(ans,c[x]*(r[x]-l[x]+1));
    exit;
  end;
  check(x<<1);
  check(x<<1 or 1);
end;

Procedure main;
var
  i,h:int;
begin
  ans:=0;
  for i:=1 to n do begin
    readln(ll,rr,h);
    add(1,ll,rr-1,h);
  end;
  check(1);
  writeln(ans);
end;

Begin
  readln(n);
  build(1,1,maxn);
  main;
End.