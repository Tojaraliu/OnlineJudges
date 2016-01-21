{
ID:ToJaRa
PROG:subset
LANG:PASCAL
}

Const
  inp='subset.in';
  outp='subset.out';

Var
  n,sum:longint;
  f:array[1..39,0..390] of longint;

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

procedure init;
begin
  readln(n);
  sum:=(n*(n+1))>>1;
  if ((sum and 1)=1) then begin
    writeln(0);closef;halt;
  end;
  sum:=sum>>1;
end;

procedure main;
var
  i,j:longint;
begin
  f[1,1]:=1;
  f[1,0]:=1;
  for i:=2 to n do
    for j:=0 to sum do
      if j-i>=0
        then f[i,j]:=f[i-1,j]+f[i-1,j-i]
        else f[i,j]:=f[i-1,j];
end;

begin
  openf;
  init;
  main;
  writeln(f[n,sum]>>1);
  closef;
end.
