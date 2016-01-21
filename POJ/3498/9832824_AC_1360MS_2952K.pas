Const
  maxn=510;
  inf=1<<29;

Type
  int=longint;
  
Var
  x,y,np,nj,h,vh,ans:Array[0..maxn]of int;
  n,sp,tp,num,cases,cc,sum,nwf:int; 
  ddd:extended;
  map,maps:Array[0..maxn,0..maxn]of int;
  
Function dist(i,j:int):extended;
begin
  exit(sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j])));
end;

Function min(x,y:int):int;
begin
  if x<y then exit(x); exit(y);
end;

Function aug(x,flow:int):int;
var 
  i,minh,last,delta:int;
begin
  if x=tp then exit(flow);
  last:=flow; minh:=num;
  for i:=1 to num do
    if map[x,i]>0 then begin
      if h[x]=h[i]+1 then begin
        delta:=min(map[x,i],last);
        delta:=aug(i,delta);
        dec(map[x,i],delta);
        inc(map[i,x],delta);
        dec(last,delta);
        if h[sp]>=num then exit;
        if last=0 then break;
      end;
      if h[i]<minh then minh:=h[i];
    end;
  if last=flow then begin
    dec(vh[h[x]]);
    if vh[h[x]]=0 then h[sp]:=num;
    h[x]:=minh+1;
    inc(vh[h[x]]);
  end;
  exit(flow-last);
end;

Procedure init;
var
  i,j:int;
begin
  fillchar(map,sizeof(map),0);
  readln(n,ddd);
  sp:=0;num:=n<<1+2;tp:=num;sum:=0;
  for i:=1 to n do begin
    readln(x[i],y[i],np[i],nj[i]);
    map[sp,i]:=np[i];map[i,i+n]:=nj[i];
    for j:=1 to i-1 do
      if dist(i,j)<=ddd then begin
        map[i+n,j]:=inf;
        map[j+n,i]:=inf;
      end;
    inc(sum,np[i]);
  end;
end;

Procedure main;
var
  i:int;
begin
  maps:=map; 
  ans[0]:=0;
  for i:=1 to n do begin
    fillchar(vh,sizeof(vh),0);fillchar(h,sizeof(h),0);
    map[i,tp]:=inf;
    vh[0]:=num;
    nwf:=0;
    while h[sp]<num do inc(nwf,aug(sp,inf));
    if nwf>=sum then begin
      inc(ans[0]);
      ans[ans[0]]:=i-1;
    end;
    map:=maps;
  end;
  if ans[0]=0 then write(-1) else begin
    write(ans[1]);
    for i:=2 to ans[0] do write(' ',ans[i]);
  end;
end;

Begin
  readln(cases);
  for cc:=1 to cases do begin
    init;
    main;
    writeln;
  end;
End.