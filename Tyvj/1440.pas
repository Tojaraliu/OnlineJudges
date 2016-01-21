Const
  inf=1<<29;
  
Type
  int=longint;
  
Var
  l,r:Array[0..32000] of int;
  c:Array[0..32000] of char;
  n:int;
  
Procedure update(x:int);
begin
  if c[x<<1]=c[x<<1 or 1] then c[x]:=c[x<<1]
  else c[x]:='F';
end;
  
Procedure build(x,lf,rt:int);
var
  mid:int;
begin
  l[x]:=lf;r[x]:=rt;
  if lf=rt then begin
    read(c[x]);
    if c[x]='0' then c[x]:='B' else c[x]:='I';
    exit;
  end;
  mid:=(lf+rt)>>1;
  build(x<<1,lf,mid);
  build(x<<1 or 1,mid+1,rt);
  update(x);
end;

Procedure fuck(x:int);
begin
  if l[x]=r[x] then begin write(c[x]);exit;end;
  fuck(x<<1);fuck(x<<1 or 1);
  write(c[x]);
end;

Begin
  readln(n);
  n:=1<<n;
  build(1,1,n);
  fuck(1);
end.