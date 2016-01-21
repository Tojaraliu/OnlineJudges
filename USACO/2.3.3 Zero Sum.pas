{
ID:ToJaRa
PROG:zerosum
LANG:PASCAL
}

Const
  inp='zerosum.in';
  outp='zerosum.out';

Procedure openf;
Begin
  Assign(input,inp);Reset(input);
  Assign(output,outp);Rewrite(output);
End;

Procedure closef;
Begin
  Close(input);
  Close(output);
End;

Var
  n:Longint;

Procedure init;
Begin
  Readln(n);
End;

Procedure Dfs(d,last,tot,fh:Longint;s:String);
Begin
  If d=n Then Begin
    If fh=2 Then Begin
      If tot-last=0 Then Writeln(s);
    End 
    Else Begin
      If tot+last=0 Then Writeln(s);
    End;
  End 
  Else Begin
    Dfs(d+1,last*10+d+1,tot,fh,s+' '+chr(d+49));
    If fh=1 Then Dfs(d+1,d+1,last+tot,1,s+'+'+chr(d+49)) Else Dfs(d+1,d+1,tot-last,1,s+'+'+chr(d+49));
    If fh=1 Then Dfs(d+1,d+1,tot+last,2,s+'-'+chr(d+49)) Else Dfs(d+1,d+1,tot-last,2,s+'-'+chr(d+49));
  End;
End;

Begin
  openf;
  init;
  Dfs(1,1,0,1,'1');
  closef;
End.
