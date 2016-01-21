Const
  inf=1<<29;
  
Type
  int=longint;
  point=^link;
  link=record
    id,c:int;
    next,o:point;
  end;
  
Var
  e:Array[0..2000] of point;
  vh,h:Array[0..2000] of int;
  sp,tp,num,cc,cases,sumd,n,maxw:int;
  show:Array[0..2000,1..7] of boolean;
  d,w:Array[0..2000] of int;
  
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
  fillchar(e,sizeof(e),0);sumd:=0;
  fillchar(show,sizeof(show),0);maxw:=-inf;
  readln(n);
  for i:=1 to n do begin
    for j:=1 to 7 do begin
      read(x);
      if x=1 then show[i,j]:=true;
    end;
    readln(d[i],w[i]);inc(sumd,d[i]);
    if w[i]>maxw then maxw:=w[i];
  end;
end;

Procedure initgraph;
var
  i,j,k:int;
begin
  sp:=0;tp:=2000;
  for i:=1 to n do add(sp,i,d[i]);
  for i:=1 to maxw*7 do add(i+n,tp,1);
  for i:=1 to n do begin
    for j:=1 to 7 do begin
      if show[i,j] then begin
        for k:=1 to w[i] do add(i,(k-1)*7+j+n,1);
      end;
    end;
  end;
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

Procedure main;
var
  ans:int;
begin
  fillchar(vh,sizeof(vh),0);fillchar(h,sizeof(h),0);
  ans:=0;num:=tp+1;
  while h[sp]<num do inc(ans,aug(sp,inf));
  if ans=sumd then writeln('Yes') else writeln('No');
end;

Begin
  readln(cases);
  for cc:=1 to cases do begin
    init;
    initgraph;
    main;
  end;
end.