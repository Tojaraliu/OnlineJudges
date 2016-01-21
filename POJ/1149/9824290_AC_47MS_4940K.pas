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
  e:Array[0..310] of point;
  vh,h:Array[0..310] of int;
  sp,tp,num:int;
  n,m:int;
  f:Array[0..1005,0..1005] of int;
  b,a:Array[0..310] of int;
  pig:Array[0..1005] of int;
  
Procedure add(x,y,z:int);
var
  p,q:point;
begin
  new(p);new(q);
  p^.id:=y;p^.o:=q;p^.c:=z;p^.next:=e[x];e[x]:=p;
  q^.id:=x;q^.o:=p;q^.c:=0;q^.next:=e[y];e[y]:=q;
end;
  
Procedure init;
var
  i,j,x:int;
begin
  readln(m,n);
  fillchar(f,sizeof(f),0);
  for i:=1 to m do read(pig[i]);
  for i:=1 to n do begin
    read(a[i]);
    for j:=1 to a[i] do begin
      read(x);
      inc(f[x,0]);f[x,f[x,0]]:=i;
    end;
    read(b[i]);
  end;
  sp:=0;tp:=305;num:=tp+1;
  for i:=1 to m do add(sp,f[i,1],pig[i]);
  for i:=1 to n do add(i,tp,b[i]);
  for i:=1 to m do 
    for j:=2 to f[i,0] do begin
      add(f[i,j-1],f[i,j],inf);
  end;
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
        delta:=aug(id,delta);dec(last,delta);
        dec(c,delta);inc(o^.c,delta);
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
  flow:int;
begin
  flow:=0;
  fillchar(vh,sizeof(vh),0);fillchar(h,sizeof(h),0);
  while h[sp]<num do inc(flow,aug(sp,inf));
  writeln(flow);
end;

Begin
  init;
  main;
end.