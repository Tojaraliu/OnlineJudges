var
	n,m,min,ans:longint;
	i,j,k:longint;
	cost,up:array[0..5000] of longint;
begin
	readln(n,m);ans:=0;
	for i:=1 to n do read(cost[i],up[i]);
	for i:=1 to m do begin
		min:=maxlongint;
		for j:=1 to n do
			if min>=cost[j] then begin
				min:=cost[j];k:=j;
			end;
		inc(ans,min);
		inc(cost[k],up[k]);
	end;
	writeln(ans);
end.