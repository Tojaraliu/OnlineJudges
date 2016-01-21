var
	a,c,h:array[0..1000] of longint;
	f:array[0..100000] of boolean;
	i,j,k,n:longint;

procedure swap(var a,b:longint);
begin
	if a=b then exit;
	a:=a xor b;
	b:=a xor b;
	a:=a xor b;
end;

procedure qsort(l,r:longint);
var i,j:longint;m,t:longint;
begin
  i:=l;j:=r;m:=a[(l+r)div 2];
  repeat
    while a[i]<m do inc(i);
    while a[j]>m do dec(j);
    if i<=j then begin
      swap(a[i],a[j]);
	  swap(h[i],h[j]);
	  swap(c[i],c[j]);
      inc(i);dec(j);
    end;
  until i>j;
  if i<r then qsort(i,r);
  if l<j then qsort(l,j);
end;

begin
	read(n);
	for i:=1 to n do
		read(h[i],a[i],c[i]);
	qsort(1,n);
	fillchar(f,sizeof(f),false);
	f[0]:=true;

	for i:=1 to n do
		for j:=1 to c[i] do
		for k:=a[i] downto h[i] do
  			if f[k-h[i]] then f[k]:=true;
	for i:=100000 downto 0 do
		if f[i] then begin
			writeln(i);
			halt;
		end;
end.
