Const
  inf=1<<29;
  
Type
  int=longint;
  point=^link;
  link=record
    id,v:int;
    next:point;
  end;
  
Var
  cnt,dis:Array[0..1011,0..1] of int;
  e:Array[0..1011] of point;
  v:Array[0..1011,0..1] of boolean;
  n,m,cases,cc,s,t:int;
  
Procedure add(x,y,z:int);
var
  p:point;
begin
  new(p);
  p^.id:=y;p^.v:=z;p^.next:=e[x];e[x]:=p;
end;

Procedure init;
var
  i,x,y,z:int;
begin
  readln(n,m);
  fillchar(e,sizeof(e),0);
  for i:=1 to m do begin
    readln(x,y,z);add(x,y,z);
  end;
  readln(s,t);
end;

Procedure main;
var
  i,j,min,minj,flag:int;
  p:point;
begin
  fillchar(v,sizeof(v),0);fillchar(cnt,sizeof(cnt),0);
  for i:=1 to n do begin
    dis[i,0]:=inf;dis[i,1]:=inf;
  end;
  cnt[s,0]:=1;dis[s,0]:=1;
  for i:=1 to (n<<1) do begin
    min:=inf;
    for j:=1 to n do begin
      if not(v[j,0])and(dis[j,0]<min) then begin
        minj:=j;flag:=0;
        min:=dis[j,0];
      end
      else if not(v[j,1])and(dis[j,1]<min) then begin
        minj:=j;flag:=1;
        min:=dis[j,1];
      end;
    end;
    if min=inf then break;
    v[minj,flag]:=true;
    p:=e[minj];
    while p<>nil do begin
      if dis[p^.id,0]>min+p^.v then begin//比最短路还短
        dis[p^.id,1]:=dis[p^.id,0];
        cnt[p^.id,1]:=cnt[p^.id,0];
        dis[p^.id,0]:=min+p^.v;
        cnt[p^.id,0]:=cnt[minj,flag];
      end 
      else if dis[p^.id,0]=min+p^.v then begin//和最短路一样短
        inc(cnt[p^.id,0],cnt[minj,flag]);
      end
      else if dis[p^.id,1]>min+p^.v then begin//比次短路短
        dis[p^.id,1]:=min+p^.v;
        cnt[p^.id,1]:=cnt[minj,flag];
      end
      else if dis[p^.id,1]=min+p^.v then begin
        inc(cnt[p^.id,1],cnt[minj,flag]);
      end;
      p:=p^.next;
    end;
  end;
  if (dis[t,1]=(dis[t,0]+1)) then inc(cnt[t,0],cnt[t,1]);
  writeln(cnt[t,0]);
end;

Begin
  readln(cases);
  for cc:=1 to cases do begin
    init;
    main;
  end;
End.