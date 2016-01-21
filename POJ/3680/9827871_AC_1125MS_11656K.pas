Const
  inf=1<<29;
  maxn=500;
  
Type
  int=longint;
  point=^link;
  link=record
    id,c,w:int;
    o,next:point;
  end;
  
Var
  e,path:Array[0..maxn*10] of point;
  pre,d,q:Array[0..maxn*10] of int;
  v:Array[0..maxn*10] of boolean;
  st,fn,n,k,ans,cases,cc:int;
  dis,mark,x,y,a,b,len:Array[0..maxn*10] of int;

Procedure sort(l,r:int);
var
  i,j,m,t:int;
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
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

Procedure add(x,y,c,z:longint); 
var 
  p,q:point;
begin
  new(p);new(q);
  p^.id:=y;p^.w:=z;p^.c:=c;p^.o:=q;p^.next:=e[x];e[x]:=p;
  q^.id:=x;q^.w:=-z;q^.c:=0;q^.o:=p;q^.next:=e[y];e[y]:=q;
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

Procedure init;
var
  i:int;
begin
  readln(n,k);
  for i:=1 to n do begin
    readln(x[i],y[i],len[i]);
    dis[i<<1-1]:=x[i];dis[i<<1]:=y[i];
  end;
  sort(1,n<<1);
  mark[0]:=0;dis[0]:=-inf;
  for i:=1 to n<<1 do
    if dis[i]=dis[i-1] then mark[i]:=mark[i-1] else mark[i]:=mark[i-1]+1;
  for i:=1 to n do begin
    a[i]:=mark[find(x[i])];b[i]:=mark[find(y[i])];
  end;
end;

Procedure initgraph;
var
  i:int;
begin
  fillchar(e,sizeof(e),0);
  st:=0;fn:=n+n+1;
  add(st,1,k,0);add(mark[n<<1],fn,k,0);
  for i:=1 to (n<<1)-1 do add(i,i+1,inf,0);
  for i:=1 to n do add(a[i],b[i],1,-len[i]);
end;

Function spfa:boolean;
var
  p:point;
  i,h,t,nn:int;
begin
  fillchar(v,sizeof(v),false);v[st]:=true;nn:=maxn*10;
  for i:=st to fn do begin
    d[i]:=inf;pre[i]:=-1;
  end;
  h:=0;t:=1;q[h]:=st;d[st]:=0;
  while h<>t do begin
    p:=e[q[h]];
    while p<>nil do begin
      if (p^.c>0)and(d[p^.id]>d[q[h]]+p^.w) then begin
        d[p^.id]:=d[q[h]]+p^.w;
        pre[p^.id]:=q[h];path[p^.id]:=p;
        if not(v[p^.id]) then begin
          q[t]:=p^.id;t:=(t+1) mod nn;
          v[p^.id]:=true;
        end;
      end;
      p:=p^.next;
    end;
    v[q[h]]:=false;h:=(h+1) mod nn;
  end;
  exit(d[fn]<>inf);
end;

procedure change;
var 
  i,min:longint;
begin
  i:=fn;min:=inf;
  repeat
    if path[i]^.c<min then min:=path[i]^.c;
    i:=pre[i];
  until i=st;
  i:=fn;
  repeat
    dec(path[i]^.c,min);
    inc(path[i]^.o^.c,min);
    i:=pre[i];
  until i=st;
  inc(ans,d[fn]*min);
end;

Procedure main;
begin
  ans:=0;
  while spfa do change;
  writeln(-ans);
end;

Begin
  readln(cases);
  for cc:=1 to cases do begin
    init;
    initgraph;
    main;
  end;
end.