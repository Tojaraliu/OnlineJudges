{
ID:ToJaRa
LANG:PASCAL
PROG:game1
}

const
  fn='game1';

Type
  int=longint;

var
  f:Array[0..300,0..300] of int;
  sum:Array[0..300] of int;
  n:int;

Procedure opf;
begin
  assign(input,fn+'.in');reset(input);
  assign(output,fn+'.out');rewrite(output);
end;

Function min(x,y:int):int;
begin
  if x<y then exit(x) else exit(y);
end;

Procedure init;
var
  i:int;
begin
  readln(n);fillchar(sum,sizeof(sum),0);
  for i:=1 to n do begin
    read(f[i,i]);
    sum[i]:=sum[i-1]+f[i,i];
  end;
end;

Procedure dp;
var
  i,j:int;
begin
  for j:=1 to n do
    for i:=1 to n-j do
      f[i,i+j]:=sum[i+j]-sum[i-1]-min(f[i,i+j-1],f[i+1,i+j]);
  writeln(f[1,n],' ',sum[n]-f[1,n]);
end;

begin
  opf;
  init;
  dp;
  close(output);
end.
