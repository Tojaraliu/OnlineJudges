//旅行商问题简化版
//tyvj P1186
//双线程DP，设f[i,j]表示一个线程到达了i，另一个到达了j，并且i~j这部分已经被比较靠前的一个走完了的最小代价，由于两个线程没有区别，所以只需要算i>j的状态即可。如果j=i-1，那么说明i的上一步一定是由2~i-2种的某一个推过来的，那么转移状态就是
//f[i,i-1]=min(f[k,i-1]+d[k,i]);
//如果不是，那么就是f[i,j]一定是由f[i-1,j]推过来。
//10/16/2012

Const
  inf=1<<29;
  
Type
  int=longint;
  
Var
  x,y:Array[0..3000] of extended;
  d,f:Array[0..2000,0..2000] of extended;
  n:int;
  
Function min(x,y:extended):extended;
begin
  if x<y then exit(x);exit(y);
end;
  
Procedure sort(l,r:int);
var
  i,j:int;
  t,mid:extended;
begin
  i:=l;j:=r;mid:=x[(l+r)>>1];
  repeat
    while x[i]<mid do inc(i);
    while x[j]>mid do dec(j);
    if i<=j then begin
      t:=x[i];x[i]:=x[j];x[j]:=t;
      t:=y[i];y[i]:=y[j];y[j]:=t;
      inc(i);dec(j);
    end;
  until i>j;
  if i<r then sort(i,r);
  if l<j then sort(l,j);
end;

Function cal(i,j:int):extended;
var
  op:extended;
begin
  op:=sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j]));
  exit(op);
end;

Procedure init;
var
  i,j:int;
begin
  readln(n);
  for i:=1 to n do begin
    readln(x[i],y[i]);
  end;
  sort(1,n);
  for i:=1 to n do
    for j:=1 to n do
      d[i,j]:=cal(i,j);
end;

Procedure main;
var
  i,j:int;
begin
  for i:=1 to n do for j:=1 to n do f[i,j]:=10000*maxlongint;
  f[1,1]:=0;
  for i:=1 to n do begin
    for j:=1 to i-2 do begin
      f[i,j]:=f[i-1,j]+d[i-1,i];
      f[j,i]:=f[i,j];
    end;
    f[i,i-1]:=f[i-1,1]+d[1,i];
    f[i-1,i]:=f[i,i-1];
    for j:=2 to i-2 do begin
      f[i,i-1]:=min(f[i,i-1],f[j,i-1]+d[j,i]);
      f[i-1,i]:=f[i,i-1];
    end;
  end;
  writeln(f[n,n-1]+d[n,n-1]:0:2);
end;

Begin
  init;
  main;
end.