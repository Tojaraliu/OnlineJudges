{
ID:ToJaRa
LANG:PASCAL
PROG:barn1
}
const
	inp='barn1.in';
	outp='barn1.out';

type
  arr=array[0..222] of longint;

var
  n,tot,max,min,ans:longint;
  a,b:arr;

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

procedure qsort(l,r:longint);
var 
  i,j,x,t:longint;
begin
  i:=l;j:=r;
  x:=a[(r+l)>>1];
  repeat
    while a[i]>x do inc(i);
    while a[j]<x do dec(j);
    if i<=j then begin
      t:=a[i]; a[i]:=a[j]; a[j]:=t;
    inc(i); dec(j);
    end;
  until i>j;
  if i<r then qsort(i,r);
  if l<j then qsort(l,j);
end;


procedure init;
var
  i:longint;
begin
  readln(tot,n,n);
  min:=maxlongint;max:=-maxlongint;
  for i:=1 to n do begin
    readln(a[i]);
    if a[i]<min then min:=a[i];
    if a[i]>max then max:=a[i];
  end;
  ans:=max-min;
end;

procedure work;
var
  i:longint;
begin
  for i:=1 to n do b[i]:=abs(a[i]-a[i-1]);
  a:=b;qsort(2,n);
  if tot>n then tot:=n;
  for i:=2 to tot do dec(ans,a[i]);
  writeln(ans+tot);
end;

begin
  openf;
  init;
  qsort(1,n);
  work;
  closef;
end.
