Const
  inf=1<<29;
  maxn=200;
  
Type
  int=longint;
  point=^link;
  link=record
    id,c:int;
    o,next:point;
  end;
  
Var
  e:Array[0..maxn+20] of point;
  vh,h:Array[0..maxn+20] of int;
  n,m,sp,tp,num,ans:int;

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
  i,x,y,z:int;
begin
  fillchar(e,sizeof(e),0);
  readln(n,m);
  for i:=1 to n do begin
    readln(x,y,z);add(x,y,z);
  end;
end;

Function aug(x,flow:int):int;
var
  minh,delta,last:int;
  p:point;
begin
  if x=tp then exit(flow);
  last:=flow;minh:=num;p:=e[x];
  while p<>nil do with p^ do begin
    if c>0 then begin
      if h[id]+1=h[x] then begin
        delta:=min(last,c);
        delta:=aug(id,delta);
        dec(last,delta);dec(c,delta);inc(o^.c,delta);
        if h[sp]>=num then exit(flow-last);
        if last=0 then break;
      end;
      minh:=min(minh,h[id]);
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
begin
  sp:=1;tp:=m;num:=tp+1;ans:=0;
  fillchar(h,sizeof(h),0);
  fillchar(vh,sizeof(vh),0);
  while h[sp]<num do inc(ans,aug(sp,inf));
  writeln(ans);
end;

Begin
  while not(eof) do begin
    init;
    main;
  end;
end.