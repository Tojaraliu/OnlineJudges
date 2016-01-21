{
ID:ToJaRa
PROG:sort3
LANG:PASCAL
}

Const
  inp='sort3.in';
  outp='sort3.out';
  inf=1000000;

Var
  a,b:array[0..1000] of shortint;
  m:array[1..3] of longint;
  n,tot,tmp:longint;

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
var
  i,j:longint;
begin
  read(n);for i:=1 to 3 do m[i]:=0;
  for i:=1 to n do begin
    read(a[i]);
    inc(m[a[i]]);
  end;
end;

procedure work;
var
  i,j,t:longint;
begin
  for i:=1 to m[1] do b[i]:=1;
  for i:=m[1]+1 to m[1]+m[2] do b[i]:=2;
  for i:=m[1]+m[2]+1 to n do b[i]:=3;
  
  tot:=0;
  for i:=1 to n do
    for j:=1 to n do
      if (a[i]<>a[j]) and (a[i]=b[j]) and (a[j]=b[i]) then
        begin
          tmp:=a[i]; a[i]:=a[j]; a[j]:=tmp;
          inc(tot);
        end;
  tmp:=0;
  for i:=1 to n do
    if a[i]<>b[i] then inc(tmp);
  writeln(tot+tmp div 3*2);
end;

begin
  openf;
  init;
  work;
  closef;
end.
