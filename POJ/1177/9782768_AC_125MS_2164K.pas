Const
  inf=1<<29;
  
Type
  int=longint;
  segment=record
    p,p1,p2,b:int;
  end;

Var
  seg:Array[0..5050*2] of segment;
  x1,x2,y1,y2:Array[0..5050] of int;
  l,r,c,son:Array[0..1000000] of int;
  lc,rc,exist:Array[0..1000000] of boolean;
  n,len,lines,ans,last:int;

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
    while (seg[i].p<m1)or(seg[i].p=m1)and(seg[i].b<m2) do inc(i);
    while (seg[j].p>m1)or(seg[j].p=m1)and(seg[j].b>m2) do dec(j);
    if i<=j then begin
      swap(seg[i],seg[j]);
      inc(i);dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

Procedure build(x,lf,rt:int);
var
  mid:int;
begin
  l[x]:=lf;r[x]:=rt;
  if lf=rt then begin
    son[x]:=1;exit;
  end;
  mid:=(lf+rt)>>1;
  build(x<<1,lf,mid);
  build(x<<1 or 1,mid+1,rt);
  son[x]:=son[x<<1]+son[x<<1 or 1];
end;

Procedure init;
var
  i:int;
begin
  readln(n);
  for i:=1 to n do begin
    readln(x1[i],y1[i],x2[i],y2[i]);
    inc(x1[i],11000);inc(y1[i],11000);inc(x2[i],11000-1);inc(y2[i],11000-1);
  end;
  for i:=1 to n do begin
    with seg[i] do begin
      p:=y1[i];p1:=x1[i];p2:=x2[i];b:=0;
    end;
    with seg[i+n] do begin
      p:=y2[i]+1;p1:=x1[i];p2:=x2[i];b:=1;
    end;
  end;
  sort(1,n<<1);
  //for i:=1 to n<<1 do with seg[i] do writeln(p,' ',p1,' ',p2,' ',b);
end;

Procedure edit(x:int;a,b,c:boolean);
begin
  exist[x]:=a;lc[x]:=b;rc[x]:=c;
end;

Procedure infosub(x:int);
begin
  inc(c[x<<1],c[x]);inc(c[x<<1 or 1],c[x]);
  edit(x<<1,true,true,true);edit(x<<1 or 1,true,true,true);
  c[x]:=0;
end;

Procedure update(x:int);
begin
  if l[x]=r[x] then edit(x,false,false,false)
  else edit(x,exist[x<<1] or exist[x<<1 or 1],lc[x<<1],rc[x<<1 or 1]);
end;

Procedure add(x,lf,rt:int);
var
  mid:int;
begin
  if (lf<=l[x])and(r[x]<=rt) then begin
    inc(c[x]);edit(x,true,true,true);exit;
  end;
  if c[x]>0 then infosub(x);
  mid:=(l[x]+r[x])>>1;
  if lf<=mid then add(x<<1,lf,rt);
  if mid<rt then add(x<<1 or 1,lf,rt);
  update(x);
end;

Procedure del(x,lf,rt:int);
var
  mid:int;
begin
  if (lf<=l[x])and(r[x]<=rt)and(c[x]>0) then begin
    dec(c[x]);
    if c[x]=0 then update(x);
    exit;
  end;
  if c[x]>0 then infosub(x);
  mid:=(l[x]+r[x])>>1;
  if lf<=mid then del(x<<1,lf,rt);
  if mid<rt then del(x<<1 or 1,lf,rt);
  update(x);
end;

Procedure count(x:int);
begin
  if c[x]>0 then begin
    inc(len,son[x]);inc(lines);exit;
  end;
  if (not(exist[x])) or (l[x]=r[x]) then exit;
  count(x<<1);count(x<<1 or 1);
  if rc[x<<1] and lc[x<<1 or 1] then dec(lines);
end;

Procedure main;
var
  i:int;
begin
  last:=0;ans:=0;
  for i:=1 to n<<1 do begin
    if seg[i].b=0 then add(1,seg[i].p1,seg[i].p2)
    else del(1,seg[i].p1,seg[i].p2);
    len:=0;lines:=0;
    count(1);
    inc(ans,abs(last-len));
    inc(ans,lines*2*(seg[i+1].p-seg[i].p));
    last:=len;
  end;
  writeln(ans);
end;

Begin
  init;
  build(1,1,22000);
  main;
end.