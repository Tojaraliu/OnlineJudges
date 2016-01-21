{
ID:ToJaRa
LANG:PASCAL
PROG:gift1
}
const
	inp='gift1.in';
	outp='gift1.out';

Var
	name:array[0..11] of string;
  mon:array[0..11] of longint;
  np:longint;

procedure init;
var
  i:longint;
begin
  readln(np);
  for i:=1 to np do readln(name[i]);
end;

procedure work;
var
  s:string;
  t1,t2,i,j,k,nt,mt:longint;
begin
  fillchar(mon,sizeof(mon),0);
  for i:=1 to np do begin
    readln(s);readln(t1,t2);
    if (t2=0) then continue;
    for j:=1 to np do
      if name[j]=s then begin nt:=j;break;end;
    mt:=t1 div t2;dec(mon[nt],mt*t2);
    for j:=1 to t2 do begin
      readln(s);
      for k:=1 to np do
        if name[k]=s then break;
      inc(mon[k],mt);
    end;
  end;
end;

procedure print;
var
  i:longint;
begin
  for i:=1 to np do writeln(name[i],' ',mon[i]);
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
