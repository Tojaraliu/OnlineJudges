{
ID:ToJaRa
LANG:PASCAL
PROG:calfflac
}
const
	inp='calfflac.in';
	outp='calfflac.out';
  alpha:set of char=['a'..'z','A'..'Z'];

type
  point=record
    p:longint;
    ch:char;
  end;
  arr=array[0..30000] of char;

var
  i,n,f,e,re,le,oi,oj,tf,te:longint;
  pal:arr;
  ss:ansistring;

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

procedure init;
var
  i:longint;
begin
  i:=0;
  while not eof do
  begin
    inc(i);
    read(pal[i]);
  end;
  n:=i;
end;

procedure work;
begin
  re:=0;
  for i:=1 to n do
    if pal[i] in alpha then begin
      f:=i;
      e:=i;
      le:=0;
      repeat
        tf:=f;te:=e;dec(f);inc(e);
        inc(le,2);
        while (f>=1) and not (pal[f] in alpha) do dec(f);
        while (e<=n) and not (pal[e] in alpha) do inc(e);
      until (f<1) or (e>n) or (upcase(pal[f])<>upcase(pal[e]));
      dec(le);
      if le>re then
      begin
        re:=le;oi:=tf;oj:=te;
      end;
      f:=i;e:=i+1;
      while (e<=n) and not (pal[e] in alpha) do inc(e);
      if (e>n) or (upcase(pal[f])<>upcase(pal[e])) then continue;
      le:=0;
      repeat
        tf:=f;te:=e;dec(f);inc(e);inc(le,2);
        while (f>=1) and not (pal[f] in alpha) do dec(f);
        while (e<=n) and not (pal[e] in alpha) do inc(e);
      until (f<1) or (e>n) or (upcase(pal[f])<>upcase(pal[e]));
      if le>re then begin
        re:=le;oi:=tf;oj:=te;
      end;
    end;
end;

begin
  openf;
  init;
  work;
  writeln(re);
  for i:=oi to oj do write(pal[i]);
  writeln;
  closef;
end.
