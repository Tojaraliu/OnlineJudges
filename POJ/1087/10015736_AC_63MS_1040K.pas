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
  soc:Array[0..1000] of string;
  dev:Array[0..1000] of int;
  changer:Array[0..1000,0..1] of int;
  e:Array[0..1000] of point;
  vh,h:Array[0..1000] of int;
  sp,tp,num,n,m,k,numsoc,ans:int;
  
Function find(ss:string):int;
var
  i:int;
begin
  for i:=1 to numsoc do
    if soc[i]=ss then exit(i);
  exit(-1);
end;

Procedure add(x,y,z:int);
var
  p,q:point;
begin
  new(p);new(q);
  p^.id:=y;p^.o:=q;p^.c:=z;p^.next:=e[x];e[x]:=p;
  q^.id:=x;q^.o:=p;q^.c:=0;q^.next:=e[y];e[y]:=q;
  //writeln(x,' ',y,' ',z);
end;

Function min(x,y:int):int;
begin
  if x<y then exit(x);exit(y);
end;

Procedure init;
var
  i,t,t1,t2:int;
  ch:char;
  s,s1,s2:string;
begin
  readln(n);numsoc:=n;
  for i:=1 to n do readln(soc[i]);
  readln(m);
  for i:=1 to m do begin
    while true do begin
      read(ch);
      if ch=' ' then break;
    end;
    readln(s);
    t:=find(s);
    if t=-1 then begin
      inc(numsoc);soc[numsoc]:=s;
      dev[i]:=numsoc;
    end else dev[i]:=t;
  end;
  readln(k);
  for i:=1 to k do begin
    readln(s);
    s1:=copy(s,1,pos(' ',s)-1);s2:=copy(s,pos(' ',s)+1,length(s));
    t1:=find(s1);
    if t1=-1 then begin
      inc(numsoc);soc[numsoc]:=s1;
      changer[i,0]:=numsoc;
    end else changer[i,0]:=t1;
    t2:=find(s2);
    if t2=-1 then begin
      inc(numsoc);soc[numsoc]:=s2;
      changer[i,1]:=numsoc;
    end else changer[i,1]:=t2;
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
  i:int;
begin
  //for i:=1 to numsoc do writeln(soc[i]+'#');
  //for i:=1 to k do writeln(changer[i,0],'->',changer[i,1]);
  sp:=0;tp:=995;num:=tp+1;
  for i:=1 to m do add(sp,i,1);//writeln;
  for i:=m+1 to m+n do add(i,tp,1);//writeln;
  for i:=1 to m do add(i,dev[i]+m,1);//writeln;
  for i:=1 to k do add(changer[i,0]+m,changer[i,1]+m,inf);//writeln;
  ans:=0;
  fillchar(h,sizeof(h),0);
  fillchar(vh,sizeof(vh),0);
  while h[sp]<num do inc(ans,aug(sp,inf));
  writeln(m-ans); 
end;

Begin
  init;
  main;
end.