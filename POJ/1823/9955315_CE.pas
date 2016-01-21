Uses math;

Const
  inf=1<<29;

Type
  int=longint;

Var
  l,r,mx,lfree,rfree:Array[0..40000] of int;
  n,p:int;

Procedure build(x,lf,rt:int);
var
  mid:int;
begin
  l[x]:=lf;r[x]:=rt;mx[x]:=rt-lf+1;lfree[x]:=mx[x];rfree[x]:=mx[x];
  if lf=rt then exit;
  mid:=(lf+rt)>>1;
  build(x<<1,lf,mid);build(x<<1 or 1,mid+1,rt);
end;

Procedure infosub(x:int);
begin
  if mx[x]=r[x]-l[x]+1 then begin
    mx[x<<1]:=r[x<<1]-l[x<<1]+1;
    lfree[x<<1]:=mx[x<<1];rfree[x<<1]:=mx[x<<1];
    mx[x<<1 or 1]:=r[x<<1 or 1]-l[x<<1 or 1]+1;
    lfree[x<<1 or 1]:=mx[x<<1 or 1];rfree[x<<1 or 1]:=mx[x<<1 or 1];
  end;
  if mx[x]=0 then begin
    mx[x<<1]:=0;
    lfree[x<<1]:=mx[x<<1];rfree[x<<1]:=mx[x<<1];
    mx[x<<1 or 1]:=0;
    lfree[x<<1 or 1]:=mx[x<<1 or 1];rfree[x<<1 or 1]:=mx[x<<1 or 1];
  end;
end;

Procedure update(x:int);
begin
  lfree[x]:=lfree[x<<1];
  if lfree[x<<1]=r[x<<1]-l[x<<1]+1 then begin
    inc(lfree[x],lfree[x<<1 or 1]);
  end;
  rfree[x]:=rfree[x<<1 or 1];
  if rfree[x<<1 or 1]=r[x<<1 or 1]-l[x<<1 or 1]+1 then begin
    inc(rfree[x],rfree[x<<1]);
  end;
  mx[x]:=max(lfree[x],rfree[x]);
  mx[x]:=max(max(mx[x<<1],mx[x<<1 or 1]),mx[x]);
  mx[x]:=max(mx[x],rfree[x<<1]+lfree[x<<1 or 1]);
end;

Procedure change(x,lf,rt,flag:int);
var
  mid:int;
begin
  if (lf<=l[x])and(r[x]<=rt) then begin
    mx[x]:=(r[x]-l[x]+1)*flag;
    lfree[x]:=mx[x];rfree[x]:=mx[x];
    exit;
  end;
  infosub(x);
  mid:=(l[x]+r[x])>>1;
  if lf<=mid then change(x<<1,lf,rt,flag);
  if mid<rt then change(x<<1 or 1,lf,rt,flag);
  update(x);
end;

Procedure main;
var
  i,opt,x,y:int;
begin
  for i:=1 to p do begin
    read(opt);
    case opt of
      1:begin
          read(x,y);
          change(1,x,x+y-1,0);
        end;
      2:begin
          read(x,y);
          change(1,x,x+y-1,1);
        end;
      3:begin
          writeln(mx[1]);
        end;
    end;
    write;
  end;
end;

Begin
  readln(n,p);
  build(1,1,n);
  main;
end.
