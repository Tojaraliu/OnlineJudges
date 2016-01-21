Type
  int=longint;

Var
  found:boolean;
  n,m,i,x,y,z,dlt,ans:int;
  d,v:array[0..200] of int;
  c:array[0..200,0..200] of int;

Procedure find(x:int);
var
  t,j,min:int;
begin
  if x=n then begin
    found:=true; inc(ans,dlt); exit;
    end;
  t:=dlt;
  for j:=1 to n do begin
    if (c[x,j]>0)and(d[j]+1=d[x]) then begin
      if c[x,j]<dlt then dlt:=c[x,j];
      find(j);
      if (found)or(d[1]=n) then break;
      dlt:=t;
    end;
  end;
  if found then begin
    dec(c[x,j],dlt);
    inc(c[j,x],dlt);
  end
  else begin
    min:=n-1;
    for j:=1 to n do if (c[x,j]>0)and(d[j]<min) then min:=d[j];
    dec(v[d[x]]);
    if v[d[x]]=0 then d[1]:=n;
    d[x]:=min+1;
    inc(v[d[x]]);
  end;
end;

Begin
  while not eof do begin
    readln(m,n);
    fillchar(c,sizeof(c),0);
    fillchar(d,sizeof(d),0);
    fillchar(v,sizeof(v),0);
    for i:=1 to m do begin
    readln(x,y,z); inc(c[x,y],z);
    end;
    v[0]:=n; ans:=0;
    while d[1]<n do begin
    dlt:=1<<29; found:=false;
    find(1);
    end;
    writeln(ans);
  end;
End.