//URAL 1019 Line Painting
//给定一个长度10^9的线段，首先全染成白色，之后进行n(n<=5000)次染色，染色只有黑白两种。求最终剩下的白色最长一段的左右坐标。
//首先离散化，进行排序，然后用线段树维护，最后染出离散化后每一个段的颜色，对于每一块白色进行二分扫描即可。
//4104153 13:00:513 Feb 2012 ToJaRa 1019. Line Painting Pascal Accepted 0.031s 830 KB 

Program ural1019;

Const
  inf=1<<29;
  maxn=5001;

Type
  int=longint;

Var
  mid,l,r,c:Array[0..maxn*20] of int;
  dis,mark,he:Array[0..maxn*2+2] of int;
  x,y:Array[0..maxn] of int;
  col:Array[0..maxn] of int;
  n,i:int;

Procedure sort(l,r:int);
var
  i,j,mid,t:int;
begin
  i:=l;j:=r;mid:=dis[(l+r)>>1];
  repeat
    while dis[i]<mid do inc(i);
    while dis[j]>mid do dec(j);
    if i<=j then begin
      t:=dis[i];dis[i]:=dis[j];dis[j]:=t;
      inc(i);dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
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

Procedure init_discrete;
var
  i,j:int;
  ch:char;
begin
  readln(n);
  x[1]:=0;y[1]:=1000000000;col[1]:=1;
  dis[1]:=0;dis[2]:=1000000000;
  inc(n);
  for i:=2 to n do begin
    readln(x[i],y[i],ch,ch);
    if ch='b' then col[i]:=0 else col[i]:=1;
    dis[i<<1]:=x[i];dis[i<<1-1]:=y[i];
  end;
  sort(1,n<<1);
  mark[1]:=1;
  for i:=2 to n<<1 do
    if dis[i]<>dis[i-1]
      then mark[i]:=mark[i-1]+1
      else mark[i]:=mark[i-1];
  for i:=1 to n do begin
    x[i]:=mark[find(x[i])];y[i]:=mark[find(y[i])];
  end;
end;

Procedure build(x,lf,rt:int);
begin
  l[x]:=lf;r[x]:=rt;mid[x]:=(l[x]+r[x])>>1;
  if lf=rt then exit;
  build(x<<1,lf,mid[x]);
  build(x<<1 or 1,mid[x]+1,rt);
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
  if (c[x<<1]=-1)or(c[x<<1]=-1) then c[x]:=-1
  else if c[x<<1]=c[x<<1 or 1] then c[x]:=c[x<<1]
  else c[x]:=-1;
end;

Procedure add(x,lf,rt,color:int);
begin
  if (lf<=l[x])and(r[x]<=rt) then begin
    c[x]:=color;exit;
  end;
  infosub(x);
  if lf<=mid[x] then add(x<<1,lf,rt,color);
  if mid[x]<rt then add(x<<1 or 1 ,lf,rt,color);
  update(x);
end;

Procedure check(x:int);
var
  i:int;
begin
  if c[x]>=0 then begin
    for i:=l[x] to r[x] do he[i]:=c[x];
    exit;
  end;
  check(x<<1);check(x<<1 or 1);
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

Procedure main;
var
  i,k,t,ans,ansl,ansr:int;
begin
  c[1]:=1;
  for i:=1 to n do add(1,x[i],y[i]-1,col[i]);
  check(1);
  i:=1;while he[i]=0 do inc(i);ans:=0;he[n<<1 or 1]:=0;
  while i<n<<1 do begin
    k:=i;
    while (he[k]=1)and(k<n<<1) do inc(k);dec(k);
    t:=dis[f2(k+1)]-dis[f2(i)];
    if t>ans then begin
      ansl:=dis[f2(i)];ansr:=dis[f2(k+1)];ans:=t;
    end;
    i:=k+1;
    while (he[i]=0)and(i<n<<1) do inc(i);
  end;
  writeln(ansl,' ',ansr);
end;

Begin
  init_discrete;
  build(1,1,n*2);
  main;
end.