{
ID:ToJaRa
LANG:PASCAL
PROG:heritage
}

const
  fn='heritage';

Type
  int=longint;
  bool=boolean;

var
  s1,s2:string;

Procedure opf;
begin
  assign(input,fn+'.in');reset(input);
  assign(output,fn+'.out');rewrite(output);
end;

Procedure work(x,y:string);
var
  p,l:int;
begin
  p:=pos(y[1],x);l:=length(x)-p;
  if p-1>0 then work(copy(x,1,p-1),copy(y,2,p-1));
  if l>0 then work(copy(x,p+1,l),copy(y,p+1,l));
  if y<>'' then write(y[1]);
end;

begin
  opf;
  readln(s1);
  readln(s2);
  work(s1,s2);
  writeln;
  close(output);
end.
