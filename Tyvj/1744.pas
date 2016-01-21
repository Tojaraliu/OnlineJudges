//TYVJ 1744 逆序对
//首先求整体逆序对，之后给出m次查询，每次修改一个数，查询新序列的逆序对，每次查询后序列还原。
//对于每个位上的所有可能出现的数字，都求出来一个B[i]和C[i]，然后离线查询即可。
//Accepted / 100 / 1106ms / 11464KB

Const
  inf=1<<29;
  
Type
  int=longint;
  point=^link;
  link=record
    tar,id,b,c:int;
    next:point;
  end;
  
Var
  f,g,c:Array[0..510000] of int;
  e:Array[0..110000] of point;
  ans:Array[0..110000] of int64;
  a:Array[0..110000] of int;
  n,m:int;
  sum:int64;
  
Procedure add(x,i,y:int);
var
  p:point;
begin
  new(p);
  p^.tar:=y;p^.id:=i;p^.b:=0;p^.c:=0;p^.next:=e[x];e[x]:=p;
end;

Function lowbit(x:int):int;
begin
  exit(x and (-x));
end;
  
Procedure change(i,dlt:int);
begin
  while i<=500000 do begin
    inc(c[i],dlt);
    inc(i,lowbit(i));
  end;
end;

Function gs(i:int):int;
begin
  gs:=0;
  while i>0 do begin
    inc(gs,c[i]);
    dec(i,lowbit(i));
  end;
end;

Procedure init;
var
  i,y,x:int;
begin
  readln(n,m);
  for i:=1 to n do read(a[i]);
  for i:=1 to m do begin
    readln(x,y);
    add(x,i,y);
  end;
end;

Procedure main;
var
  i:int;
  p:point;
begin
  fillchar(c,sizeof(c),0);
  for i:=1 to n do begin
    f[i]:=gs(500000)-gs(a[i]);
    p:=e[i];
    while p<>nil do begin
      p^.b:=gs(500000)-gs(p^.tar);
      p:=p^.next;
    end;
    change(a[i],1);
  end;
  fillchar(c,sizeof(c),0);
  for i:=n downto 1 do begin
    g[i]:=gs(a[i]-1);
    p:=e[i];
    while p<>nil do begin
      p^.c:=gs(p^.tar-1);
      p:=p^.next;
    end;
    change(a[i],1);
  end;
  sum:=0;
  for i:=1 to n do inc(sum,int64(f[i])+g[i]);
  sum:=sum>>1;
  writeln(sum);
  for i:=1 to n do begin
    p:=e[i];
    while p<>nil do begin
      ans[p^.id]:=sum+(p^.c+p^.b)-f[i]-g[i];
      p:=p^.next;
    end;
  end;
  for i:=1 to m do writeln(ans[i]);
end;

Begin
  init;
  main;
end.