var  
  n,k:longint;  
  a:array[0..100] of longint;  
  f:array[0..100,0..100] of longint;  
  sum:array[0..100,0..100] of longint;  
 
procedure init;  
var  
  i,j,data:longint;  
begin
  readln(n,k);
  for i:=1 to n do read(a[i]);
  for i:=1 to n do begin
    data:=0;
    for j:=i to n do begin  
      inc(data,a[j]);
      sum[i,j]:=data;  
    end; 
  end;
end;
  
function max(x,y:longint):longint;  
begin  
  if x>y then exit(x) else exit(y);  
end;  
  
procedure main;  
var  
  i,j,l:longint;  
begin  
  for i:=1 to n do f[i,0]:=sum[1,i];  
  for i:=1 to k do
    for j:=2 to n do
      for l:=1 to j-1 do  
        f[j,i]:=max(f[l,i-1]*sum[l+1,j],f[j,i]); 
end;  

begin  
  init;  
  main;
  writeln(f[n,k]);  
end.  