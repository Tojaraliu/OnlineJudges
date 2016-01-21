Type
  int=longint;
  
Var
  l,r,col:Array[0..1000000] of int;
  flag:Array[0..1000000] of boolean;
  ans,n,m:int;
  
Procedure swap(var x,y:int);
var
  t:int;
begin
  t:=x;x:=y;y:=t;
end;

Procedure infosub(x:int);
begin
  if flag[x] then begin
    col[x<<1]:=col[x];flag[x<<1]:=true;
    col[x<<1+1]:=col[x];flag[x<<1+1]:=true;
    flag[x]:=false;
  end;
end;

Procedure paint(x,lf,rt,c:int);
var
  mid:int;
begin
  if (lf<=l[x])and(r[x]<=rt) then begin
    col[x]:=1<<(c-1);
    flag[x]:=true;
    exit;
  end;
  infosub(x);
  mid:=(l[x]+r[x])>>1;
  if lf<=mid then paint(x<<1,lf,rt,c);
  if rt>mid then paint(x<<1+1,lf,rt,c);
  col[x]:=col[x<<1] or col[x<<1+1];
end;

Procedure build(x,lf,rt:int);
var
  mid:int;
begin
  l[x]:=lf;r[x]:=rt;
  if lf=rt then exit;
  mid:=(lf+rt)>>1;
  build(x<<1,lf,mid);
  build(x<<1+1,mid+1,rt);
end;

Procedure init;
begin
  readln(n,m,m);
  build(1,1,n);
  fillchar(flag,sizeof(flag),false);
  col[1]:=1;
  flag[1]:=true;
end;

Function ask(x,lf,rt:int):int;
var
  mid,op:int;
begin
  op:=0;
  if flag[x] then exit(col[x]);
  if (lf<=l[x])and(r[x]<=rt) then exit(col[x]);
  mid:=(l[x]+r[x])>>1;
  if lf<=mid then op:=op or (ask(x<<1,lf,rt));
  if rt>mid then op:=op or (ask(x<<1+1,lf,rt));
  exit(op);
end;

Function trans(x:int):int;
var
  op:int;
begin
  op:=0;
  while x<>0 do begin
    if (x and 1)=1 then inc(op);
    x:=x>>1;
  end;
  exit(op);
end;

Procedure solve;
var
  i,x,y,z:int;
  ch:char;
begin
  for i:=1 to m do begin
    read(ch);
    case ch of 
      'C':begin
            readln(x,y,z);
            if x>y then swap(x,y);
            paint(1,x,y,z);
          end;
      'P':begin
            readln(x,y);
            if x>y then swap(x,y);
            ans:=ask(1,x,y);
            writeln(trans(ans));
          end;
    end;
  end;
end;

Begin
  init;
  solve;
end.