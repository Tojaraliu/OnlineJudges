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
  e:Array[0..505] of point;
  vh,h:Array[0..500] of int;
  food,drink:Array[0..105,0..105] of int;
  n,f,d,sp,tp,num:int;
  
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
  readln(n,f,d);
  for i:=1 to n do begin
    read(food[i,0],drink[i,0]);
    for j:=1 to food[i,0] do read(food[i,j]);
    for j:=1 to drink[i,0] do read(drink[i,j]);
  end;
end;

Procedure initgraph;
var
  i,j:int;
begin
  sp:=0;tp:=500;num:=tp+1;
  for i:=1 to f do add(sp,i,1);
  for i:=1 to d do add(i+n+n+f,tp,1);
  for i:=1 to n do begin
    for j:=1 to food[i,0] do add(food[i,j],i+f,1);
    for j:=1 to drink[i,0] do add(i+n+f,drink[i,j]+n+n+f,1);
    add(i+f,i+f+n,1);
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
        delta:=Aug(Id,delta);Dec(Last,delta);
        Dec(C,delta);Inc(O^.c,delta);
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
  flow:int;
begin
  fillchar(h,sizeof(h),0);
  fillchar(vh,sizeof(vh),0);flow:=0;
  while h[sp]<num do inc(flow,aug(sp,inf));
  writeln(flow);
end;

Begin
  init;
  initgraph;
  main;
end.