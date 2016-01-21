Const
  inf=1<<29;

Type
  int=longint;
  segment=record
    p,p1,p2,b:int;
  end;

Var
  c,l,r:Array[0..20001*32] of int;
  x1,x2,y1,y2:Array[0..5050] of int;
  seg:Array[0..5050*2] of segment;
  n,ans:int;

Procedure init;
var
  i:int;
begin
  readln(n);
  for i:=1 to n do begin
    readln(x1[i],y1[i],x2[i],y2[i]);
    inc(x1[i],10000);inc(x2[i],10000);inc(y1[i],10000);inc(y2[i],10000);
  end;
end;

Procedure swap(var x,y:segment);
var
  t:segment;
begin
  t:=x;x:=y;y:=t;
end;

Procedure sort(l,r:int);
var
  i,j,m1,m2:int;
begin
  i:=l;j:=r;m1:=seg[(l+r)>>1].p;m2:=seg[(l+r)>>1].b;
  repeat
    while (seg[i].p<m1)or(seg[i].p=m1)and(seg[i].b>m2) do inc(i);
    while (seg[j].p>m1)or(seg[j].p=m1)and(seg[j].b<m2) do dec(j);
    if i<=j then begin
      swap(seg[i],seg[j]);
      inc(i);dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

Procedure init1;
var
  i:int;
begin
  for i:=1 to n do begin
    with seg[i] do begin
      p:=y1[i];p1:=x1[i];p2:=x2[i];b:=1;
    end;
    with seg[i+n] do begin
      p:=y2[i];p1:=x1[i];p2:=x2[i];b:=-1;
    end;
  end;
  sort(1,n<<1);
end;

Procedure init2;
var
  i:int;
begin
  for i:=1 to n do begin
    with seg[i] do begin
      p:=x1[i];p1:=y1[i];p2:=y2[i];b:=1;
    end;
    with seg[i+n] do begin
      p:=x2[i];p1:=y1[i];p2:=y2[i];b:=-1;
    end;
  end;
  sort(1,n<<1);
end;

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

Procedure infosub(x:int);
begin
  if c[x]<>-inf then begin
    c[x<<1]:=c[x];
    c[x<<1 or 1]:=c[x];
    c[x]:=-inf;
  end;
end;

Function ask(x,lf,rt:int):int;
var
  mid,op:int;
begin
  if (lf<=l[x])and(r[x]<=rt) then begin
    if c[x]=1 then exit(r[x]-l[x]+1);
    if c[x]<>-inf then exit(0);
    exit(ask(x<<1,lf,rt)+ask(x<<1 or 1,lf,rt));
  end;
  infosub(x);
  mid:=(l[x]+r[x])>>1;
  op:=0;
  if lf<=mid then inc(op,ask(x<<1,lf,rt));
  if mid<rt then inc(op,ask(x<<1 or 1,lf,rt));
  exit(op);
end;

Procedure update(x:int);
begin 
  if c[x<<1]=c[x<<1 or 1] then c[x]:=c[x<<1]
  else if (c[x<<1]=-inf)or(c[x<<1 or 1]=-inf) then c[x]:=-inf
  else c[x]:=-inf;
end;

Procedure add(x,lf,rt,col:int);
var
  mid:int;
begin
  if (lf<=l[x])and(r[x]<=rt) then begin
    if (c[x]=-inf)and(l[x]<>r[x]) then begin
      add(x<<1,lf,rt,col);
      add(x<<1 or 1,lf,rt,col);
    end else inc(c[x],col);
    exit;
  end;
  infosub(x);
  mid:=(l[x]+r[x])>>1;
  if lf<=mid then add(x<<1,lf,rt,col);
  if mid<rt then add(x<<1 or 1,lf,rt,col);
  update(x);
end;

Procedure main;
var
  i:int;
begin
  for i:=1 to n<<1 do with seg[i] do begin
    if b<0 then inc(ans,ask(1,p1+1,p2));
    add(1,p1+1,p2,b);
  end;
end;

Begin
  ans:=0;
  init;
  init1;build(1,1,20001);main;
  init2;build(1,1,20001);main;
  writeln(ans<<1);
end.
