Type
  int=longint;

var 
  found:boolean;
  n,m,i,x,y,z,dlt,ans:longint;
  d,di,vh:array[0..200]of longint;
  a:array[1..200,1..200]of longint;

procedure find(i:longint);
var 
  t,tj,j,min:longint;
begin
  if i=n then begin
    found:=true; inc(ans,dlt); exit;
  end;
  t:=dlt;
  for j:=di[i] to n do begin
    if a[i,j]>0 then begin
      if d[j]+1=d[i] then begin
        if a[i,j]<dlt then dlt:=a[i,j];
        find(j);
        if (found)or(d[1]=n) then break;
        dlt:=t;
      end;
    end;
  end;
  if found then begin
    di[i]:=j;
    dec(a[i,j],dlt);
    inc(a[j,i],dlt);
  end else begin
    min:=n-1;
    for j:=1 to n do
      if (a[i,j]>0)and(d[j]<min) then begin
        tj:=j; min:=d[j];
      end;
    di[i]:=tj;
    dec(vh[d[i]]);
    if vh[d[i]]=0 then d[1]:=n;
    d[i]:=min+1;
    inc(vh[d[i]]);
  end;
end;

begin
  while not eof do begin
    readln(m,n);
    fillchar(a,sizeof(a),0);
    for i:=1 to m do begin
      readln(x,y,z); inc(a[x,y],z);
    end;
    for i:=1 to n do di[i]:=1;
    fillchar(d,sizeof(d),0);
    fillchar(vh,sizeof(vh),0);
    vh[0]:=n; ans:=0;
    while d[1]<n do begin
      dlt:=1<<29; found:=false;
      find(1);
    end;
    writeln(ans);
  end;
end.