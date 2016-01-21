{
ID:ToJaRa
PROG:ariprog
LANG:PASCAL
}

const
	inp='ariprog.in';
	outp='ariprog.out';

var
  f:array[0..200000] of boolean;
  base:array[0..200000] of longint;
  ans:array[0..10000,1..2] of longint;
  n,m,an:longint;

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

procedure swap(var a,b:longint);
var
  t:longint;
begin
  t:=a;a:=b;b:=t;
end;

procedure sort(l,r:longint);
var
  i,j,x,y:longint;
begin
  i:=l;j:=r;y:=(r+l)>>1;x:=ans[y,2];y:=ans[y,1];
  while i<=j do
    begin
      while (ans[i,2]<x) or ((ans[i,2]=x) and (ans[i,1]<y)) do inc(i);
      while (ans[j,2]>x) or ((ans[j,2]=x) and (ans[j,1]>y)) do dec(j);
      if i<=j then
        begin
          swap(ans[i,1],ans[j,1]);swap(ans[i,2],ans[j,2]);
          inc(i);dec(j);
        end;
    end;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

procedure init;
var
  i,j:longint;
begin
  fillchar(f,sizeof(f),false);
  fillchar(base,sizeof(base),0);
  fillchar(ans,sizeof(ans),0);
  an:=0;
  read(n,m);
  for i:=0 to m do
    for j:=i to m do
      f[(i*i)+(j*j)]:=true;
  for i:=((m*m)<<1) downto 1 do
    if f[i] then begin
      inc(base[0]);base[base[0]]:=i;
  end;
end;

procedure work;
var
  i,j,k,d,t,next,len:longint;
  flag:boolean;
begin
  for i:=1 to base[0]-1 do
    for j:=i+1 to base[0] do begin
      t:=base[i];d:=base[i]-base[j];next:=base[j];len:=1;flag:=true;
      if ((base[i]-(n-1)*d)<0) then break;
      while (next>=0) and (f[next]) and (flag) do begin
        inc(len);
        if len=n then begin
          flag:=false;
          inc(an);
          ans[an,1]:=next;ans[an,2]:=d;
        end;
        dec(next,d);
      end;
    end;
end;

procedure print;
var
  i,j:longint;
begin
  if an=0 then writeln('NONE')
    else begin
      sort(1,an);
      for i:=1 to an do writeln(ans[i,1],' ',ans[i,2]);
    end;
end;

begin
  openf;
  init;
  work;
  print;
  closef;
end.
