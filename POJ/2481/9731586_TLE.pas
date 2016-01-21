Const
  inf=1<<29;

Type
  int=longint;
  point=record
    x,y,id:int;
  end;

Var
  ans,a,c:Array[0..200001] of int;
  s:Array[0..100001] of point;
  n,m:int;

Function lowbit(x:int):int;
begin
  exit(x and (-x));
end;

Function getsum(x:int):int;
begin
  getsum:=0;
  while x>0 do begin
    inc(getsum,c[x]);
    dec(x,lowbit(x));
  end;
end;

Procedure change(x,del:int);
begin
  while x<=m do begin
    inc(c[x],del);
    inc(x,lowbit(x));
  end;
end;

Procedure init;
var
  i:int;
begin
  readln(n);m:=-inf;
  if n=0 then halt;
  fillchar(a,sizeof(a),0);
  fillchar(c,sizeof(c),0);
  fillchar(s,sizeof(s),0);
  for i:=1 to n do with s[i] do begin
    readln(x,y);
    id:=i;
    if x>m then m:=x;
  end;
end;

Procedure swap(var x,y:point);
var
  t:point;
begin
  t:=x;x:=y;y:=t;
end;

Procedure sort(l,r:int);
var
  m1,m2,i,j:int;
begin
  i:=l;j:=r;m1:=s[(l+(l+r)>>1)>>1].y;m2:=s[(l+(l+r)>>1)>>1].x;
  repeat
    while (s[i].y>m1)or((s[i].y=m1)and(s[i].x<m2)) do inc(i);
    while (s[j].y<m1)or((s[j].y=m1)and(s[j].x>m2)) do dec(j);
    if i<=j then begin
      swap(s[i],s[j]);inc(i);dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

Procedure main;
var
  i:int;
begin
  fillchar(ans,sizeof(ans),0);
  for i:=1 to n do begin
    if i=1 then begin
      ans[s[i].id]:=getsum(s[i].x);
      change(s[i].x,1);
    end
    else begin
      if (s[i].x=s[i-1].x)and(s[i].y=s[i-1].y) then ans[s[i].id]:=ans[s[i-1].id]
      else ans[s[i].id]:=getsum(s[i].x);
      change(s[i].x,1);
    end;
  end;
  for i:=1 to n do write(ans[i],' ');
  writeln;
end;

Begin
  while 0=0 do begin
    init;
    sort(1,n);
    main;
  end;
End.
