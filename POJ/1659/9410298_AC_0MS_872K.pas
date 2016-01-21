var
  g:array[1..10,1..10]of longint;
  a,b:array[1..10]of longint;
  n,i,t:longint;
  flag:boolean;

procedure next(a,b:longint;var c,d:longint);
begin
  c:=a; d:=b+1;
  if d=n+1 then begin inc(c); d:=c; end;
end;

procedure search(x,y:longint);
var
  i,j:longint;
begin
  if flag then exit;
  if x>n then
  begin
    for i:=1 to n do if a[i]<>0 then exit;
    flag:=true; writeln('YES');
    for i:=1 to n do
    begin
      for j:=1 to n do if j<i then write(g[j,i],' ') else write(g[i,j],' ');
      writeln;
    end;
    exit;
  end;
  next(x,y,i,j);
  if (a[x]>0)and(a[y]>0)and(x<>y) then
  begin
    g[x,y]:=1; g[y,x]:=1; dec(a[x]); dec(a[y]);
    inc(b[x]); inc(b[y]);
    if n-y>=a[x]-b[x] then search(i,j);
    inc(a[x]); inc(a[y]); dec(b[x]); dec(b[y]);
  end;
  g[x,y]:=0; g[y,x]:=0;
  if n-y>=a[x]-b[x] then search(i,j);
end;

procedure frog;
var
  i,j:longint;
begin
  readln(n);
  for i:=1 to n do begin read(a[i]); b[i]:=0; end;
  flag:=false; search(1,1);
  if not flag then writeln('NO');
  writeln;
end;

begin
  readln(t);
  for i:=1 to t do frog;
end.
