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
  e:Array[0..10050] of point;
  ee:Array[0..1000000] of link;
  vh,h:Array[0..10050] of int;
  n,m,sp,tp,num,ne:int;
  
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
  i,x,y,z:int;
begin
  readln(n,m);
  sp:=0;tp:=10005;num:=tp+1;ne:=0;
  for i:=1 to n do begin
    readln(x,y);
    add(sp,i,x);add(i,tp,y);
  end;
  for i:=1 to m do begin
    readln(x,y,z);
    add(x,y,z);add(y,x,z);
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
  flow:int;
begin
  flow:=0;
  fillchar(vh,sizeof(vh),0);fillchar(h,sizeof(h),0);
  while h[sp]<tp do inc(flow,aug(sp,inf));
  writeln(flow);
end;

Begin
  init;
  main;
end.