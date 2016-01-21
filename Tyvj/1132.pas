var 
	tot,m,i,j:longint;
	s:string;
	a,b:array[1..30]of longint;
begin 
	readln(s);readln(s);
  tot:=0;m:=0;j:=0;
  for i:=1 to length(s) do begin
    case s[i] of
      'A':begin inc(m);inc(j);a[j]:=m;end;
      'B':begin
        inc(m);inc(tot);b[tot]:=m; {push}
        if tot>5 then begin writeln('No');halt;end;
      end;
      'C':begin
        if tot=0 then begin writeln('No');halt;end;
        inc(j);a[j]:=b[tot];dec(tot); {pop}
      end;
    end;
  end;
  writeln('Yes');
  for i:=1 to j do writeln(a[i]);
end.