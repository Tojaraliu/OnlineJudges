var
  i,n,k:longint;
  a:array[1..100000]of longint;
begin
  readln(n);
  for i:=1 to n+1 do read(a[i]);
  k:=n;
  if a[1]=-1 then write('-','x^',n);
  if(a[1]<>0)and(a[1]<>1)and(a[1]<>-1)then write(a[1],'x^',n);
  if a[1]=1 then write('x^',n);
  dec(k);
  for i:=2 to n-1 do begin
    if a[i]=-1 then write('-','x^',k);
    if a[i]>0 then write('+');
    if(a[i]<>0)and(a[i]<>1)and(a[i]<>-1)then write(a[i],'x^',k);
    if a[i]=1 then write('x^',k);
    dec(k);
  end;
  if(a[n]<>0)and(abs(a[n])<>1)then begin
    if a[n]>0 then write('+',a[n],'x');
    if a[n]<0 then write(a[n],'x');
  end;
  if(a[n]<>0)and(abs(a[n])=1)then begin
    if a[n]=1 then write('+x');
    if a[n]=-1 then write('-x');
  end;
  if a[n+1]=0 then exit;
  if a[n+1]>0 then write('+',a[n+1]);
  if a[n+1]<0 then write(a[n+1]);
end.