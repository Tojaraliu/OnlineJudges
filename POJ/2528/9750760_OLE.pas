Const
  inf=1<<29;
  maxn=20001;
  
Type
  int=longint;
  
Var
  l,r,mid:Array[0..maxn*20] of int;
  c,v:Array[0..maxn*20] of boolean;
  dis,b,x,y:Array[0..maxn*2] of int;
  n,cases,cc:int;
  
Procedure Sort(l,r:int);
var
  i,j,t,mid:int;
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

Procedure init;
var i:int;
begin
  fillchar(x,sizeof(x),0);fillchar(y,sizeof(y),0);
  fillchar(dis,sizeof(dis),0);fillchar(b,sizeof(b),0);
  fillchar(c,sizeof(c),false);
  readln(n);
  for i:=n downto 1 do begin readln(x[i],y[i]);inc(y[i]);end;
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

Procedure discrete;
var 
  i:int;
begin
  dis[0]:=-1;
  for i:=1 to n do begin
    dis[i<<1-1]:=x[i];dis[i<<1]:=y[i];
  end;
  Sort(1,n<<1);
  for i:=1 to n<<1 do
    if dis[i]=dis[i-1]
      then b[i]:=b[i-1]
      else b[i]:=b[i-1]+1;
    for i:=1 to n do begin 
      x[i]:=b[find(x[i])];y[i]:=b[find(y[i])];
      writeln;
    end;
end;

Procedure build(x,lf,rt:int);
begin
  l[x]:=lf;r[x]:=rt;mid[x]:=(lf+rt)>>1;
  if lf=rt then exit;
  build(x<<1,lf,mid[x]);
  build(x<<1 or 1,mid[x]+1,rt);
end;

Procedure add(x,lf,rt,col:int);
Begin
  if c[x] then exit;
  if (lf<=l[x])and(r[x]<=rt) then begin
    v[col]:=true;c[x]:=true;
    exit;
  end;
  if lf<=mid[x] then add(x<<1,lf,rt,col);
  if mid[x]<rt then add(x<<1 or 1,lf,rt,col);
  c[x]:=c[x<<1] and c[x<<1 or 1];
end;

Procedure main;
var
  i,ans:int;
begin
  fillchar(v,sizeof(v),false);ans:=0;
  for i:=1 to n do add(1,x[i],y[i]-1,i);
  for i:=1 to n do
    if v[i] then begin
      inc(ans);v[i]:=false;
    end;
  writeln(ans);
end;

Begin
  readln(cases);
  for cc:=1 to cases do begin
    init;
    discrete;
    build(1,1,n<<1);
    main;
  end;
end.