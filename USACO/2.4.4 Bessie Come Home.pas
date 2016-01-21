{
ID:ToJaRa
LANG:PASCAL
PROG:comehome
}

Const
  fname='comehome';
  inf=1<<29;

var
  map:array[0..52,0..52] of longint;
  n:longint;

function dx(ch:char):boolean;
begin
  if (ch in ['A'..'Z']) then exit(true);exit(false);
end;

function min(x,y:longint):longint;
begin
  if x<y then exit(x);exit(y);
end;

procedure openf;
begin
  assign(input,fname+'.in');reset(input);
  assign(output,fname+'.out');rewrite(output);
end;

procedure closef;
begin
  close(input);close(output);
end;

procedure init;
var
  i,j,s,e,dis:longint;
  ch1,ch2:char;
begin
  for i:=1 to 52 do 
    for j:=1 to 52 do map[i,j]:=maxlongint;
  readln(n);
  for i:=1 to n do begin
    read(ch1);read(ch2);read(ch2);readln(dis);
    if dx(ch1) then s:=ord(ch1)-64 else s:=ord(ch1)-70;
    if dx(ch2) then e:=ord(ch2)-64 else e:=ord(ch2)-70;
    map[s,e]:=min(map[s,e],dis);
    map[e,s]:=min(map[e,s],map[s,e]);
  end;
end;

procedure work;
var
  i,j,k,ans:longint;
  ansch:char;
begin
  for k:=1 to 52 do
    for i:=1 to 52 do
      if k<>i then
        for j:=1 to 52 do
          if (k<>j) and (i<>j) then
            if (map[i,k]<>maxlongint) and (map[k,j]<>maxlongint) then
              map[i,j]:=min(map[i,j],map[i,k]+map[k,j]);
  ans:=maxlongint;
  for i:=1 to 25 do
    if map[i,26]<ans then begin ans:=map[i,26]; ansch:=chr(i+64); end;
  writeln(ansch,' ',ans);
end;

Begin
  openf;
  init;
  work;
  closef;
End.
