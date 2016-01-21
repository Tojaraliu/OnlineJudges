{
ID:ToJaRa
LANG:PASCAL
PROG:beads
}
const
	inp='beads.in';
	outp='beads.out';

Var
  a:array[0..1000] of char;
  n,ans:longint;

procedure init;
var
  i:longint;
begin
  readln(n);
  for i:=1 to n do read(a[i]);
end;

procedure work;
var
  i,j,k:longint;
  fr,fb:boolean;
begin
  ans:=0;
  for i:=1 to n do begin
    k:=0;j:=i;fr:=true;fb:=true;
    while (fr or fb) do begin
      if a[j]='r' then fb:=false;
      if a[j]='b' then fr:=false;
      inc(j);
      if j>n then j:=1;
      if j=i then break;
    end;
    k:=(j-i+n-1) mod n;
    fr:=true;fb:=true;j:=i-1;
    while (fr or fb) do begin
      if j=0 then j:=n;
      if j=i then break;
      if a[j]='r' then fb:=false;
      if a[j]='b' then fr:=false;
      dec(j);
    end;
    inc(k,(i+n-j-2) mod n);
    if ans<k then ans:=k;
  end;
end;

procedure print;
begin
  if ans>n then ans:=n;
  writeln(ans);
end;

begin
	assign(input,inp);reset(input);
	assign(output,outp);rewrite(output);
  init;
  work;
  print;
  close(input);
  close(output);
end.
