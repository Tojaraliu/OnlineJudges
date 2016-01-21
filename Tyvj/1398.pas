const zb:array[1..8,1..2]of integer=((-1,0),(-1,1),(0,1),(1,1),(1,0),(1,-1),(0,-1),(-1,-1));
var a,b:array[0..1001,0..1001]of char;
  m,n,t,i,j,k,g:integer;
function change(i,j:integer):integer;
var k:integer;
begin
  change:=0;
  for k:=1 to 8 do
    if a[i+zb[k,1],j+zb[k,2]]='1' then inc(change);
end;
begin
{assign(input,'xx');
assign(output,'x');
reset(input);
rewrite(output);}
  readln(m,n,t);
  for i:=1 to n do begin
    for j:=1 to m do read(a[i,j]);
    readln;
  end;
  for k:=2 to t do begin
    b:=a;
    for i:=1 to n do for j:=1 to m do begin
      g:=change(i,j);
      case a[i,j] of
        '1':if(g<2)or(g>3)then b[i,j]:='0' else b[i,j]:='1';
        '0':if g=3 then b[i,j]:='1' else b[i,j]:='0';
      end;
    end;
    a:=b;
  end;
  for i:=1 to n do begin
    for j:=1 to m do write(a[i,j]);
    writeln;
  end;
 { close(input);
  close(output);}
end.