const
  maxn=50000;
var
  n,m,x,d,i,o:longint;
  l,r,c,maxl,maxr,maxs:array[0..maxn*4]of longint;
  
function max(x,y:longint):longint;
  begin
    if x>y then exit(x); exit(y);
  end;
function size(t:longint):longint;
  begin
    exit(r[t]-l[t]+1);
  end;
procedure transfer(t,k:longint);
  begin
    c[t]:=k;
    if k=1 then
      begin
        maxl[t]:=0; maxr[t]:=0; maxs[t]:=0;
      end
    else
      begin
        maxl[t]:=size(t); maxr[t]:=maxl[t]; maxs[t]:=maxl[t];
      end;
  end;
procedure spread(t:longint);
  begin
    if l[t]=r[t] then exit;
    if c[t]<0 then exit;
    transfer(t<<1,c[t]);
    transfer(t<<1 or 1,c[t]);
    c[t]:=-1;
  end;
procedure build(left,right,t:longint);
  var mid:longint;
  begin
    l[t]:=left; r[t]:=right;
    transfer(t,0);
    if l[t]=r[t] then exit;
    mid:=(l[t]+r[t])>>1;
    build(left,mid,t<<1);
    build(mid+1,right,t<<1 or 1);
  end;
procedure updata(left,right,k,t:longint);
  var mid:longint;
  begin
    if (left<=l[t]) and (r[t]<=right) then
      begin
        transfer(t,k); exit;
      end;
    spread(t);
    mid:=(l[t]+r[t])>>1;
    if left<=mid then updata(left,right,k,t<<1);
    if right>mid then updata(left,right,k,t<<1 or 1);
    maxl[t]:=maxl[t<<1];
    //if maxl[t<<1]=size(t<<1) then inc(maxl[t],maxl[t<<1 or 1]);
    maxr[t]:=maxr[t<<1 or 1];
    //if maxr[t<<1 or 1]=size(t<<1 or 1) then inc(maxr[t],maxr[t<<1]);
    maxs[t]:=max(max(maxs[t<<1],maxs[t<<1 or 1]),maxr[t<<1]+maxl[t<<1 or 1]);
  end;
function ask(t,d:longint):longint;
  begin
    writeln('asking ',l[t],' ',r[t],' ',maxl[t],' ',maxs[t],' ',maxr[t]);
    if maxs[t]<d then exit(0);
    if (l[t]=r[t]) then exit(l[t]);
    spread(t);
    if maxs[t<<1]>=d then exit(ask(t<<1,d));
    if maxr[t<<1]+maxl[t<<1 or 1]>=d then exit(r[t<<1]-maxr[t<<1]+1);
    exit(ask(t<<1 or 1,d));
  end;
begin
  readln(n,m);
  build(1,n,1);
  for i:=1 to m do
    begin
      read(o);
      if o=1 then
        begin
          readln(d);
          x:=ask(1,d);
          writeln(x);
          if x>0 then updata(x,x+d-1,1,1);
        end
      else
        begin
          readln(x,d);
          updata(x,x+d-1,0,1);
        end;
    end;
end.