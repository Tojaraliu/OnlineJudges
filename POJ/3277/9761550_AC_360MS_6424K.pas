//POJ 3277 City Horizon
//有一个10^10长度的序列，给定n(n<=40000)个矩形的排列在这个线性表上，给定[x,y]坐标和高度(h<=10^10)。求覆盖之后的总面积。
//离散化+线段树。
//首先将端点离散，得到顺序dis和名次mark，之后按照所有矩形的
//9761530	tojara 3277	Accepted 6424K 329MS Pascal	3285B	2012-02-01 11:50:35

Const
  inf=1<<29;
  maxn=40001;
  
Type
  int=longint;
  
Var
  x,y,a,b,h:Array[0..maxn+100] of int;
  l,r,mid,c:Array[0..maxn*20] of int;
  mark,dis:Array[0..maxn*2+50] of int;
  n,temp:int;
  ans:int64;
  
Procedure swap(var x,y:int);
begin
  temp:=x;x:=y;y:=temp;
end;
  
Procedure Qh(l,r:int);
var
  i,j,m:int;
begin
  i:=l;j:=r;m:=h[(l+r)>>1];
  repeat
    while h[i]<m do inc(i);
    while h[j]>m do dec(j);
    if i<=j then begin
      swap(h[i],h[j]);swap(x[i],x[j]);swap(y[i],y[j]);
      inc(i);dec(j);
    end;
  until i>j;
  if l<j then Qh(l,j);
  if i<r then Qh(i,r);
end;
  
Procedure init;
var
  i:int;
begin
  readln(n);
  for i:=1 to n do begin
    read(x[i],y[i],h[i]);
    dis[i<<1]:=x[i];dis[i<<1-1]:=y[i];
  end;
  Qh(1,n);
end;

Procedure Q(l,r:int);
var
  m,i,j,t:int;
begin
  i:=l;j:=r;m:=dis[(l+r)>>1];
  repeat
    while dis[i]<m do inc(i);
    while dis[j]>m do dec(j);
    if i<=j then begin
      t:=dis[i];dis[i]:=dis[j];dis[j]:=t;
      inc(i);dec(j);
    end;
  until i>j;
  if l<j then Q(l,j);
  if i<r then Q(i,r);
end;

Function find(x:int):int;
var
  l,r,mid:int;
begin
  l:=1;r:=n<<1;
  while l<>r do begin
    mid:=(l+r)>>1;
    if dis[mid]=x then exit(mid);
    if dis[mid]>x then r:=mid else l:=mid+1;
  end;
  exit(l);
end;

Function f2(x:int):int;
var
  l,r,mid:int;
begin
  l:=1;r:=n<<1;
  while l<>r do begin
    mid:=(l+r)>>1;
    if mark[mid]=x then exit(mid);
    if mark[mid]>x then r:=mid else l:=mid+1;
  end;
  exit(l);
end;

Procedure discrete;
var
  i:int;
begin
  mark[0]:=0;dis[0]:=-inf;
  for i:=1 to n<<1 do 
    if dis[i]=dis[i-1]
      then mark[i]:=mark[i-1]
      else mark[i]:=mark[i-1]+1;//名次
  for i:=1 to n do begin
    a[i]:=mark[find(x[i])];b[i]:=mark[find(y[i])];
  end;
end;

Procedure infosub(x:int);
begin
  if c[x]>=0 then begin
    c[x<<1]:=c[x];
    c[x<<1 or 1]:=c[x];
    c[x]:=-1;
  end;
end;

Procedure update(x:int);
begin
  if (c[x<<1]=-1)or(c[x<<1 or 1]=-1) then c[x]:=-1
  else if c[x<<1]=c[x<<1 or 1] then c[x]:=c[x<<1]
  else c[x]:=-1;
end;

Procedure add(x,lf,rt,col:int);
begin
  if (lf<=l[x])and(r[x]<=rt) then begin
    //writeln('[',l[x],',',r[x],'] ',c[x],'->',col);
    c[x]:=col;exit;
  end;
  infosub(x);
  if lf<=mid[x] then add(x<<1,lf,rt,col);
  if mid[x]<rt then add(x<<1 or 1,lf,rt,col);
  update(x);
end;

Procedure check(x:int);
begin
  if c[x]>=0 then begin
    //writeln(int64(c[x])*(dis[f2(r[x]+1)]-dis[f2(l[x])]));
    inc(ans,int64(c[x])*(dis[f2(r[x]+1)]-dis[f2(l[x])]));
    exit;
  end;
  if l[x]=r[x] then exit;
  check(x<<1);check(x<<1 or 1);
end;

Procedure main;
var
  i:int;
begin
  {for i:=1 to n<<1 do write(dis[i]:4);
  writeln;
  for i:=1 to n<<1 do write(mark[i]:4);
  writeln;
  for i:=1 to n do writeln(x[i],'->',a[i],' ',y[i],'->',b[i]);}
  for i:=1 to n do begin
    add(1,a[i],b[i]-1,h[i]);
  end;
  ans:=0;
  check(1);
  writeln(ans);
end;

Procedure build(x,lf,rt:int);
begin
  l[x]:=lf;r[x]:=rt;mid[x]:=(lf+rt)>>1;
  c[x]:=0;
  if lf=rt then exit;
  build(x<<1,lf,mid[x]);
  build(x<<1 or 1,mid[x]+1,rt);
end;

Begin
  init;
  Q(1,n<<1);
  discrete;
  build(1,1,n<<1+1);
  main;
End.