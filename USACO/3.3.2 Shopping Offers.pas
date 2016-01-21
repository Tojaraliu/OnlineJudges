{
ID:ToJaRa
LANG:PASCAL
PROG:shopping
}

Const
  inf=1<<28;
  fn='shopping';

var
  n,m,b:longint;
  need,cost,cheap:array[0..100] of longint;
  f:Array[0..5,0..5,0..5,0..5,0..5] of longint;
  better:Array[0..1000,0..5] of longint;
  c:Array[0..1000] of longint;

Procedure opf;
begin
  assign(input,fn+'.in');reset(input);
  assign(output,fn+'.out');rewrite(output);
end;

Function min(x,y:longint):longint;
begin
  if x<y then exit(x);exit(y);
end;

Procedure init;
var
  i1,i2,i3,i4,i5,i,j,x,y:longint;
begin
  readln(n);
  for i:=1 to n do readln;
  for i:=1 to 5 do need[i]:=1;
  readln(b);
  for i:=1 to b do begin
    read(x);
    c[x]:=i;
    readln(need[i],cost[i]);
  end;
  reset(input);
  readln;
  for i1:=0 to need[1] do
    for i2:=0 to need[2] do
      for i3:=0 to need[3] do
        for i4:=0 to need[4] do
          for i5:=0 to need[5] do
            f[i1,i2,i3,i4,i5]:=i1*cost[1]+i2*cost[2]+i3*cost[3]+i4*cost[4]+i5*cost[5];
  for i:=1 to n do begin
    read(m);
    for j:=1 to m do begin
      read(x,y);
      better[i,c[x]]:=y;
    end;
    readln(cheap[i]);
  end;
end;

procedure main;
var
  x,i,j,k,l,m:longint;
begin
  for x:=1 to n do
    for i:=0 to need[1] do
      for j:=0 to need[2] do
        for k:=0 to need[3] do
          for l:=0 to need[4] do
            for m:=0 to need[5] do
              if (i-better[x,1]>=0) and (j-better[x,2]>=0) and (k-better[x,3]>=0) and (l-better[x,4]>=0) and (m-better[x,5]>=0) then
                f[i,j,k,l,m]:=min(f[i,j,k,l,m],f[i-better[x,1],j-better[x,2],k-better[x,3],l-better[x,4],m-better[x,5]]+cheap[x]);
end;

begin
  opf;
  init;
  main;
  writeln(f[need[1],need[2],need[3],need[4],need[5]]);
  close(output);
end.
