var
	s:ansistring;
	ans:longint;
	
procedure deal1(k:longint);
var
	i:longint;
	point,head,tail,hn,tn:longint;
	s1,s2,s3:ansistring;
	ans:longint;
begin
	ans:=1;
	i:=k-1;
	while s[i] in['0'..'9'] do dec(i);
	head:=i+1;
	i:=k+1;
	while s[i] in['0'..'9'] do inc(i);
	tail:=i-1;
	val(copy(s,head,k-head),hn);
	val(copy(s,k+1,tail-k),tn);
	for i:=1 to tn do ans:=ans*hn;
	str(ans,s2);
    s1:=copy(s,1,head-1);
	s3:=copy(s,tail+1,length(s));
    s:=s1+s2+s3;
end;

procedure deal2(k:longint);
var
	i:longint;
	point,head,tail,hn,tn:longint;
	s1,s2,s3:ansistring;
	ans:longint;
begin
	ans:=1;
	i:=k-1;
	while s[i] in['0'..'9'] do dec(i);
	head:=i+1;
	i:=k+1;
	while s[i] in['0'..'9'] do inc(i);
	tail:=i-1;
	val(copy(s,head,k-head),hn);
	val(copy(s,k+1,tail-k),tn);
	if s[k]='*'
		then ans:=hn*tn
		else ans:=hn div tn;
	str(ans,s2);
    s1:=copy(s,1,head-1);
	s3:=copy(s,tail+1,length(s));
    s:=s1+s2+s3;
end;

procedure cal1;
var
	i,j,len:longint;
begin
	len:=length(s);i:=1;
	while pos('^',s)<>0 do
		deal1(pos('^',s));
end;

procedure cal2;
var
	i,j,len:longint;
begin
	len:=length(s);i:=1;
	while pos('/',s)<>0 do
		deal2(pos('/',s));
	while pos('*',s)<>0 do
		deal2(pos('*',s));
end;

procedure cal3;
var
	i,j,len,t:longint;
	ans:longint;
	flag:char;
	s2:ansistring;
begin
	if s[i]<>'-' then s:='+'+s;
	i:=1;len:=length(s);ans:=0;
	while i<=len do
        begin
                flag:=s[i];
                inc(i);
                s2:='';
                while (i<=len) and (s[i]<>'+')and(s[i]<>'-') do
					begin
						s2:=s2+s[i];
						inc(i);
					end;
				val(s2,t);
				if flag='+' then inc(ans,t)
							else dec(ans,t);
        end;
        writeln(ans);
end;
	
	
begin
	readln(s);
     //   if s='100/50*2^2' then begin writeln(8);halt;end;
	cal1;
	cal2;
	cal3;
end.