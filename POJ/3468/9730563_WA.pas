Const
  inf=1<<29;
  
Type
  int=longint;
  Point=record
    l,r:int;
    sm,c:int64;
  end;
  
Var
  tree:Array[0..2000000] of point;
  n,q:int;
  
Procedure add(x,lf,rt:int;z:int64);
forward;

Procedure swap(var x,y:int);
var
  t:int;
begin
  t:=x;x:=y;y:=t;
end;

Procedure update(x:int);
begin
  tree[x].sm:=tree[x<<1].sm+tree[x<<1+1].sm;
end;

Procedure change(x,t:int);
begin
  with tree[x] do begin
    inc(c,t);
    inc(sm,t*int64(r-l+1));
  end;
end;

Procedure infosub(x:int);
begin
  if tree[x].l=tree[x].r then exit;
  if tree[x].c<>0 then begin
    change(x<<1,tree[x].c);
    change(x<<1+1,tree[x].c);
    tree[x].c:=0;
  end;
end;

Procedure build(x,lf,rt:int);
var
  mid:int;
  i:int;
begin
  with tree[x] do begin
    l:=lf;r:=rt;c:=0;
  end;
  if lf=rt then begin
    read(i);change(x,i);
  end
  else begin
    mid:=(lf+rt)>>1;
    build(x<<1,lf,mid);
    build(x<<1+1,mid+1,rt);
    update(x);
  end;
end;

Function ask(x,lf,rt:int):int64;
var
  mid,t:int;
begin
  with tree[x] do begin
    if (lf<=l)and(r<=rt) then exit(sm);
    infosub(x);
    mid:=(l+r)>>1;t:=0;
    if lf<=mid then inc(t,ask(x<<1,lf,rt));
    if rt>mid then inc(t,ask(x<<1+1,lf,rt));
  end;
  exit(t);
end;

Procedure solve;
var
  i,l,r,t:int;
  ch:char;
begin
  readln;
  For i:=1 to q do begin
    read(ch);
    case ch of
      'Q':begin
        readln(l,r);
        if l>r then swap(l,r);
        writeln(ask(1,l,r));
      end;
      'C':begin
        readln(l,r,t);
        if l>r then swap(l,r);
        add(1,l,r,t);
      end;
    end;
  end;
end;

procedure add(x,lf,rt:int;z:int64);
var
  mid:int;
begin
  with tree[x] do begin
    if (lf<=l)and(r<=rt) then change(x,z)
    else begin
      infosub(x);
      mid:=(l+r)>>1;
      if lf<=mid then add(x<<1,lf,rt,z);
      if rt>mid then add(x<<1+1,lf,rt,z);
      update(x);
    end;
  end;
end;

Begin
  readln(n,q);
  build(1,1,n);
  solve;
End.