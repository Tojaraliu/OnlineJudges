Const
  inf=1<<29;

Type
  int=longint;
  point=^link;
  link=Record
    id,c:int;
    o,next:point;
  end;
  
Var
  e:Array[0..5010] of point;
  vh,h:Array[0..5010] of int;
  v:Array[0..5010] of boolean;
  n,m,sp,tp,ans,num:int;
  sum:int64;
  
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
  i,x,y:int;
begin
  readln(n,m);sum:=0;
  sp:=0;tp:=5005;num:=tp+1;
  for i:=1 to n do begin
    read(x);
    if x>0 then begin
      inc(sum,x);add(sp,i,x);
    end
    else add(i,tp,-x);
  end;
  for i:=1 to m do begin
    read(x,y);add(x,y,inf);
  end;
end;

Function Aug(X,Flow:int):int64;
Var 
  minh:int; 
  last,delta:int64;
  p:point;
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

Procedure dfs(x:int);
var
  p:point;
begin
  p:=e[x];
  v[x]:=true;
  while p<>nil do begin
    if not(v[p^.id])and(p^.c>0) then dfs(p^.id);
    p:=p^.next;
  end;
end;

Procedure main;
var
  i:int;
  flow:int64;
begin
  flow:=0;
  fillchar(h,sizeof(h),0);fillchar(vh,sizeof(vh),0);
  fillchar(v,sizeof(v),false);ans:=0;
  while h[sp]<num do inc(flow,aug(sp,inf));
  dfs(sp);
  for i:=1 to n do if v[i] then inc(ans);
  writeln(ans,' ',sum-flow);
end;

Begin
  init;
  main;
end.