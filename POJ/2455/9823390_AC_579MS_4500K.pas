Const
  inf=1<<29;
  
Type
  int=longint;
  point=^link;
  link=record
    id,c:int;
    o,next:point;
  end;
  edge=record
    u,v,len:int;
  end;
  
Var
  e:Array[0..305] of point;
  ee:Array[0..200000] of link;
  vh,h:Array[0..305] of int;
  b:Array[0..40011] of edge;
  n,m,k,sp,tp,num,ans,ne:int;
  
Procedure sort(l,r:int);
var
  t:edge;
  i,j,mid:int;
begin
  i:=l;j:=r;mid:=b[i].len;
  repeat
    while b[i].len<mid do inc(i);
    while b[j].len>mid do dec(j);
    if i<=j then begin
      t:=b[i];b[i]:=b[j];b[j]:=t;
      inc(i);dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

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
  i:int;
begin
  readln(n,m,k);
  for i:=1 to m do with b[i] do begin
    readln(u,v,len);
  end;
  sort(1,m);
  sp:=0;tp:=300;num:=tp+1;
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
        dec(last,delta);dec(c,delta);inc(o^.c,delta);
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

Function check(x:int):boolean;
var
  i:int;
begin
  fillchar(e,sizeof(e),0);
  fillchar(ee,sizeof(ee),0);ne:=0;
  for i:=1 to x do with b[i] do begin
    add(u,v,1);add(v,u,1);
  end;
  add(sp,1,inf);add(n,tp,inf);
  fillchar(vh,sizeof(vh),0);fillchar(h,sizeof(h),0);
  ans:=0;
  while h[sp]<num do inc(ans,aug(sp,inf));
  if ans>=k then exit(true);
  exit(false);
end;

Procedure main;
var
  l,r,mid:int;
begin
  l:=1;r:=m;
  while l<>r do begin
    mid:=(l+r)>>1;
    if check(mid) then r:=mid else l:=mid+1;
  end;
  writeln(b[l].len);
end;

Begin
  init;
  main;
end.