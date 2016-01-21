Const
  inf=1<<29;
  
Type
  bool=boolean;
  int=longint;
  point=object
    x:int64;
    id:int;
  end;

Var
  tar,org:Array[0..11000] of point;
  k,t,sum:Array[0..11000] of int;
  v:Array[0..11000] of bool;
  n,ansn,m:int;
  ans,sm:int64;

Function min(x,y:int):int;
begin
  if x<y then exit(x);exit(y);
end;

Function min(x,y:int64):int64;
begin
  if x<y then exit(x);exit(y);
end;

Procedure sort(l,r:int);
var
  i,j,mid:int;
  t:point;
Begin
  i:=l;j:=r;mid:=tar[(l+r)>>1].x;
  repeat
    while tar[i].x<mid do inc(i);
    while tar[j].x>mid do dec(j);
    if i<=j then begin
      t:=tar[i];tar[i]:=tar[j];tar[j]:=t;
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
  readln(n);sm:=0;m:=inf;
  for i:=1 to n do begin
    read(org[i].x);inc(sm,org[i].x);
    org[i].id:=i;
    m:=min(m,org[i].x);
  end;
  tar:=org;
  sort(1,n);
  for i:=1 to n do org[i].id:=tar[i].id;
end;

Procedure main;
var
  i,j,yu:int;
begin
  fillchar(v,sizeof(v),false);yu:=n;ansn:=0;
  i:=1;
  while true do begin
    v[i]:=true;
    inc(ansn);k[ansn]:=0;t[ansn]:=inf;
    j:=i;
    while true do begin
      //writeln(org[j].x);
      inc(sum[ansn],org[j].x);
      inc(k[ansn]);
      t[ansn]:=min(t[ansn],org[j].x);
      v[j]:=true;
      j:=org[j].id;
      if v[j] then break;
    end;
    dec(yu,k[ansn]);
    //writeln(k[ansn],' ',sum[ansn],' ',t[ansn]);writeln;
    if yu=0 then break;
    while true do begin
      inc(i);
      if not(v[i]) then break;
    end;
  end;
  ans:=0;
  for i:=1 to ansn do begin
    if k[i]=1 then continue;
    inc(ans,min((k[i]-2)*t[i],t[i]+(k[i]+1)*m));
    inc(ans,sum[ansn]);
  end;
  //writeln;
  writeln(ans);
end;

Begin
  init;
  main;
end.