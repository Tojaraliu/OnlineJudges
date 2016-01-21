{
ID:ToJaRa
PROG:numtri
LANG:PASCAL
}

const
	inp='numtri.in';
	outp='numtri.out';

var
  f:array[0..1001,0..1001] of longint;
  r,ans:longint;

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

function max(x,y:longint):longint;
begin
  if x>y then exit(x);
  exit(y);
end;

procedure init_dp;
var
  i,j,t:longint;
begin
  fillchar(f,sizeof(f),0);ans:=0;
  readln(r);
  for i:=1 to r do
    for j:=1 to i do begin
      read(t);
      f[i,j]:=max(f[i-1,j],f[i-1,j-1])+t;
  end;
  for i:=1 to r do ans:=max(ans,f[r,i]);
  writeln(ans);
end;

begin
  openf;
  init_dp;
  closef;
end.
