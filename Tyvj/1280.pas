type
	arr=array[0..100001] of ansistring;
var
	n:arr;
	a:array[0..100001] of longint;
	m,i,j,t:longint;
	ans:ansistring;

procedure qsort1(l,r:longint);
var i,j:longint;m,t:ansistring;
begin
  i:=l;j:=r;m:=n[(l+r)div 2];
  repeat
    while n[i]<m do inc(i);
    while n[j]>m do dec(j);
    if i<=j then begin
      t:=n[i];n[i]:=n[j];n[j]:=t;
      inc(i);dec(j);
    end;
  until i>j;
  if i<r then qsort1(i,r);
  if l<j then qsort1(l,j);
end;

function dao(a:arr):arr;
var
	k:arr;i:longint;
begin
	for i:=1 to m do
		k[i]:=a[m-i+1];
	exit(k);
end;

begin
	readln(m,t);
	for i:=1 to m do readln(n[i]);
	for i:=1 to m do readln(a[i]);
	qsort1(1,m);
	if t=2 then n:=dao(n);
	ans:='';
	for i:=1 to m do
		if a[i]<=length(n[i]) then ans:=ans+n[i][a[i]];
	writeln(ans);
end.