var
	ch,tot:array[0..300] of longint;
	v:array[0..300] of boolean;
	i,n,ma,en:longint;
	a:array[1..5] of longint;

procedure init;
begin
	readln(n);
	fillchar(ch,sizeof(ch),0);
	fillchar(tot,sizeof(ch),0);
	fillchar(v,sizeof(v),false);
	for i:=1 to n do begin
		read(ch[i],ma,en);
		v[i]:=true;
		tot[i]:=ch[i]+ma+en;
	end;
end;

procedure work;
var
	tch,ttot,i,j,k:longint;
begin
	for i:=1 to 5 do begin
		for j:=1 to n do
			if v[j] then begin
				tch:=ch[j];
				k:=j;
				ttot:=tot[j];
				a[i]:=j;
				break;   
			end;
		for j:=k to n do
			if ((tot[j]>ttot)or((tot[j]=ttot)and(ch[j]>tch))or((tot[j]=ttot)and(ch[j]=tch)and(j<a[i])))and(v[j])
				then begin
					a[i]:=j;
					tch:=ch[j];ttot:=tot[j];
				end;
		v[a[i]]:=false;
	end;
end;

procedure print;
var
	i:longint;
begin
	for i:=1 to 5 do writeln(a[i],' ',tot[a[i]]);
end;

begin
	init;
	work;
	print;
end.