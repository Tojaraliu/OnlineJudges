{
ID:ToJaRa
LANG:PASCAL
PROG:fracdec
}

Const
  fname='fracdec';

var
  a,b,i:longint;
  ans,s:ansistring;
  remandr:array[0..1000000]of longint;

procedure openf;
begin
  assign(input,fname+'.in');reset(input);
  assign(output,fname+'.out');rewrite(output);
end;

procedure closef;
begin
  close(input);close(output);
end;

procedure work;
begin
  str(a div b,ans);
  ans:=ans+'.';
  a:=a mod b*10;
  if a=0 then ans:=ans+'0'
  else repeat
    remandr[a]:=length(ans);
    str(a div b,s);
    ans:=ans+s;
    a:=a mod b*10;
    if remandr[a]<>0 then
      ans:=copy(ans,1,remandr[a])+'('+copy(ans,remandr[a]+1,length(ans)-remandr[a])+')';
  until(a=0)or(remandr[a]<>0);
  for i:=1 to length(ans) do begin
    write(ans[i]);
    if i mod 76=0 then writeln;
  end;
  writeln;
end;

Begin
  openf;
  read(a,b);
  work;
  closef;
End.