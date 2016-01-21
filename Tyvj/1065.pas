var
	zhichu:integer;
	i:integer;
	save:integer;
	sy,shouru:integer;

begin
	sy:=0;
	for i:=1 to 12 do
		begin
		readln(zhichu);
		shouru:=300+sy;
		if shouru-zhichu<0
			then begin writeln('-',i);halt;end;
		sy:=(shouru-zhichu) mod 100;
		save:=save+((shouru-zhichu) div 100)*100;
                {writeln(sy,' ',save);}
		end;

        writeln(sy+save+save div 5);
end.