{
ID:ToJaRa
LANG:PASCAL
PROG:butter
}

Const
  inf=1<<28;
  fn='butter';

Type
  link=^node;
  node=record
    id,v:longint;
    next:link;
  end;

var
  q,cow:array[0..2000] of longint;
  dist:array[0..2000] of longint;
  e:array[0..2000] of link;
  v:array[0..2000] of boolean;
  n,p,c,ans:longint;

Procedure opf;
begin
  assign(input,fn+'.in');reset(input);
  assign(output,fn+'.out');rewrite(output);
end;

Procedure add(x,y,z:longint);
var
  p:link;
begin
  new(p);
  p^.id:=y;p^.v:=z;p^.next:=e[x];e[x]:=p;
end;

Procedure init;
var
  i,x,y,z:longint;
begin
  readln(n,p,c);
  for i:=1 to n do read(cow[i]);
  for i:=1 to c do begin
    read(x,y,z);
    add(x,y,z);add(y,x,z);
  end;
  ans:=inf;
end;

Procedure spfa(s:longint);
var
  pp:link;
  l,r,i,k:longint;
begin
  l:=0;r:=1;q[l]:=s;
  for i:=1 to p do dist[i]:=inf;
  fillchar(v,sizeof(v),false);
  dist[s]:=0;v[s]:=true;
  while l<>r do begin
    pp:=e[q[l]];
    while pp<>nil do begin
      if dist[pp^.id]>dist[q[l]]+pp^.v then begin
        dist[pp^.id]:=dist[q[l]]+pp^.v;
        if not(v[pp^.id]) then begin
          q[r]:=pp^.id;v[pp^.id]:=true;
          r:=(r+1) mod 2000;
        end;
      end;
      pp:=pp^.next;
    end;
    v[q[l]]:=false;l:=(l+1) mod 2000;
  end;
  k:=0;
  for i:=1 to n do begin
    inc(k,dist[cow[i]]);
    if k>ans then break;
  end;
  if k<ans then ans:=k;
end;

Procedure main;
var
  i:longint;
begin
  for i:=1 to p do spfa(i);
end;

begin
  opf;
  init;
  main;
  writeln(ans);
  close(output);
end.
