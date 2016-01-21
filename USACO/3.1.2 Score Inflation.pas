{
ID:ToJaRa
LANG:PASCAL
PROG:inflate
}

Const
  fname='inflate';

var
  n,m:longint;
  a:array[0..10001] of longint;

procedure openf;
begin
  assign(input,fname+'.in');reset(input);
  assign(output,fname+'.out');rewrite(output);
end;

procedure closef;
begin
  close(input);close(output);
end;

procedure work;
var
  i,j,x,y:longint;
begin
  for i:=1 to n do begin
    readln(x,y);
    for j:=0 to m-y do
      if a[j+y]<a[j]+x then a[j+y]:=a[j]+x;
  end;
  writeln(a[m]);
end;

Begin
  openf;
  readln(m,n);
  work;
  closef;
End.
