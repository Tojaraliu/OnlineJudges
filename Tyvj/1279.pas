var 
	n,i,j,l,a,b,p:longint;
	lift,step:array[0..201] of longint;
begin
    read(n,a,b);
    for i:=1 to n do read(lift[i]);
    for i:=1 to n do step[i]:=-1;
	step[a]:=0;p:=0; l:=1;
    while (l>0) and (step[b]=-1) do
    begin
        l:=0;
        for i:=1 to n do
			if step[i]=p then begin
				j:=i-lift[i];
				if (j>0) and (step[j]=-1) then begin
					step[j]:=p+1;
					inc(l);
				end;
				j:=i+lift[i];
				if (j<=n) and (step[j]=-1) then	begin
					step[j]:=p+1;
					inc(l);
				end;
			end;
		inc(p);
    end;
	write(step[b]);
end.