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
  sp,tp,k,c,m,num,maxd:int;

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
  i,j:int;
begin
  readln(k,c,m);
  for i:=1 to k+c do begin
    for j:=1 to k+c do begin
      read(f[i,j]);
      if (f[i,j]=0) then f[i,j]:=inf;
    end;
  end;
  sp:=0;tp:=350;num:=tp+1;
end;

Function Aug(X,Flow:int):int;
Var 
  minh,delta,last:int; p:point;
Begin
  If x=tp Then Exit(flow);
  last:=flow; minh:=num; p:=e[x];
  While p<>Nil Do With p^ Do Begin
    If c>0 Then Begin
      If h[id]+1=h[x] Then Begin
        If last<c Then delta:=last Else delta:=c;
        delta:=Aug(Id,delta);
        Dec(Last,delta);
        Dec(C,delta);
        Inc(O^.c,delta);
        If h[sp]>=num Then Exit(flow-last);
        If last=0 Then break;
      End;
      If h[id]<minh Then minh:=h[id];
    End;
    p:=next;
  End;
  If last=flow Then Begin
    Dec(Vh[H[X]]);
    If vh[h[x]]=0 Then h[sp]:=num;
    h[x]:=minh+1;
    Inc(Vh[H[X]]);
  End;
  Exit(flow-last);
End;

Procedure floyd;
var
  i,j,l:int;
begin
  for l:=1 to k+c do
    for i:=1 to k+c do 
      for j:=1 to k+c do 
        if f[i,j]>f[i,l]+f[l,j] then f[i,j]:=f[i,l]+f[l,j];
  maxd:=-inf;
  for i:=1 to k do
    for j:=k+1 to k+c do if (f[i,j]>maxd)and(f[i,j]<>inf) then maxd:=f[i,j];
end;

Function check(x:int):boolean;
var
  flow,i,j:int;
begin
  fillchar(e,sizeof(e),0);
  for i:=1 to k do add(sp,i,m);//Sp to each machine
  for i:=k+1 to k+c do add(i,tp,1);//Each cow to Tp
  for i:=1 to k do
    for j:=k+1 to k+c do begin
      if f[j,i]<=x then add(i,j,1);
  end;
  //initgraph
  fillchar(h,sizeof(h),0);
  fillchar(vh,sizeof(vh),0);
  flow:=0;
  while h[sp]<num do inc(flow,aug(sp,inf));
  if flow=c then exit(true);
  exit(false);
end;

Procedure main;
Var
  mid,l,r:int;
begin
  l:=1;r:=maxd;
  while l<>r do begin
    mid:=(l+r)>>1;//writeln('checking ',mid);
    if check(mid) then r:=mid else l:=mid+1;
  end;
  writeln(l);
end;

Begin
  init;
  floyd;
  main;
end.