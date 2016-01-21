Const
  inf=1<<29;
  s1='possible';
  s2='impossible';

Type
  int=longint;
  point=^link;
  link=record
    id,c:int;
    o,next:point;
  end;

Var
  e:Array[0..505] of point;
  ee:Array[0..505*505] of link;
  vh,h:Array[0..505] of int;
  sp,tp,num:int;
  ind,oud:Array[0..505] of int;
  sum,ans,cc,cases,ne,n,m:int;
  flag:boolean;
  
Function min(x,y:int):int;
begin
  if x<y then exit(x);exit(y);
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
  i,x,y,z:int;
begin
  fillchar(ind,sizeof(ind),0);fillchar(oud,sizeof(oud),0);
  fillchar(e,sizeof(e),0);fillchar(ee,sizeof(ee),0);
  ne:=0;
  sp:=0;tp:=500;num:=tp+1;sum:=0;
  readln(n,m);
  for i:=1 to m do begin
    readln(x,y,z);inc(ind[y]);inc(oud[x]);
    if z=0 then add(x,y,1);
  end;
  flag:=true;
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
        delta:=min(last,c);
        delta:=Aug(Id,delta);
        Dec(Last,delta);
        Dec(C,delta);
        Inc(O^.c,delta);
        If h[sp]>=num Then Exit(flow-last);
        If last=0 Then break;
      End;
      minh:=min(minh,h[id]);
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

Procedure initgraph;
var
  i:int;
begin
  sum:=0;
  for i:=1 to n do begin
    if (abs(ind[i]-oud[i]) and 1)=1 then begin
      flag:=false;writeln(s2);exit;
    end;
    if oud[i]>ind[i] then add(i,tp,(oud[i]-ind[i])>>1);
    if ind[i]>oud[i] then add(sp,i,(ind[i]-oud[i])>>1);
    inc(sum,abs(ind[i]-oud[i])>>1);
  end;
end;

Procedure main;
begin
  ans:=0;
  fillchar(vh,sizeof(vh),0);fillchar(h,sizeof(h),0);
  while h[sp]<num do inc(ans,aug(sp,inf));
  if ans<<1=sum then writeln(s1) else writeln(s2);
end;

Begin
  readln(cases);
  for cc:=1 to cases do begin
    init;
    initgraph;
    if flag then main;
  end;
end.