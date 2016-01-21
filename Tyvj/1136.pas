{
设f[i,j]表示以i,j为右下角，最大的太极图的边长。
如果a[i,j-1]是1，那么f[i,j]就是1。
转移的条件是(f[i-1,j]=f[i,j-1])and(a[i-f[i-1,j],j-f[i,j-1]-1]=1)
第一部分，表示的是这个点能继承他的上方和左方。由于此时他已经可以继承他的上方和左方，则此时不能确定的是最左上角那个点，如果这个点是1，那么就可以确定他可以继承了。f[i,j]=f[i-1,j]+1
10/25/2012
}

Const
  inf=1<<29;

Type
  int=longint;

Var
  f,a:Array[0..1011,0..1011] of int;
  n,m,ans,i,j,t:int;

Function max(x,y:int):int;
begin
  if x>y then exit(x);exit(y);
end;

Begin
  readln(n,m);
  for i:=1 to n do
    for j:=1 to m do read(a[i,j]);
  ans:=0;
  for i:=1 to n do
    for j:=1 to m do begin
      if a[i,j]=1 then begin f[i,j]:=0;continue;end;
      if (f[i-1,j]=f[i,j-1])and(a[i-f[i-1,j],j-f[i,j-1]-1]=1) then f[i,j]:=f[i-1,j]+1;
      if (a[i,j-1]=1) then f[i,j]:=1;
      ans:=max(ans,f[i,j]);
    end;
  writeln(ans);
end.
