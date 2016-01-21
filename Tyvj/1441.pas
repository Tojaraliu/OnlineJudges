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
  if x='' then exit;
  write(y[length(y)]);
  p:=pos(y[length(y)],x); l:=length(x)-p;
  work(copy(x,1,p-1),copy(y,1,p-1));
  work(copy(x,p+1,255),copy(y,p,l));
end;

begin
  readln(s1);
  readln(s2);
  work(s1,s2);
  close(output);
end.
