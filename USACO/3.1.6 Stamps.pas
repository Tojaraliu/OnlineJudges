{
ID:ToJaRa
LANG:PASCAL
PROG:stamps
}

Const
  fname='stamps';

var
  a:array[1..50] of longint;
  f:array[0..2000000] of longint;
  k,n:longint;
 
procedure openf;
begin
  assign(input,fname+'.in');reset(input);
  assign(output,fname+'.out');rewrite(output);
end;
 
procedure init;
var
  i:longint;
begin
  readln(k,n);
  for i:=1 to n do read(a[i]);
end;
 
procedure work;
var
  i,j,t,min:longint;
begin
  for i:=1 to 2000000 do begin
    min:=maxlongint;
    for j:=1 to n do begin
      t:=i-a[j];
      if t>=0 then
        if f[t]+1<min then min:=f[t]+1;
    end;
    f[i]:=min;
    if f[i]>k then break;
  end;
  writeln(i-1);
  
end;
 
begin
  openf;
  init;
  work;
  close(input);
  close(output);
end.