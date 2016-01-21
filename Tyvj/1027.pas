var r,c,i,j,sum:longint;
  f:array[0..41,0..41]of longint;
function max:integer;
var a,b,c,d:longint;
begin
  a:=f[i-1,j];b:=f[i+1,j];
  c:=f[i,j-1];d:=f[i,j+1];
  if a>b then max:=a else max:=b;
  if c>max then max:=c;
  if d>max then max:=d;
  if max=a then exit(1)
  else if max=b then exit(2)
  else if max=c then exit(3)
  else if max=d then exit(4);
end;
begin
  readln(r,c);sum:=0;
  for i:=1 to r do begin
    for j:=1 to c do read(f[i,j]);
    readln;
  end;
  i:=1;j:=1;
  while(i<r)or(j<c)do begin
    inc(sum,f[i,j]);f[i,j]:=0;
    case max of
      1:dec(i);2:inc(i);
      3:dec(j);4:inc(j);
    end;
  end;
  writeln(sum+f[r,c]);
end.