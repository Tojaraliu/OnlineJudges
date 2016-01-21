var a:array[1..10000]of longint;
  i,k,j,l,m,n,min1,min2,min1z,min2z,ans:longint;
begin
  readln(n);
  for i:=1 to n do read(a[i]);
  while n>1 do begin
    min1:=maxlongint;
    for i:=1 to n do
      if a[i]<min1 then begin min1z:=i;min1:=a[i];end;
    min2:=maxlongint;
    for i:=1 to n do
      if(a[i]<min2)and(i<>min1z)then begin min2z:=i;min2:=a[i];end;
    ans:=ans+min1+min2;
    a[min1z]:=min1+min2;
    a[min2z]:=a[n];
    dec(n);
  end;
  writeln(ans);
end.