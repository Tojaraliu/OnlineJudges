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
  e:Array[0..500] of point;
  f:Array[0..500,0..500] of int;//Floyd
  vh,h:Array[0..500] of int;
  sp,tp,k,c,m,num:int;

Procedure add(x,y,z:int);
var
  p,q:point;
begin
  new(p);new(q);
  p^.id:=y;p^.o:=q;p^.c:=z;p^.next:=e[x];e[x]:=p;
  q^.id:=x;q^.o:=p;q^.c:=0;q^.next:=e[y];e[y]:=q;
end;

Function min(x,y:int):int;
begin
  if x<y then exit(x);exit(y);
end;

Procedure init;
var
  i,j:int;
begin
  readln(k,c,m);
  fillchar(f,sizeof(f),$7f);
  for i:=1 to k+c do begin
    for j:=1 to k+c do begin
      read(f[i,j]);
      if (f[i,j]=0) then f[i,j]:=inf;
    end;
  end;
  sp:=0;tp:=500;num:=tp+1;
end;

Function aug(x,flow:int):int;
var
  minh,dlt,last:int;
  p:point;
begin
  if x=tp then exit(flow);
  last:=flow;minh:=num;p:=e[x];
  while p<>nil do with p^ do begin
    if c>0 then begin
      if h[id]+1=h[x] then begin
        dlt:=min(last,c);dlt:=aug(id,dlt);
        dec(last,dlt);dec(c,dlt);inc(o^.c,dlt);
        if h[sp]>num then exit(flow-last);
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

Procedure floyd;
var
  i,j,l:int;
begin
  for l:=1 to k+c do
    for i:=1 to k+c do 
      for j:=1 to k+c do 
        if f[i,j]>f[i,l]+f[l,j] then f[i,j]:=f[i,l]+f[l,j];
end;

Function check(x:int):boolean;
var
  flow,i,j:int;
begin
  fillchar(e,sizeof(e),0);
  for i:=1 to c do add(sp,i,1);
  for i:=c+1 to c+k do add(i,tp,m);
  for i:=1 to c do
    for j:=c+1 to c+k do
      if f[i,j]<=x then add(i,j,1);
  //initgraph
  fillchar(h,sizeof(h),0);
  fillchar(vh,sizeof(vh),0);
  flow:=0;
  while h[sp]<num do inc(flow,aug(sp,inf));
  if flow=c then exit(true);
  exit(false);
end;

Function find(l,r:int):int;
Var
  mid:int;
begin
  if l=r then exit(l);
  mid:=(l+r)>>1;
  if check(mid) then exit(find(l,mid));
  exit(find(mid+1,r));
end;

Begin
  init;
  floyd;
  writeln(find(1,inf));
end.