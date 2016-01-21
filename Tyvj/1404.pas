Const
  fn='flow';

Type
  int=longint;
  bool=boolean;

Var
  r,l,f:Array[0..501] of int;
  a:Array[0..501,0..501] of int;
  qx,qy:Array[0..300000] of int;
  v:Array[0..501,0..501] of bool;
  dx:Array[1..4] of int=(0,1,0,-1);
  dy:Array[1..4] of int=(1,0,-1,0);
  n,m:int;

Procedure init;
var
  i,j:int;
begin
  fillchar(a,sizeof(a),127);
  readln(n,m);
  for i:=1 to n do
    for j:=1 to m do read(a[i,j]);
end;

Function min(x,y:int):int;
begin
  if x<y then exit(x);exit(y);
end;

Function max(x,y:int):int;
begin
  if x>y then exit(x);exit(y);
end;

Procedure opf;
begin
  Assign(input,fn+'.in');reset(input);
  Assign(output,fn+'.ans');rewrite(output);
end;

Procedure dfs(x,y,col:int);
var
  i:int;
begin
  v[x,y]:=true;
  if x=n then begin
    r[col]:=max(r[col],y);l[col]:=min(l[col],y);
  end;
  for i:=1 to 4 do
    if not(v[x+dx[i],y+dy[i]])and(a[x+dx[i],y+dy[i]]<a[x,y]) then dfs(x+dx[i],y+dy[i],col);
end;

Procedure main1;
var
  i,j,xx,yy,tx,ty,sum,h,t:int;
begin
  fillchar(v,sizeof(v),false);
  for i:=1 to m do begin
    qx[i]:=1;qy[i]:=i;
    v[1,i]:=true;
  end;
  h:=1;t:=m+1;
  while h<>t do begin
    xx:=qx[h];yy:=qy[h];
    for i:=1 to 4 do begin
      tx:=xx+dx[i];ty:=yy+dy[i];
      if (a[tx,ty]<a[xx,yy])and(not(v[tx,ty])) then begin
        qx[t]:=tx;qy[t]:=ty;v[tx,ty]:=true;
        inc(t);
      end;
    end;
    inc(h);
  end;

  sum:=0;
  for i:=1 to m do if not(v[n,i]) then begin
    for j:=1 to m do
      if not(v[n,j]) then inc(sum);
    writeln(0);writeln(sum);close(output);
    halt;
  end;

  for i:=1 to m do begin
    r[i]:=0;l[i]:=m+1;
    fillchar(v,sizeof(v),false);
    dfs(1,i,i);
  end;
end;

Procedure main2;
var
  i,j:int;
begin
  for i:=1 to m do f[i]:=1<<29;f[0]:=0;
  for i:=1 to m do begin
    for j:=1 to m do
      if (l[j]<=i)and(r[j]>=i) then f[i]:=min(f[i],f[l[j]-1]+1);
  end;
end;

Begin
  opf;
  init;
  main1;
  main2;
  writeln(1);writeln(f[m]);
  close(output);
End.
