{
ID:ToJaRa
PROG:hamming
LANG:PASCAL
}

Const
  inp='hamming.in';
  outp='hamming.out';

Var
  f:array[0..64]of longint;
  n,b,d,i:longint;
  flag:boolean;

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

function work(x:longint):boolean;
var
  i:longint;
begin
  i:=0;
  while x>0 do begin
    if x and 1=1 then inc(i);
    x:=x>>1;
  end;
  if i>=d then exit(true) else exit(false);
end;

procedure init;
begin
  readln(n,b,d);
  f[0]:=1;f[1]:=0;
end;

procedure main;
var
  j:longint;
begin
  repeat
    inc(i);flag:=true;
    for j:=1 to f[0] do
      flag:=flag and (work(i xor f[j]));
    if flag then begin inc(f[0]);f[f[0]]:=i; end;
  until f[0]=n;
end;

procedure print;
var
  i:longint;
begin
  for i:=1 to f[0]-1 do begin
    write(f[i]);
    if i mod 10=0
      then writeln
      else write(' ');
  end;
  writeln(f[f[0]]);
end;

begin
  openf;
  init;
  main;
  print;
  closef;
end.
