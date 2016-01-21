{
ID:ToJaRa
LANG:PASCAL
PROG:milk2
}
const
	inp='milk2.in';
	outp='milk2.out';

Var
  a:array[0..1000001] of boolean;
  n,a1,a2,s,e:longint;

procedure init;
var
  i,j,x,y:longint;
begin
  s:=maxlongint;e:=-maxlongint;
  readln(n);fillchar(a,sizeof(a),false);
  for i:=1 to n do begin
    readln(x,y);
    for j:=x+1 to y do a[j]:=true;
    if x<s then s:=x;
    if y>e then e:=y;
  end;
end;

procedure work;
var
  i,j,k:longint;
begin
  i:=s;k:=1;a1:=-1;a2:=-1;
  while i<e do begin
    while a[i] do begin inc(i);inc(k);end;dec(i);dec(k);
    if k>a1 then a1:=k;
    if i=e then break;inc(i);
    while (not(a[i])) do inc(i);
    k:=1;
  end;
  i:=s;k:=0;
  while i<e do begin
    while not(a[i]) do begin inc(i);inc(k);end;dec(i);dec(k);
    if k>a2 then a2:=k;
    if i=e then break;inc(i);
    while a[i] do inc(i);
    k:=1;
  end;
end;

begin
	assign(input,inp);reset(input);
	assign(output,outp);rewrite(output);
  init;
  work;
  writeln(a1,' ',a2);
  close(input);
  close(output);
end.
