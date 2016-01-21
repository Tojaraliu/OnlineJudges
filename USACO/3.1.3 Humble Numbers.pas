{
ID:ToJaRa
LANG:PASCAL
PROG:humble
}

Const
  fname='humble';

var
  a,b:array[1..100] of longint;
  humble:array[0..100000] of longint;
  k,n:longint;

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
  readln(n,k);
  for i:=1 to n do read(a[i]);
end;

procedure work;
var
  i,j,min:longint;
begin
  humble[0]:=1;
  fillchar(b,sizeof(b),0);
  for i:=1 to k do begin
    min:=maxlongint;
    for j:=1 to n do
      if (a[j]*humble[b[j]]>humble[i-1]) and (a[j]*humble[b[j]]<min) then min:=a[j]*humble[b[j]];
    humble[i]:=min;
    for j:=1 to n do
      if a[j]*humble[b[j]]=min then inc(b[j]);
  end;
  writeln(humble[k]);
end;

Begin
  openf;
  init;
  work;
  closef;
End.
