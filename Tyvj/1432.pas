Const
  inf=1<<29;
  maxn=210000;

Type
  int=longint;

Var
  c,a,f1,f2,f3,f4:Array[0..maxn] of int;
  n,i:int;
  ans1,ans2:int64;

Function lowbit(x:int):int;
begin
  exit(x and(-x));
end;

Procedure change(i,dlt:int);
begin
  while i<=n do begin
    inc(c[i],dlt);
    inc(i,lowbit(i));
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

Begin
  readln(n);
  for i:=1 to n do read(a[i]);
  for i:=1 to n do begin
    f1[i]:=getsum(a[i]-1);
    change(a[i],1);
  end;
  for i:=1 to n do f2[i]:=getsum(a[i]-1)-f1[i];
  fillchar(c,sizeof(c),0);
  for i:=1 to n do begin
    f3[i]:=getsum(n)-getsum(a[i]);
    change(a[i],1);
  end;
  for i:=1 to n do f4[i]:=getsum(n)-getsum(a[i])-f3[i];
  ans1:=0;ans2:=0;
  for i:=2 to n-1 do begin
    inc(ans1,(f3[i])*f4[i]);
    inc(ans2,(f1[i])*f2[i]);
  end;
  writeln(ans1,' ',ans2);
end.
