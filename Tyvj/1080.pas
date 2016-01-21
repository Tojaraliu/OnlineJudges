var
	pd:array[-10..130] of boolean;
	pd1:array[-260..260] of boolean;
	pd2:array[-260..260] of boolean;
  a:array[1..130] of shortint;
  s,n:longint;

procedure print;
var
  i:longint;
begin
	for i:=1 to n do
		begin
			write(a[i]);
			if i<>n then
        write(' ');
		end;
	writeln;
end;

procedure dfs(k:longint);
var
	i:longint;
begin
	for i:=1 to n do begin 
    if (not(pd[i]))and(not(pd1[k+i]))and(not(pd2[k-i])) then begin
      a[k]:=i;
      pd[i]:=true;
      pd1[k+i]:=true;
      pd2[k-i]:=true;
      if n=k then begin
        inc(s);
        if s<=3 then print;
				end
				else dfs(k+1);
				a[k]:=0;
				pd[i]:=false;
				pd1[k+i]:=false;
				pd2[k-i]:=false;
			end;
		end;
end;
begin
	readln(n);
  fillchar(a,sizeof(a),0);
  fillchar(pd,sizeof(pd),false);
  fillchar(pd2,sizeof(pd2),false);
  fillchar(pd1,sizeof(pd1),false);
	dfs(1);
  writeln(s);
end.
