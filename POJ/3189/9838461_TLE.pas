Const
  inf=1<<29;
  
Type
  int=longint;
  point=^link;
  link=record
    id,c:int;
    o,next:point;
  end;
  
Var
  a:Array[0..1234,0..22] of int;
  e:Array[0..1234] of point;
  ee:Array[0..1000000] of link;
  vh,h:Array[0..1234] of int;
  low,high,sp,tp,num,n,b,ans,ne:int;
  np:Array[0..22] of int;

Procedure add(x,y,z:int);
var
  p,q:point;
begin
  inc(ne);p:=@ee[ne];inc(ne);q:=@ee[ne];
  p^.id:=y;p^.o:=q;p^.c:=z;p^.next:=e[x];e[x]:=p;
  q^.id:=x;q^.o:=p;q^.c:=0;q^.next:=e[y];e[y]:=q;
end;

Procedure init;
var
  i,j,x:int;
begin
  readln(n,b);
  for i:=1 to n do begin
    for j:=1 to b do begin
      read(x);
      a[i,x]:=j;
    end;
    readln;
  end;
  for i:=1 to b do read(np[i]);
end;

Function min(x,y:int):int;
begin
  if x<y then exit(x);exit(y);
end;

Function aug(x,flow:int):int;
var 
  minh,delta,last:int; p:point;
begin
  if x=tp then exit(flow);
  last:=flow; minh:=num; p:=e[x];
  while p<>nil do with p^ do begin
    if c>0 then begin
      if h[id]+1=h[x] then begin
        if last<c then delta:=last else delta:=c;
        delta:=aug(id,delta);
        dec(last,delta);
        dec(c,delta);
        inc(o^.c,delta);
        if h[sp]>=num then exit(flow-last);
        if last=0 then break;
      end;
      if h[id]<minh then minh:=h[id];
    end;
    p:=next;
  end;
  if last=flow then begin
    dec(vh[h[x]]);
    if vh[h[x]]=0 then h[sp]:=num;
    h[x]:=minh+1;
    inc(vh[h[x]]);
  end;
  exit(flow-last);
end;

Procedure main;
var
  i,j,flow:int;
begin
  low:=1;high:=1;sp:=0;tp:=1111;num:=tp+1;ans:=inf;
  while (low<=high)and(high<=b) do begin
    fillchar(e,sizeof(e),0);fillchar(ee,sizeof(ee),0);ne:=0;
    for i:=1 to n do add(sp,i,1);
    for i:=1 to n do 
      for j:=1 to b do
        if (a[i,j]>=low)and(a[i,j]<=high) then add(i,j+n,1);
    for i:=1 to b do add(i+n,tp,np[i]);
    flow:=0;
    fillchar(h,sizeof(h),0);fillchar(vh,sizeof(vh),0);
    while h[sp]<num do inc(flow,aug(sp,inf));
    if flow=n then begin
      ans:=min(ans,high-low);
      inc(low);
    end else inc(high);
  end;
  writeln(ans+1);
end;

Begin
  init;
  main;
end.