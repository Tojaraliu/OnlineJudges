Const
  inf=1<<29;
  
Type
  bool=boolean;
  int=longint;
  
Var
  a,b,time,mini,sum:Array[0..11000] of int;
  n,cnt,ans:int;
  v:Array[0..11000] of bool;
  
Function min(x,y:int):int;
begin
  if x<y then exit(x);exit(y);
end;
  
Procedure swap(var x,y:int);
var
  t:int;
begin
  t:=x;x:=y;y:=t;
end;

Procedure sort(l,r:int);
var
  i,j,mid:int;
begin
  i:=l;j:=r;mid:=a[(i+j)>>1];
  repeat
    while a[i]<mid do inc(i);
    while a[j]>mid do dec(j);
    if i<=j then begin
      swap(a[i],a[j]);swap(b[i],b[j]);
      inc(i);dec(j);
    end;
  until i>j;
  if i<r then sort(i,r);
  if l<j then sort(l,j);
end;

Procedure init;
var
  i:int;
begin
  readln(n);
  for i:=1 to n do begin
    read(a[i]);
    b[i]:=i;
  end;
  sort(1,n);
end;

Procedure dfs(x:int);
begin
  if v[x] then exit;
  v[x]:=true;
  inc(time[cnt]);
  inc(sum[cnt],a[x]);
  mini[cnt]:=min(mini[cnt],a[x]);
  dfs(b[x]);
end;

Procedure main;
var
  i:int;
begin
  fillchar(mini,sizeof(mini),$7f);
  fillchar(v,sizeof(v),false);
  for i:=1 to n do
    if not(v[i]) then begin
      inc(cnt);
      dfs(i);
    end;
  for i:=1 to cnt do begin
    inc(ans,min(sum[i]+(time[i]-2)*mini[i],(time[i]+1)*a[1]+mini[i]+sum[i]));
  end;
  writeln(ans);
end;
  
Begin
  init;
  main;
end.