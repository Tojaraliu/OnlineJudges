Const
  inf=1<<29;
  
Type
  int=longint;
  
Var
  a:Array[0..1000001] of extended;
  n,i:int;
  sum:extended;
  
Begin
  readln(n);
  for i:=1 to n do read(a[i]);
  sum:=1;
  for i:=1 to n-1 do begin
    if a[i]<a[i+1] then sum:=sum*(a[i+1]/a[i]);
  end;
  writeln(round(sum));
end.