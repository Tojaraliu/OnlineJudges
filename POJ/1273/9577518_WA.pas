const
	inf=1<<29;
  
type
	link=^node;
	node=record
		id,c:longint;
		o,next:link;
	end;
  
var
	h,vh:array[0..20000]of longint;
	e:array[0..20000]of link;
	spot:array[0..20,0..20,0..20]of longint;
	i,j,k,v,x,n,num,sp,tp,flow,m,y,z:longint;
	
procedure add(x,y,z:longint);
	var p,q:link;
	begin
    new(p);new(q);
		p^.id:=y; q^.id:=x;
		p^.c:=z; q^.c:=0;
		p^.o:=q; q^.o:=p;
		p^.next:=e[x]; q^.next:=e[y];
		e[x]:=p; e[y]:=q;
	end;
function aug(x,flow:longint):longint;
	var minh,delta,last:longint; p:link;
	begin
		if x=tp then exit(flow);
		last:=flow; minh:=num; p:=e[x];
		while p<>nil do with p^ do begin
			if c>0 then begin
				if h[id]+1=h[x] then begin
					if last<c then delta:=last else delta:=c;// delta:=min(last,c);
					delta:=aug(id,delta);
					dec(last,delta);
					dec(c,delta);
					inc(o^.c,delta);
					if h[sp]>=num then exit(flow-last);
					if last=0 then break;
				end;
				if h[id]<minh then minh:=h[id];// minh:=min(minh,h[id]);
			end;
			p:=next;
		end;
		if last=flow then begin
			dec(vh[h[x]]);
			if vh[h[x]]=0 then h[sp]:=num; //GAP
			h[x]:=minh+1;
			inc(vh[h[x]]);
		end;
		exit(flow-last);
	end;
  
begin
  repeat
    readln(m,n); sp:=1; tp:=n;
    for i:=1 to m do begin
      read(x,y,z);
      add(x,y,z);
    end;
    fillchar(h,sizeof(h),0);
    fillchar(vh,sizeof(vh),0);
    flow:=0; num:=tp+1;
    while h[sp]<num do inc(flow,aug(sp,inf));
    writeln(flow);
	until eof;
end.