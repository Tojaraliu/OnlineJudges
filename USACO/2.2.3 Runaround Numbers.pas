{
ID:ToJaRa
PROG:runround
LANG:PASCAL
}

Const
  inp='runround.in';
  outp='runround.out';

Var
  n:longint;
  s:string;
  f:array[0..10] of boolean;
  
procedure openf;
begin
  assign(input,inp);reset(input);
  assign(output,outp);rewrite(output);
end;

procedure closef;
begin
  close(input);
  close(output);
end;

function check(n:longint):boolean;
var
  i,j,k,m:longint;
begin
  fillchar(f,sizeof(f),0);
  str(n,s);
  for i:=1 to length(s) do if f[ord(s[i])-48] then exit(false) else f[ord(s[i])-48]:=true;
  m:=1;k:=1;fillchar(f,sizeof(f),1);f[1]:=false;
  repeat
    inc(k);
    m:=(m+ord(s[m])-48) mod length(s);
    if m=0 then m:=length(s);
    if f[m] then f[m]:=false else if (k<>length(s)) and (m<>1) then exit(false);
  until k=length(s)+1;
  if m=1 then exit(true) else exit(false);
end;

procedure init;
begin
  readln(n);
  inc(n);
end;

procedure main;
begin
  while 0=0 do begin
    if check(n) then begin
      writeln(n);closef;halt;
    end;
    inc(n);
  end;
end;

begin
  openf;
  init;
  main;
  closef;
end.
