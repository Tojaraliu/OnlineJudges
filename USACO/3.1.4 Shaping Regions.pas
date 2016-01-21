{
ID:ToJaRa
LANG:PASCAL
PROG:rect1
}

Const
  fname='rect1';

var
  x1,y1,x2,y2,c:array[0..1000] of longint;
  ans:array[1..2500] of longint;
  n,max:longint;

procedure openf;
begin
  assign(input,fname+'.in');reset(input);
  assign(output,fname+'.out');rewrite(output);
end;

procedure closef;
begin
  close(input);close(output);
end;

procedure init;
var
  i:longint;
begin
  readln(x2[0],y2[0],n);
  x1[0]:=0;y1[0]:=0;c[0]:=1;max:=0;
  for i:=1 to n do begin
    readln(x1[i],y1[i],x2[i],y2[i],c[i]);
    if c[i]>max then max:=c[i];
  end;
end;

procedure cover(l,r,s,d,k,col:integer);
begin
  while (k<=n) and ((r<=x1[k]) or (l>=x2[k]) or (d<=y1[k]) or (s>=y2[k])) do inc(k);
  if k>n then begin ans[col]:=ans[col]+(r-l)*(d-s); exit; end;
  if l<=x1[k] then begin cover(l,x1[k],s,d,k+1,col); l:=x1[k]; end;
  if r>=x2[k] then begin cover(x2[k],r,s,d,k+1,col); r:=x2[k]; end;
  if s<=y1[k] then begin cover(l,r,s,y1[k],k+1,col); s:=y1[k]; end;
  if d>=y2[k] then begin cover(l,r,y2[k],d,k+1,col); d:=y2[k]; end;
end;

procedure work;
var
  i,j,min:longint;
begin
  for i:=n downto 0 do cover(x1[i],x2[i],y1[i],y2[i],i+1,c[i]);
  for i:=1 to max do
    if ans[i]<>0 then writeln(i,' ',ans[i]);
end;

Begin
  openf;
  init;
  work;
  closef;
End.