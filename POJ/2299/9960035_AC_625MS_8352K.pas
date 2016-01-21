Const
  inf=1<<29;
  
Type
  int=longint;
  
Var
  c,a,dis,mark:Array[0..555555] of int;
  n,m,maxn:int;
  ans:int64;

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
  l:=1;r:=n;
  while l<>r do begin
    mid:=(l+r)>>1;
    if dis[mid]=x then exit(mid);
    if dis[mid]>x then r:=mid else l:=mid+1;
  end;
  exit(l);
end;

Procedure init;
var
  i:int;
begin
  for i:=1 to n do begin read(a[i]);dis[i]:=a[i];end;
  sort(1,n);
  mark[1]:=1;
  for i:=2 to n do
    if dis[i]=dis[i-1] then mark[i]:=mark[i-1] else mark[i]:=mark[i-1]+1;
  maxn:=mark[n];
  for i:=1 to n do a[i]:=mark[find(a[i])];
end;

Function lowbit(x:int):int;
begin
  exit(x and(-x));
end;

Procedure change(x,dlt:int);
begin
  while x<=maxn do begin
    inc(c[x],dlt);
    inc(x,lowbit(x));
  end;
end;

Function sum(x:int):int;
begin
  sum:=0;
  while x>0 do begin
    inc(sum,c[x]);
    dec(x,lowbit(x));
  end;
end;

Procedure main;
var
  i:int;
begin
  for i:=1 to n do begin
    inc(ans,int64(sum(maxn))-sum(a[i]));
    change(a[i],1);
  end;
  writeln(ans);
end;

Begin
  while true do begin
    read(n);if n=0 then halt;
    ans:=0;
    fillchar(c,sizeof(c),0);
    init;
    main;
  end;
end.