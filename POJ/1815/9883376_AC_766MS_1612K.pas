Const
  inf=1<<29;
  maxn=210;
  noans='NO ANSWER!';

Type
  int=longint;
  point=^link;
  link=record
    id,c:int;
    o,next:point;
  end;

Var
  e:Array[0..maxn*2] of point;
  ee:Array[0..maxn*maxn] of link;
  vh,h:Array[0..maxn*2] of int;
  ne,sp,tp,num:int;
  //networkflow
  f:Array[0..maxn,0..maxn] of boolean;
  mark,ans:Array[0..maxn] of int;
  s,t,n,flow,ansn:int;
  
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
  readln(n,s,t);
  fillchar(f,sizeof(f),false);
  for i:=1 to n do
    for j:=1 to n do begin
      read(x);
      if x=1 then f[i,j]:=true;
  end;
  sp:=0;tp:=maxn<<1-5;num:=tp+1;
  if f[s,t] then begin
    writeln(noans);halt;
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

Function nwf:int;
var
  op:int;
begin
  op:=0;
  fillchar(h,sizeof(h),0);
  fillchar(vh,sizeof(vh),0);
  while h[sp]<num do inc(op,aug(sp,inf));
  exit(op);
end;

Procedure makegraph;
var
  i,j,x,y:int;
begin
  ne:=0;
  fillchar(ee,sizeof(ee),0);fillchar(e,sizeof(e),0);
  for i:=1 to n do begin
    if mark[i]=1 then continue;
    for j:=1 to n do begin
      if mark[j]=1 then continue;
      if (i<>j)and(f[i,j]) then begin
        if i=s then x:=sp else if i=t then x:=tp else x:=i+n;
        if j=s then y:=sp else if j=t then y:=tp else y:=j;
        add(x,y,inf);
      end;
    end;
    if (i<>s)and(i<>t) then add(i,i+n,1);
  end;
end;

Procedure main;
var
  i,j,tmp,tt:int;
begin
  fillchar(mark,sizeof(mark),0);
  makegraph;
  flow:=nwf;
  if flow=0 then begin writeln(0);halt;end;
  tmp:=flow;
  for i:=1 to n do begin
    if (i=s)or(i=t) then continue;
    mark[i]:=1;
    makegraph;
    tt:=nwf;
    if (tt<tmp) then tmp:=tt else mark[i]:=0;
    if tmp=0 then break;
  end;
  writeln(flow);
  ansn:=0;
  for i:=1 to n do
    if mark[i]=1 then begin inc(ansn);ans[ansn]:=i;end;
  for i:=1 to ansn-1 do write(ans[i],' ');writeln(ans[ansn]);
end;

Begin
  init;
  main;
end.