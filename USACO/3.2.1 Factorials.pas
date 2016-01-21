{
ID:ToJaRa
LANG:PASCAL
PROG:fact4
}

Const
  fname='fact4';

var
  n,ans:longint;

procedure openf;
begin
  assign(input,fname+'.in');reset(input);
  assign(output,fname+'.out');rewrite(output);
end;

procedure work;
var
  i:longint;
begin
  ans:=1;
  for i:=1 to n do begin
    ans:=ans*i;
    while (ans mod 10)=0 do ans:=ans div 10;
    ans:=ans mod 10000;
  end;
  writeln(ans mod 10);
end;

begin
  openf;
  readln(n);
  work;
  close(output);
end.