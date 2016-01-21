var
	s,cht:string;
	ch:char;
	l,r:array['A'..'Z'] of longint;
	n,i,j,k,t,len:longint;
	
function gcd(a,b:longint):longint;
begin
	if a=0 then exit(b);
	if b=0 then exit(a);
	exit(gcd(b,a mod b));
end;
	
begin
	readln(n);
	fillchar(l,sizeof(l),0);
	fillchar(r,sizeof(r),0);
	for i:=1 to n do begin
		readln(s);j:=1;
		if (s[1] in ['A'..'Z']) then s:='1'+s;
		while length(s)>j do begin
			if (s[j+1] in ['A'..'Z'])and(s[j] in['=','+'])
				then insert('1',s,j+1);
			inc(j);
		end;
		j:=1;k:=pos('=',s);
		while j<=k do begin
			while not(s[j] in ['A'..'Z']) do inc(j);
			val(copy(s,1,j-1),t);
			inc(l[s[j]],t);delete(s,1,j+1);
			j:=1;k:=pos('=',s);
		end;
		while s<>'' do begin
			while not(s[j] in ['A'..'Z']) do inc(j);
			val(copy(s,1,j-1),t);
			inc(r[s[j]],t);delete(s,1,j+1);
			j:=1;
		end;
	end;
	t:=0;
	for ch:='A' to 'Z' do
		if l[ch]>r[ch] then begin
			dec(l[ch],r[ch]); r[ch]:=0;
		end else begin
			dec(r[ch],l[ch]); l[ch]:=0;
		end;

	for ch:='A' to 'Z' do begin
		if t=0 then t:=l[ch];
		if l[ch]>0 then t:=gcd(t,l[ch]);
		if r[ch]>0 then t:=gcd(t,r[ch]);
	end;
	for ch:='A' to 'Z' do begin
		l[ch]:=l[ch] div t;
		r[ch]:=r[ch] div t;
	end;
	s:='';
	for ch:='A' to 'Z' do 
		if l[ch]=1 
			then begin s:=s+'+'+ch;end
			else if l[ch]<>0 then begin
				str(l[ch],cht);
				s:=s+'+'+cht+ch;
			end;
	s:=s+'=';
	for ch:='A' to 'Z' do 
		if r[ch]=1 
			then begin s:=s+'+'+ch;end
			else if r[ch]<>0 then begin
				str(r[ch],cht);
				s:=s+'+'+cht+ch;
			end;
			
	delete(s,1,1);
	k:=pos('=',s);inc(k);
	delete(s,k,1);
	writeln(s);
end.