Const
  inf=1<<29;
  maxn=110000;

Type
  int=longint;

Var
  l,r,c:Array[0..maxn*10] of int;
  n,m:int;

Procedure build(x,lf,rt:int);
var
  mid:int;
begin
  l[x]:=lf;r[x]:=rt;c[x]:=0;
  if lf=rt then exit;
  mid:=(lf+rt)>>1;
  build(x<<1,lf,mid);
  build(x<<1 or 1,mid+1,rt);
end;

Procedure update(x:int);
begin
  if (c[x<<1]<>c[x<<1 or 1])or(c[x<<1 or 1]=-1)or(c[x<<1]=-1) then c[x]:=-1
  else c[x]:=c[x<<1];
end;

Procedure infosub(x:int);
begin
  if c[x]>0 then begin
    inc(c[x<<1],c[x]);
    inc(c[x<<1 or 1],c[x]);
    c[x]:=0;
  end;
end;

Procedure add(x,lf,rt:int);
var
  mid:int;
begin
  if (lf<=l[x])and(r[x]<=rt) then begin
    inc(c[x]);
    exit;
  end;
  infosub(x);
  mid:=(l[x]+r[x])>>1;
  if lf<=mid then add(x<<1,lf,rt);
  if mid<rt then add(x<<1 or 1,lf,rt);
end;

Function Check(x,t:int):int;
var
  mid:int;
begin
  if l[x]=r[x] then exit(c[x]);
  infosub(x);
  mid:=(l[x]+r[x])>>1;
  if t<=mid then check:=check(x<<1,t);
  if t>mid then check:=check(x<<1 or 1,t);
end;

Procedure main;
var
  i,opt,x,y:int;
begin
  for i:=1 to m do begin
    read(opt);
    case opt of
      1:begin
          readln(x,y);
          add(1,x,y);
        end;
      2:begin
          readln(x);
          writeln(check(1,x) mod 2);
        end;
    end;
  end;
end;

Begin
  read(n,m);
  build(1,1,n);
  main;
end.