Const
  inf=1<<29;
  
Type
  int=longint;
  
Var
  n,m:int;
  fl,fr,sum:Array[0..1100,0..1100] of int;
  cos,dis:Array[0..1100] of int;
  
Procedure init;
var
  i,j:int;
begin
  read(n,m);
  for i:=1 to n do read(dis[i],cos[i]);
  fillchar(sum,sizeof(sum),0);
  for i:=1 to n do sum[i,i]:=cos[i];
  for i:=1 to n do
    for j:=i+1 to n do sum[i,j]:=sum[i,j-1]+sum[j,j];
end;

Function min(x,y:int):int;
begin
  if x<y then exit(x);exit(y);
end;

Procedure main;
var
  i,j,t,k:int;
begin
  fillchar(fl,sizeof(fl),$3f);fl[m,m]:=0;
  fillchar(fr,sizeof(fr),$3f);fr[m,m]:=0;
  for k:=1 to n-1 do begin
    for i:=1 to n-k do begin
      j:=i+k;
      if (i<=m)and(m<=j) then begin
        t:=sum[1,i]+sum[j+1,n];
        fl[i,j]:=min(fl[i+1,j]+abs(dis[i+1]-dis[i])*t,
                     fr[i+1,j]+abs(dis[j]-dis[i])*t);
        t:=sum[1,i-1]+sum[j,n];
        fr[i,j]:=min(fl[i,j-1]+abs(dis[i]-dis[j])*t,
                     fr[i,j-1]+abs(dis[j]-dis[j-1])*t);
      end;
    end;
  end;
  writeln(min(fl[1,n],fr[1,n]));
end;

Begin
  init;
  main;
end.