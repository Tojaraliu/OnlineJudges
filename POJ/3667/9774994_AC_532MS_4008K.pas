Const
  maxn=50001;
  inf=1<<29;
  
Type
  int=longint;
  
Var
  c,l,r,maxl,maxr,maxs:Array[0..maxn*20] of int;
  n,m:int;

Function size(x:int):int;
begin exit(r[x]-l[x]+1);end;

Function max(x,y:int):int;
begin
  if x>y then exit(x);exit(y);
end;

Procedure change(x,k:int);
begin
  c[x]:=k;
  if k=1 then begin
    maxl[x]:=0;maxr[x]:=0;maxs[x]:=0;
  end 
  else begin
    maxl[x]:=r[x]-l[x]+1; maxr[x]:=maxl[x]; maxs[x]:=maxl[x];
  end;
end;

Procedure infosub(x:int);
begin
  if l[x]=r[x] then exit;
  if c[x]<0 then exit;
  change(x<<1,c[x]);
  change(x<<1 or 1,c[x]);
  c[x]:=-1;
end;

Procedure build(x,lf,rt:int);
Var
  mid:int;
begin
  l[x]:=lf;r[x]:=rt;change(x,0);
  if lf=rt then exit;
  mid:=(l[x]+r[x])>>1;
  build(x<<1,lf,mid);build(x<<1 or 1,mid+1,rt);
end;

Procedure update(x,lf,rt,col:int);
var
  mid:int;
begin
  if (lf<=l[x])and(r[x]<=rt) then begin
    change(x,col);exit;
  end;
  infosub(x);
  mid:=(l[x]+r[x])>>1;
  if lf<=mid then update(x<<1,lf,rt,col);
  if mid<rt then update(x<<1 or 1,lf,rt,col);
  maxl[x]:=maxl[x<<1];
  if maxl[x<<1]=size(x<<1) then inc(maxl[x],maxl[x<<1 or 1]);
  maxr[x]:=maxr[x<<1 or 1];
  if maxl[x<<1 or 1]=size(x<<1 or 1) then inc(maxr[x],maxr[x<<1]);
  maxs[x]:=max(max(maxs[x<<1],maxs[x<<1 or 1]),maxr[x<<1]+maxl[x<<1 or 1]);
end;

Function ask(x,d:int):int;
begin
  //writeln('asking ',l[x],' ',r[x],' ',maxl[x],' ',maxs[x],' ',maxr[x]);
  if maxs[x]<d then exit(0);
  if l[x]=r[x] then exit(l[x]);
  infosub(x);
  if maxs[x<<1]>=d then exit(ask(x<<1,d));
  if maxr[x<<1]+maxl[x<<1 or 1]>=d then exit(r[x<<1]-maxr[x<<1]+1);
  exit(ask(x<<1 or 1,d));
end;

Procedure main;
var
  i,fl,x,y:int;
begin
  for i:=1 to m do begin
    read(fl);
    if fl=1 then begin
      readln(x);
      y:=ask(1,x);
      writeln(y);
      if y>0 then update(1,y,y+x-1,1);
    end
    else begin
      readln(x,y);
      update(1,x,x+y-1,0);
    end;
  end;
end;

Begin
  readln(n,m);
  build(1,1,n);
  main;
End.