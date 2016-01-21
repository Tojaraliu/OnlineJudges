Const
  fn='editor';
  inf=1<<29;

Type
  int=longint;

Var
  l,r,d,s,f:Array[0..2000000] of int;
  m,n,root,cur,now:int;
  ss:ansistring;

Procedure opf;
begin
  Assign(input,fn+'.in');reset(input);
  Assign(output,fn+'.out');rewrite(output);
end;

Procedure rot(x:int);
var
  y:int;
begin
  y:=f[x];f[x]:=f[y];f[y]:=x;
  if f[x]=0 then root:=x
  else if y=l[f[x]] then l[f[x]]:=x else r[f[x]]:=x;
  if x=l[y] then
  begin
    l[y]:=r[x]; f[r[x]]:=y; r[x]:=y;
  end
  else begin
    r[y]:=l[x]; f[l[x]]:=y; l[x]:=y;
  end;
  s[y]:=s[l[y]]+s[r[y]]+1;
  s[x]:=s[l[x]]+s[r[x]]+1;
end;

Procedure splay(x:int;var tar:int);
var
  y:int;
begin
  while x<>tar do begin
    y:=f[x];
    if y=tar then rot(x)
    else if (y=l[f[y]])and(x=l[y])or(y=r[f[y]])and(x=r[y]) then
    begin
      rot(y);rot(x);
    end
    else begin
      rot(x);rot(x);
    end;
  end;
end;

Procedure init;
begin
  m:=0;
  inc(m);
  f[m]:=0;r[m]:=m+1;l[m]:=0;d[m]:=-inf;s[m]:=2;
  inc(m);
  f[m]:=1;l[m]:=0;r[m]:=0;d[m]:=inf;s[m]:=1;
  root:=1;
end;

Procedure gets(l:int);
var
  ch:char;
  i:int;
begin
  ss:='';
  for i:=1 to l do begin
    read(ch);
    ss:=ss+ch;
    if eoln then readln;
  end;
end;

Function rank(k:int):int;
var
  i:int;
begin
  i:=root;
  while true do begin
    if s[l[i]]+1=k then exit(i);
    if s[l[i]]>=k then i:=l[i] else begin
      dec(k,s[l[i]]+1);i:=r[i];
    end;
  end;
end;

Procedure insert;
var
  i,len:int;
begin
  len:=length(ss);i:=l[r[root]];
  l[r[root]]:=m+1;
  for i:=1 to len do begin
    inc(m);l[m]:=0;r[m]:=m+1;s[m]:=len-i+1;f[m]:=m-1;d[m]:=ord(ss[i]);
    if i=1 then f[m]:=r[root];
    if i=len then r[m]:=0;
  end;
  splay(m-(len div 2),l[r[root]]);
end;

Function getmin(x:int):int;
begin
  while l[x]<>0 do x:=l[x];
  exit(x);
end;

Procedure print(x:int);
begin
  if x=0 then exit;
  print(l[x]);
  Write(chr(d[x]));
  print(r[x]);
end;

Procedure main;
var
  i,k,t:int;
  ch:char;
begin
  cur:=0;
  readln(n);
  for i:=1 to n do begin
    read(ch);
    case ch of
      'I':begin
            read(ch,ch,ch,ch,ch);readln(k);gets(k);
            t:=rank(cur+1);splay(t,root);
            t:=getmin(r[root]);splay(t,r[root]);
            insert;
            inc(s[root],length(ss));inc(s[r[root]],length(ss));
          end;
      'D':begin
            read(ch,ch,ch,ch,ch);readln(k);
            t:=rank(cur+1);splay(t,root);
            t:=rank(cur+k+2);splay(t,r[root]);
            dec(s[root],k);dec(s[r[root]],k);
            l[r[root]]:=0;
          end;
      'M':begin
            read(ch,ch,ch);readln(cur);
          end;
      'G':begin
            read(ch,ch);readln(k);
            t:=rank(cur+1);splay(t,root);
            t:=rank(cur+k+2);
            splay(t,r[root]);
            print(l[r[root]]);
            writeln;
          end;
      'P':begin
            readln(ch,ch,ch);dec(cur);
          end;
      'N':begin
            readln(ch,ch,ch);inc(cur);
          end;
    end;
  end;
end;

Begin
  //opf;
  init;
  main;
  close(output);
end.
