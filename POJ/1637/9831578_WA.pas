const
  inf=1<<29;
  maxn=501;
type
  link=^node;
  node=record
    id,c:longint;
    next,o:link;
  end;
var
  e:array[0..maxn]of link;
  ind,oud,h,vh:array[0..maxn]of longint;
  test,n,m,i,j,x,y,z,sp,tp,num,flow,sum:longint;
function min(x,y:longint):longint;
  begin
    if x<y then exit(x); exit(y);
  end;
procedure add(x,y,z:longint);
  var p,q:link;
  begin
    new(p); new(q);
    p^.id:=y; q^.id:=x;
    p^.c:=z; q^.c:=0;
    p^.o:=q; q^.o:=p;
    p^.next:=e[x]; q^.next:=e[y];
    e[x]:=p; e[y]:=q;
  end;
function aug(x,flow:longint):longint;
  var p:link; minh,delta,last:longint;
  begin
    if x=tp then exit(flow);
    last:=flow; minh:=num; p:=e[x];
    while p<>nil do with p^ do begin
      if c>0 then begin
        if h[x]=h[id]+1 then begin
          delta:=min(c,last);
          delta:=aug(id,delta);
          dec(last,delta);
          dec(c,delta);
          inc(o^.c,delta);
          if h[sp]>=num then exit(flow-last);
          if last=0 then break;
        end;
        minh:=min(minh,h[id]);
      end;
      p:=next;
    end;
    if last=flow then begin
      dec(vh[h[x]]);
      if vh[h[x]]=0 then h[sp]:=num;
      h[x]:=minh+1;
      inc(vh[h[x]]);
    end;
    exit(flow-last);
  end;
procedure remove(x:longint);
  var p:link;
  begin
    while e[x]<>nil do begin
      p:=e[x]; e[x]:=e[x]^.next; dispose(p);
    end;
  end;
procedure solve;
begin
  readln(n,m);
  fillchar(ind,sizeof(ind),0);
  fillchar(oud,sizeof(oud),0);
  sp:=0; tp:=n+1; num:=tp+1; sum:=0;
  for i:=1 to m do begin
    read(x,y,z); inc(ind[y]); inc(oud[x]);
    if z=0 then add(x,y,1);
  end;
  for i:=1 to n do begin
    if abs(oud[i]-ind[i]) and 1=1 then begin
      writeln('impossible');
      for j:=0 to tp do remove(j);
      exit;
    end;
    if oud[i]>ind[i] then add(i,tp,(oud[i]-ind[i])>>1);
    if ind[i]>oud[i] then add(sp,i,(ind[i]-oud[i])>>1);
    inc(sum,abs(oud[i]-ind[i])>>1);
  end;
  fillchar(h,sizeof(h),0);
  fillchar(vh,sizeof(vh),0);
  flow:=0; vh[0]:=num;
  while h[sp]<num do inc(flow,aug(sp,inf));
  if flow<<1=sum then writeln('possible') else writeln('impossible');
  for i:=0 to tp do remove(i);
end;
begin
  readln(test);
  while test>0 do begin
    dec(test); solve;
  end;
end.