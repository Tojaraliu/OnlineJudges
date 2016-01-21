Type
  int=longint;
  
Var
  a,b,t:Array[0..100] of int;
  sum,n,tot,now,ans:int;
  flag:boolean;
  
Procedure swap(var x,y:int);
var
  t:int;
begin
  t:=x;x:=y;y:=t;
end;

Procedure dfs(dep,now,empty:int);
var
  i:int;
begin
  if dep=0 then begin
    writeln(ans);
    flag:=true;exit;
  end;
  if now>tot then exit;
  if empty<a[tot] then exit;
  for i:=now to tot do begin
    if (b[i]>0)and(a[i]<=empty) then begin
      dec(b[i]);
      if a[i]=empty then begin
        dfs(dep-1,1,ans);inc(b[i]);exit;
      end
      else dfs(dep,i,empty-a[i]);
      inc(b[i]);
      if empty=ans then exit;
      if flag then exit;
    end;
  end;
end;

Procedure qsort(l,r:int);
var
  i,j,mid:int;
begin
  i:=l;j:=r;mid:=t[(l+r)>>1];
  repeat
    while t[i]>mid do inc(i);
    while t[j]<mid do dec(j);
    if i<=j then begin
      swap(t[i],t[j]);
      inc(i);dec(j);
    end;
  until i>j;
  if l<j then qsort(l,j);
  if i<r then qsort(i,r);
end;

Procedure init;
var
  i:int;
begin
  readln(n);
  if n=0 then halt;
  sum:=0;flag:=false;
  fillchar(t,sizeof(t),0);
  fillchar(a,sizeof(a),0);
  fillchar(b,sizeof(b),0);
  for i:=1 to n do begin read(t[i]);inc(sum,t[i]);end;
  qsort(1,n);
  tot:=0;now:=-1;
  for i:=1 to n do begin
    if t[i]<>now then begin inc(tot);a[tot]:=t[i];b[tot]:=0;now:=t[i]end;
    inc(b[tot]);
  end;
end;

Procedure main;
begin
  ans:=0;
  while true do begin
    inc(ans);
    if (sum mod ans)=0 then dfs(sum div ans,1,ans);
    if flag then exit;
  end;
end;

Begin
  while 0=0 do begin
    init;
    main;
  end;
End.