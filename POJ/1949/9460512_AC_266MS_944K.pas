Const
  fn='chore';
  inf=1<<29;

Type
  int=longint;

Var
  n,ans:int;
  time:array[0..15000] of int;

Function max(x,y:int):int;
begin
  if x>y then exit(x);exit(y);
end;

Procedure main;
var
  tmp,p,len,i,j,maxt,m:int;
begin
  read(n);ans:=0;
  for i:=1 to n do begin
    read(len,m);maxt:=0;
    for j:=1 to m do begin
      read(p);
      maxt:=max(maxt,time[p]);
    end;
    time[i]:=len+maxt;
    ans:=max(ans,time[i]);
  end;
  writeln(ans);
end;

Begin
  main;
End.