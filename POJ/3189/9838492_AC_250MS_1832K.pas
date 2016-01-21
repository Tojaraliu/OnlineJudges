type
  re=record
    x, y, c, next, ref: longint;
  end;
var
  i, j, k, n, b, t: longint;
  a: array[0..1001,0..21] of longint;
  g: array[0..100000] of re;
  first, vh, h: array[0..2005] of longint;
  low, high: longint;
  ans, agu: longint;
  flag: boolean;
  st, ed, tot: longint;
  r: array[0..21] of longint;
  min: longint;
 
procedure ins(xx,yy,cc: longint);
begin
  inc(tot);
  g[tot].x := xx;
  g[tot].y := yy;
  g[tot].c := cc;
  g[tot].ref := tot+1;
  g[tot].next := first[xx];
  first[xx] := tot;
 
  inc(tot);
  g[tot].y := xx;
  g[tot].x := yy;
  g[tot].c := 0;
  g[tot].ref := tot-1;
  g[tot].next := first[yy];
  first[yy] := tot;
end;
procedure dfs(x: longint);
var
  i, j, k, tmp, minh: longint;
begin
  tmp := agu;
  minh := n-1;
  if x=ed then begin
    flag := true;
    inc(ans,agu);
    exit;
  end;
  j := first[x];
  while j<>0 do begin
    if g[j].c>0 then begin
      k := g[j].y;
      if h[x]=h[k]+1 then begin
        if agu>g[j].c then agu := g[j].c;
        dfs(k);
        if h[st]=n then exit;
        if flag then break;
        agu := tmp;
      end;
      if minh>h[k] then minh := h[k];
    end;
    j := g[j].next;
  end;
 
  if not flag then begin
    dec(vh[h[x]]);
    if vh[h[x]]=0 then h[st] := n;
    h[x] := minh+1;
    inc(vh[h[x]]);
  end else begin
    inc(g[g[j].ref].c,agu);
    dec(g[j].c,agu);
  end;
end;
procedure print;
var
  i, j, k: longint;
begin
  for i := st to ed do begin
    writeln(i,':');
    j := first[i];
    while j<>0 do begin
      if g[j].c>0 then
      writeln(g[j].y,' ',g[j].c);
      j := g[j].next;
    end;
  end;
end;
 
begin
  readln(n,b);
  for i := 1 to n do
    for j := 1 to b do begin
      read(t);
      a[i,t] := j;
    end;
  for i := 1 to b do read(r[i]);
  low := 1;
  high := 1;
  st := 0;
  ed := n+b+1;
  min := maxlongint;
  while (low<=high) and (high<=b) do begin
    tot := 0;
    fillchar(first,sizeof(first),0);
    for i := 1 to n do ins(st,i,1);
    for i := 1 to n do
      for j := 1 to b do if (a[i,j]>=low) and (a[i,j]<=high) then ins(i,j+n,1);
    for i := 1 to b do ins(n+i,ed,r[i]);
    ans := 0;
    k := n;
    n := n+b+2;
    fillchar(h,sizeof(h),0);
    fillchar(vh,sizeof(vh),0);
    vh[0] := n;
    while h[st]<n do begin
      agu := maxlongint;
      flag := false;
      dfs(st);
    end;
    n := k;
    if ans=n then begin
      if high-low+1<min then min := high-low+1;
      inc(low);
    end else inc(high);
  end;
  writeln(min);
  close(input);
  close(output);
end.