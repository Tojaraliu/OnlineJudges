type
  arr=array[1..100] of longint;
var
  i,j,s,c,o,n,t:longint;
  stop,clos,open:arr;

procedure dfs(open,stop,clos:arr;o,s,c:longint);
var
	i:longint;
	sto,clo:arr;
begin
	if c=n then begin
		inc(t);
		if t>20 then exit;
		for i:=1 to n do write(clos[i]);
		writeln;
	end
    else begin
			sto:=stop;
			clo:=clos;
			if s>0 then begin
				inc(c);
				clos[c]:=stop[s];
				dec(s);
				dfs(open,stop,clos,o,s,c);
				clos:=clo;
				dec(c);inc(s);
			end;
		if o<=n then begin
			inc(s);
			stop[s]:=open[o];
			inc(o);
			dfs(open,stop,clos,o,s,c);
			stop:=sto;
			dec(o);
			dec(s);
		end;
    end;
end;
 begin

  read(n);
  t:=0;
  for i:=1 to n do open[i]:=i;
  fillchar(stop,sizeof(stop),0);
  fillchar(stop,sizeof(clos),0);
  o:=1;
  dfs(open,stop,clos,o,s,c);

end.