var
  fa:array[0..100000] of longint;
  n,m,ans:longint;
  
function get(x:longint):longint;
begin
  if x<>fa[x] then fa[x]:=get(fa[x]);
  exit(fa[x]);
end;

procedure get_father;
var
  i,j,t1,t2,r1,r2:longint;
begin
  ans:=0;t1:=0;t2:=0;
  for i:=1 to m do fa[i]:=i;
  for i:=1 to n do begin
    readln(t1,t2);
    r1:=get(t1);r2:=get(t2);
    if (r1=r2)
      then inc(ans)
      else fa[r1]:=r2;
  end;
end;

begin
  readln(n,m);
  get_father;
  writeln(ans);
end.