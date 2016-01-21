var
        a:qword;
        i,n,k:longint;
        s:string;
begin
        readln(n,k);
        a:=1;
        for i:=1 to n do
                a:=a*i;

        str(a,s);
        while s[length(s)]='0' do
                s:=copy(s,1,length(s)-1);

        if (k>=length(s))
                then writeln(s)
                else writeln(copy(s,length(s)-k+1,length(s)));
end.