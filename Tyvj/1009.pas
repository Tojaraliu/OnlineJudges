var
  m,n,i,j,k,x,y,h,tmp,maxx,maxy:longint;
  map:array[1..1000,1..1000]of char;
  a:array[1..50,1..50]of integer;
procedure print;
var i,j:longint;
begin
  for i:=1 to maxx do begin
    for j:=1 to maxy do write(map[i,j]);
    if i<>maxx then writeln;
  end;
end;
procedure draw(x,y:longint);
begin
  map[x,y]:='+';map[x,y+1]:='-'; map[x,y+2]:='-';map[x,y+3]:='-';map[x,y+4]:='+';{+---+}
  dec(x);
  map[x,y]:='|';map[x,y+1]:=' '; map[x,y+2]:=' ';map[x,y+3]:=' ';map[x,y+4]:='|';{|   |/}
  map[x,y+5]:='/';dec(x);
  map[x,y]:='|';map[x,y+1]:=' '; map[x,y+2]:=' ';map[x,y+3]:=' ';map[x,y+4]:='|';{|   | +}
  map[x,y+5]:=' ';map[x,y+6]:='+';dec(x);
  map[x,y]:='+';map[x,y+1]:='-'; map[x,y+2]:='-';map[x,y+3]:='-';map[x,y+4]:='+';{+---+ |}
  map[x,y+5]:=' ';map[x,y+6]:='|';dec(x); inc(y);
  map[x,y]:='/';map[x,y+1]:=' '; map[x,y+2]:=' ';map[x,y+3]:=' ';map[x,y+4]:='/';{/   /|}
  map[x,y+5]:='|';dec(x);inc(y);
  map[x,y]:='+';map[x,y+1]:='-'; map[x,y+2]:='-';map[x,y+3]:='-';map[x,y+4]:='+';{+---+}
end;
begin
  fillchar(map,sizeof(map),'.');
  readln(m,n);
  maxy:=n*4+1+m*2;
  maxx:=0;
  for i:=1 to m do begin
    tmp:=0;
    for j:=1 to n do begin
      read(a[i,j]);
      if a[i,j]>tmp then tmp:=a[i,j];
    end;
    tmp:=tmp*3+3+(m-i)*2;
    if tmp>maxx then maxx:=tmp;
    readln;
  end;
  for i:=1 to m do
    for j:=1 to n do begin
      x:=maxx-(m-i)*2;
      y:=(m-i)*2+(j-1)*4+1;
      for k:=1 to a[i,j] do draw(x-(k-1)*3,y);
    end;
  print;
end.