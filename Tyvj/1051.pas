Type
  int=longint;

Var
  n,m:int;
  fa,lch,rch,w:array[-10..510] of int;
  f:array[-10..510,-10..510] of int;

Procedure init;
var
  i,j:int;
Begin
  readln(n,m);
  filldword(lch,sizeof(lch)>>2,-1);
  filldword(rch,sizeof(rch)>>2,-1);
  filldword(w,sizeof(w)>>2,-1);
  for i:=1 to n do read(fa[i],w[i]);
  for i:=1 to n do begin
    if lch[fa[i]]=-1 then lch[fa[i]]:=i
    else begin
      j:=lch[fa[i]];
      while rch[j]<>-1 do j:=rch[j];
      rch[j]:=i;
    end;
  end;
  fillchar(f,sizeof(f),0);
  for i:=-1 to n do
    for j:=-1 to m do
      if (i=-1)or(j=0) then f[i,j]:=0 else f[i,j]:=-1;
end;

Procedure Treedp(i,j:int);
var
  k,x,max:int;
begin
  if f[i,j]>=0 then exit;
  treedp(rch[i],j);
  max:=f[rch[i],j];
  for k:=1 to j do begin
    treedp(lch[i],k-1);
    treedp(rch[i],j-k);
    x:=f[lch[i],k-1]+f[rch[i],j-k]+w[i];
    if x>max then max:=x;
  end;
  f[i,j]:=max;
end;

Begin
  init;
  TreeDP(lch[0],m);
  writeln(f[lch[0],m]);
End.