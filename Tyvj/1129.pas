var
	i,k:shortint;
	n,maxn,maxd:shortint;
begin
        maxn:=0;
	for i:=1 to 7 do
		begin
			readln(k,n);
			inc(k,n);
                        if k>maxn
                                then begin maxd:=i;maxn:=k;end;
		end;
	writeln(maxd);
end.