var 
	ch,op:char;
	m1,m2,st,i:longint;
function cal(a:longint; op:char; b:longint):longint;
begin
    case op of
		'+':exit(a+b);
		'-':exit(a-b);
		'*':exit(a*b);
		'/':exit(a div b);
    end;
end;

begin
	op:=#0; m1:=0; m2:=0; st:=0;
	while not eoln do begin
		read(ch);
		case st of
			0:begin
				case ch of
					'0'..'9':begin m1:=ord(ch)-48; st:=1; end;
					'F':begin m1:=-m1; st:=0; end;
					'+','-','*','/':begin op:=ch; st:=2; end;
					'=':st:=0;
				end;
			end;
			1:begin
				case ch of
					'0'..'9':begin
						if m1>=0 
							then m1:=m1*10+ord(ch)-48
							else m1:=m1*10-ord(ch)+48;
						st:=1;
					end;
					'F':begin m1:=-m1; st:=2; end;
					'+','-','*','/':begin op:=ch; st:=2; end;
					'=':st:=0;
				end;
			end;
			2:begin
				case ch of
					'0'..'9':begin m2:=ord(ch)-48; st:=3; end;
					'F':begin m2:=0; st:=3; end;
					'+','-','*','/':begin op:=ch; st:=2; end;
					'=':st:=0;
				end;
			end;
			3:begin
				case ch of
					'0'..'9':begin
						if m2>=0 
							then m2:=m2*10+ord(ch)-48
							else m2:=m2*10-ord(ch)+48;
						st:=3;
					end;
					'F':begin m2:=-m2; st:=3; end;
					'+','-','*','/':begin
						m1:=cal(m1,op,m2);
						op:=ch; st:=2;
					end;
					'=':begin 
							m1:=cal(m1,op,m2); 
							st:=0; 
						end;
				end;
			end;
		end;
	end;
	case st of
		0,1,2:writeln(m1);
		else writeln(m2);
	end;
end.
