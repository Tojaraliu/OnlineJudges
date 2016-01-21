Const
  inf=1<<29;
  maxn=20001;
  
Type
  int=longint;
  node=record
    p,num:int;
  end;
  
Var
  l,r,c:Array[0..maxn*10] of int;
  v:Array[0..maxn] of boolean;
  line:Array[0..maxn] of node;
  s:Array[0..maxn,0..2] of int;
  tt,n,ans,i:int;
  
Procedure swap(var x,y:node);
var
  t:node;
begin
  t:=x;x:=y;y:=t;
end;

Procedure sort(l,r:int);
var
  i,j,x:int;
begin
  i:=l;j:=r;x:=line[(l+r)>>1].p;
  repeat
    while line[i].p<x do inc(i);
    while line[j].p>x do dec(j);
    if i<=j then begin
      swap(line[i],line[j]);
      inc(i);dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

Procedure init;
var
  i:int;
begin
  fillchar(line,sizeof(line),0);fillchar(s,sizeof(s),0);
  readln(n);
  for i:=0 to n-1 do begin
    readln(s[i,0],s[i,1]);
    line[i<<1].p:=s[i,0];line[i<<1].num:=-i;
    line[i<<1 or 1].p:=s[i,1];line[i<<1 or 1].num:=i;
  end;
  sort(0,2*n-1);
  //for i:=0 to n*2-1 do write(line[i].p,' ');writeln;
  //writeln('lisan OK');
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
  if c[x]>0 then begin
    c[x<<1]:=c[x];
    c[x<<1 or 1]:=c[x];
    c[x]:=0;
  end;
end;

Procedure check(x:int);
begin
  //writeln('checking ',x);
  if c[x]<>0 then begin 
    if not(v[c[x]]) then begin
      inc(ans);
      v[c[x]]:=true;
    end;
    exit;
  end;
  if l[x]=r[x] then exit;
  check(x<<1);
  check(x<<1 or 1);
end;

Procedure up(x,lf,rt,col:int);
var
  mid:int;
begin
  if (lf<=l[x])and(r[x]<=rt) then begin
    c[x]:=col;exit;
  end;
  infosub(x);
  mid:=(l[x]+r[x])>>1;
  if lf<=mid then up(x<<1,lf,rt,col);
  if rt>mid then up(x<<1 or 1,lf,rt,col);
end;

Procedure main;
var
  t,i,tp:int;
begin
  t:=line[0].p;tp:=1;
  for i:=0 to n<<1-1 do begin
    if line[i].p<>t then begin
      inc(tp);t:=line[i].p;
    end;
    if line[i].num<0
      then s[-line[i].num,0]:=tp
      else s[line[i].num,1]:=tp;
  end;
  //for i:=0 to n-1 do writeln(s[i,0],' ',s[i,1]);
  build(1,1,tp);
  //writeln('Build OK');
  for i:=0 to n-1 do up(1,s[i,0],s[i,1],i+1);
  //writeln('Up OK');
  fillchar(v,sizeof(v),false);ans:=0;
  check(1);
  writeln(ans);
end;

begin
  readln(tt);
  for i:=1 to tt do begin
    init;
    main;
  end;
end.