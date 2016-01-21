Const
  maxn=10001; treesize=maxn*2*4; maxpos=maxn<<1;

Var
  cases,i,j,n,ans,s,t,m,tmp:longint;
  //Segment Tree
  l,r,mid:array[0..treesize] of longint;
  cover:array[0..treesize] of boolean;
  //Segment
  x,y:array[0..maxn] of longint;
  vis:array[0..maxn] of boolean;
  //Discrete
  dis,mark:array[0..maxpos] of longint;
Procedure Q(l,r:longint);
  begin
    i:=l;j:=r;m:=dis[(l+r)>>1];
    while i<=j do
      begin
        while dis[i]<m do inc(i);
        while dis[j]>m do dec(j);
        if i<=j then begin
          tmp:=dis[i];dis[i]:=dis[j];dis[j]:=tmp;
          inc(i);dec(j);
        end;
      end;
    if i<r then Q(i,r);if l<j then Q(l,j);
  end;

Procedure Pre;
  begin
    ans:=0;
    fillchar(cover,sizeof(cover),false);
  end;
Procedure Init;
  begin
    readln(n);
    for i:=n downto 1 do begin readln(x[i],y[i]); inc(y[i]);end;
  end;
Function find(x:longint):longint;
var 
  l,r,mid:longint;
begin
  l:=1;r:=n<<1;
  while l<>r do begin
    mid:=(l+r)>>1;
    if dis[mid]=x then exit(mid);
    if dis[mid]>x then r:=mid else l:=mid+1;
  end;
  exit(l);
end;
Procedure Discrete;
  begin
    dis[0]:=-1;
    for i:=1 to n do begin dis[i<<1]:=x[i];dis[i<<1-1]:=y[i];end;
    Q(1,n<<1);
    for i:=1 to n<<1 do
      if dis[i]<>dis[i-1] then mark[i]:=mark[i-1]+1 else mark[i]:=mark[i-1];
    for i:=1 to n do begin x[i]:=mark[find(x[i])];y[i]:=mark[find(y[i])];end;
  end;
Procedure Build(node,s,t:longint);
  begin
    l[node]:=s;r[node]:=t;mid[node]:=(s+t)>>1;cover[node]:=false;
    if s=t then exit;
    build(node<<1,s,mid[node]);
    build(node<<1+1,mid[node]+1,t);
  end;
Procedure Add(node:longint);
  begin
    if cover[node] then exit;
    if (s<=l[node])and(t>=r[node]) then begin
      vis[i]:=true;
      cover[node]:=true;
      exit;
    end;
    if s<=mid[node] then add(node<<1);
    if t>mid[node] then add(node<<1+1);
    cover[node]:=cover[node<<1]and cover[node<<1+1];
  end;

Procedure Solve;
  begin
    for i:=1 to n do
      begin
        s:=x[i];t:=y[i]-1;
        writeln(s,' ',t);
        Add(1);
      end;
    for i:=1 to n do if vis[i] then begin inc(ans); vis[i]:=false; end;
    writeln(ans);
  end;
Begin
  readln(cases);
  while cases>0 do
    begin
      Pre;
      Init;
      Build(1,1,n<<1);
      Discrete;
      Solve;
      dec(cases);
    end;
End.