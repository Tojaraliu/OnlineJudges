{
ID:ToJaRa
LANG:PASCAL
PROG:spin
}

var
  i,j,k,t,s:longint;
  v:array[1..5] of longint;
  m,w:array[1..5,0..359] of boolean;
begin
  assign(input,'spin.in');reset(input);
  assign(output,'spin.out');rewrite(output);
  for i:=1 to 5 do begin
    read(v[i]);
    read(t);
    for j:=1 to t do begin
      read(s,t);
      for k:=s to s+t do w[i,k mod 360]:=true;
    end;
    readln;
  end;
  for i:=0 to 359 do begin
    for j:=1 to 5 do
      for k:=0 to 359 do m[j,(k+v[j]*i) mod 360]:=w[j,k];
    for k:=0 to 359 do begin
      for j:=1 to 5 do
      if not m[j,k] then break;
      if m[j,k] then break;
    end;
    if m[j,k] then break;
  end;
  if m[j,k] then writeln(i)
  else writeln('none');
  close(input);
  close(output);
end.
