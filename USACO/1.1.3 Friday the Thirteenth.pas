{
ID:ToJaRa
LANG:PASCAL
PROG:friday
}
const
	inp='friday.in';
	outp='friday.out';

Var
	mon:array[1..12] of longint=(31,28,31,30,31,30,31,31,30,31,30,31);
  n:longint;
  ans:array[0..6] of longint;

function rn(x:longint):boolean;
begin
  if (x mod 400)=0 then exit(true);
  if ((x mod 4)=0)and((x mod 100)<>0) then exit(true);
  exit(false);
end;

procedure init;
begin
  readln(n);
end;

procedure work;
var
  i,j,t:longint;
begin
  t:=0;
  for i:=1900 to 1900+n-1 do begin
    if rn(i) then mon[2]:=29 else mon[2]:=28;
    for j:=1 to 12 do begin
      inc(ans[(t+13) mod 7]);
      inc(t,mon[j]);
    end;
  end;
end;

procedure print;
begin
  writeln(ans[6],' ',ans[0],' ',ans[1],' ',ans[2],' ',ans[3],' ',ans[4],' ',ans[5]);
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
