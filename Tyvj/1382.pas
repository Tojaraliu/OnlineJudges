var
        i,j,la,lb,lens:integer;
        s1,s2:ansistring;
        a,b,c:array[1..10000] of integer;
        m:longint;
        ai,bi:boolean;
		ch:char;
begin
        ai:=true;
        bi:=true;
        s1:='';
                read(ch);
		while ch<>' ' do
			begin
				s1:=s1+ch;
				read(ch);
			end;

        if s1[1]='-'
                then begin ai:=false;delete(s1,1,1);end;
        while (s1[1]='0') and (length(s1)>1) do
                delete(s1,1,1);
        la:=length(s1);
        for i:=1 to la do
                a[i]:=ord(s1[la-i+1])-48;

        readln(s2);
        if s2[1]='-'
                then begin bi:=false;delete(s2,1,1);end;
        while (s2[1]='0') and (length(s2)>1) do
                delete(s2,1,1);
        lb:=length(s2);
        for i:=1 to lb do
                b[i]:=ord(s2[lb-i+1])-48;

        if (s1='0') or (s2='0')
                then
                        begin
                                writeln('0');
                                readln;
                                halt;
                        end;

        for i:=1 to la do
          for j:=1 to lb do
                c[i+j-1]:=c[i+j-1]+a[i]*b[j];
        lens:=la+lb;
        for i:=1 to lens do
                begin
                        c[i+1]:=c[i+1]+(c[i] div 10);
                        c[i]:=c[i] mod 10;
                end;

        while c[lens]=0 do
                dec(lens);
        m:=c[lens];

        while m>0 do
                begin
                        c[lens]:=m mod 10;
                        m:=m div 10;
                        inc(lens);
                end;

        if ai<>bi
                then
                        write('-');
        for i:=(lens-1) downto 1 do
                write(c[i]);
        {writeln(s1,s2);}
end.