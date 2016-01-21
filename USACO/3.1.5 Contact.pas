{
ID:ToJaRa
LANG:PASCAL
PROG:contact
}
type
  node=record
    code:string[12];
    r,time:longint;
  end;
  
var
  a:array[1..12,0..4095] of node;
  b:array[0..100000] of node;
  i,j,k,m,n,p,q,t:longint;
  s:ansistring;
  ss:string;
  
function turn(ss:string):longint;
var 
  k:longint;
begin
  turn:=0;
  for k:=length(ss) downto 1 do
    turn:=turn+(ord(ss[k])-48)<<(length(ss)-k);
end;

function check(s,s1:string):boolean;
begin
  if length(s)<length(s1) then exit(true);
  if length(s)>length(s1) then exit(false);
  if s<s1 then exit(true);exit(false);
end;

function check2(s,s1:string):boolean;
begin
  if length(s)>length(s1) then exit(true);
  if length(s)<length(s1) then exit(false);
  if s>s1 then exit(true);exit(false);
end;

procedure sort(x,y:longint);
var
  temp,mid:node;
  xx,yy:longint;
begin
  xx:=x;yy:=y;
  mid:=b[(xx+yy) div 2];
  repeat
     while (b[xx].time>mid.time) or (b[xx].time=mid.time) and check(b[xx].code,mid.code) do inc(xx);
     while (b[yy].time<mid.time) or (b[yy].time=mid.time) and check2(b[yy].code,mid.code) do dec(yy);
     if xx<=yy then
     begin
       temp:=b[xx];b[xx]:=b[yy];b[yy]:=temp;
       inc(xx);dec(yy);
     end;
  until xx>yy;
  if yy>x then sort(x,yy);
  if xx<y then sort(xx,y);
end;

procedure init;
begin
  assign(input,'contact.in');reset(input);
  assign(output,'contact.out');rewrite(output);
  readln(p,q,t);
  s:='';
  while not eof do
  begin
     readln(ss);
     s:=s+ss;
  end;
end;

procedure main;
begin
  n:=0;
  for i:=p to length(s) do begin
    for j:=p to q do begin
      if (i<j) then break;
      ss:=copy(s,i-j+1,j);
      m:=turn(ss);
      a[j,m].code:=ss;
      if (a[j,m].time=0) then begin
        inc(n);a[j,m].r:=n;b[n]:=a[j,m];
      end;
      inc(a[j,m].time);inc(b[a[j,m].r].time);
    end;
  end;
  sort(1,n);
end;

procedure print;
begin
  k:=0;n:=0;j:=0;
  b[0].time:=maxlongint;
  while (k<=t) and (j<length(s)) do begin
    inc(j);
    if (b[j].time=0) then break;
    if (b[j].time=b[j-1].time) then begin
      if n=6 then begin
        writeln;write(b[j].code);n:=1;
      end 
      else begin
        write(' ',b[j].code); inc(n);
      end;
    end
    else begin
      if k=t then break;
      if k<>0 then writeln;
      writeln(b[j].time);
      write(b[j].code);
      inc(k);n:=1;
    end;
  end;
  writeln;
  close(input);close(output);
end;

begin
  init;
  main;
  print;
end.