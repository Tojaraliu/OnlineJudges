{
ID:ToJaRa
PROG:milk3
LANG:PASCAL
}

var
  f:array[0..20,0..20,0..20]of boolean;
  af,bf,cf,a,b,c,max,i:longint;
  o:array[0..21] of boolean;

procedure pp(var d,e,ef:longint);
forward;

procedure ss;
begin
  if f[a,b,c] then exit;
  f[a,b,c]:=true;
  pp(a,b,bf);
  pp(a,c,cf);
  pp(b,a,af);
  pp(b,c,cf);
  pp(c,a,af);
  pp(c,b,bf);
end;

procedure pp(var d,e,ef:longint);
var
  dd,ee:longint;
begin
  dd:=d;ee:=e;
  if d>ef-e then begin
    d:=d-ef+e;
    e:=ef;
    ss;d:=dd;e:=ee;
    exit
  end;
  e:=e+d;d:=0;ss;d:=dd;e:=ee;
end;

begin
  assign(input,'milk3.in');
  assign(output,'milk3.out');
  reset(input);rewrite(output);
  readln(af,bf,cf);c:=cf;
  ss;max:=0;
  fillchar(o,sizeof(o),false);
  for af:=0 to cf do
    if f[0,cf-af,af] then begin o[af]:=true;if af>max then max:=af;end;
  for i:=0 to max-1 do 
    if o[i] then write(i,' ');
  writeln(max);
  close(input);
  close(output);
end.
