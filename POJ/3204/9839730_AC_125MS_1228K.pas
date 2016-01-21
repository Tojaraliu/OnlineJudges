Const
  inf=1<<29;
  
Type
  int=longint;
  point=^link;
  link=record
    id,c:int;
    f:boolean;
    o,next:point;
  end;
  
Var
  e:Array[0..550] of point;
  vh,h:Array[0..550] of int;
  n,m,sp,tp,num,ans:int;
  v:Array[0..550] of int;
  
Procedure add(x,y,z:int);
var
  p,q:point;
begin
  new(p);new(q);
  p^.id:=y;p^.o:=q;p^.c:=z;p^.f:=true;p^.next:=e[x];e[x]:=p;
  q^.id:=x;q^.o:=p;q^.c:=0;q^.f:=false;q^.next:=e[y];e[y]:=q;
end;

Procedure init;
var
  i,x,y,z:int;
begin
  readln(n,m);
  for i:=1 to m do begin
    readln(x,y,z);
    add(x,y,z);
  end;
  sp:=0;tp:=n-1;num:=tp+1;
end;

Function aug(x,flow:int):int;
var
  last,dlt,minh:int;
  p:point;
begin
  if x=tp then exit(flow);
  last:=flow;minh:=num;p:=e[x];
  while p<>nil do with p^ do begin
    if c>0 then begin
      if h[id]+1=h[x] then begin
        if last<c then dlt:=last else dlt:=c;
        dlt:=aug(id,dlt);
        dec(last,dlt);dec(c,dlt);inc(o^.c,dlt);
        if h[sp]>num then exit(flow-last);
        if last=0 then break;
      end;
      if h[id]<minh then minh:=h[id];
    end;
    p:=p^.next;
  end;
  if last=flow then begin
    dec(vh[h[x]]);
    if vh[h[x]]=0 then h[sp]:=num;
    h[x]:=minh+1;
    inc(vh[h[x]]);
  end;
  exit(flow-last);
end;

Procedure nwf;
var
  flow:int;
begin
  flow:=0;
  fillchar(vh,sizeof(vh),0);fillchar(h,sizeof(h),0);
  while h[sp]<num do inc(flow,aug(sp,inf));
end;

Procedure flood1(x:int);
var
  p:point;
begin
  v[x]:=1;
  p:=e[x];
  while p<>nil do begin
    if (p^.c>0)and(v[p^.id]=0)and(p^.f) then begin
      flood1(p^.id);
    end;
    p:=p^.next;
  end;
end;

Procedure flood2(x:int);
var
  p:point;
begin
  v[x]:=2;
  p:=e[x];
  while p<>nil do begin
    if (not(p^.f))and(p^.o^.c>0)and(v[p^.id]=0) then begin
      flood2(p^.id);
    end;
    p:=p^.next;
  end;
end;

Procedure main;
var
  i:int;
  p:point;
begin
  ans:=0;
  for i:=0 to n-1 do begin
    p:=e[i];
    while p<>nil do begin
      if (p^.f) then begin
        if (v[i]=1)and(v[p^.id]=2) then inc(ans);
      end;
      p:=p^.next;
    end;
  end;
  writeln(ans);
end;

Begin
  init;
  nwf;
  fillchar(v,sizeof(v),0);
  flood1(sp);
  flood2(tp);
  main;
end.