{
ID:ToJaRa
PROG:holstein
LANG:PASCAL
}

Const
  inp='holstein.in';
  outp='holstein.out';

Var
  sum:array[0..50] of longint;
  a:array[0..50,0..50] of longint;
  ans,b:array[0..50] of longint;
  v:array[0..50] of boolean;
  m,n,maxn:longint;

procedure openf;
begin
  assign(input,inp);reset(input);
  assign(output,outp);rewrite(output);
end;

procedure closef;
begin
  close(input);
  close(output);
end;

function check:boolean;
var
  i:longint;
begin
  for i:=1 to  m do
    if sum[i]>0 then exit(false);
  exit(true);
end;

procedure init;
var
  i,j:longint;
begin
  read(m);
  for i:=1 to m do read(sum[i]);
  read(n);
  for i:=1 to n do
    for j:=1 to m do read(a[i,j]);
  fillchar(v,sizeof(v),0);
  maxn:=maxlongint;
end;

procedure dfs(x,l:longint);
var
  i,j,k:longint;
begin
  if l>maxn then exit;
  if check then
    if l<maxn then begin
      maxn:=l;ans:=b;exit;
    end;
  for i:=1+x to n do
    if not(v[i]) then begin
      for j:=1 to m do dec(sum[j],a[i,j]);
      v[i]:=true;b[l+1]:=i;
      dfs(i,l+1);
      v[i]:=false;b[l+1]:=0;
      for j:=1 to m do inc(sum[j],a[i,j]);
  end;
end;

procedure print;
var
  i:longint;
begin
  write(maxn);
  for i:=1 to maxn do write(' ',ans[i]);
  writeln;
end;

begin
  openf;
  init;
  dfs(0,0);
  print;
  closef;
end.
