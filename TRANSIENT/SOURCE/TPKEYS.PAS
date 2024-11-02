(*
  TPKEYS v1.00
*)

program TPKEYS;
{$I MDLLIB.LIB}
const
  INIFNC = $003E;
  ERAFNC = $00CC;
  DSPFNC = $00CF;
var
  i: Integer;
  s: string[10];
  FNKSTR: array [1..10, 0..15] of Char absolute $F87F;
  CNSDFG: Byte absolute $F3DE;

  procedure Usage;
  begin
    Writeln('TPKEYS [Options]');
    Writeln;
    Writeln(' /B, /I', #$09, 'Set template for BASIC (Initialize)');
    Writeln(' /P, /T', #$09, 'Set template for Turbo Pascal');
    Writeln(' /S', #$09, 'Show the function keys');
    Writeln(' /H', #$09, 'Hide the function keys');
  end; { Usage }

  procedure ChangeFunction;
  var
    i: Integer;
  begin
    for i:=1 to ParamCount do
    begin
      s := Copy(ParamStr(i), 1, 2) + '@0';
      if s[1] in ['-', '/'] then
        case UpCase(s[2]) of
          'B', 'I':
            begin
              Bios(INIFNC);
              if CNSDFG <> 0 then
                Bios(DSPFNC);
            end;
          'P', 'T':
            begin
              FNKSTR[ 1] := 'begin'#$0D'end;'#$00#$00#$00#$00#$00#$00;
              FNKSTR[ 2] := 'if  then'#$00#$00#$00#$00#$00#$00#$00#$00;
              FNKSTR[ 3] := 'for  to  do'#$00#$00#$00#$00#$00;
              FNKSTR[ 4] := 'while  do'#$00#$00#$00#$00#$00#$00#$00;
              FNKSTR[ 5] := 'repeat'#$0D'until ;'#$00#$00;
              FNKSTR[ 6] := 'program ;'#$00#$00#$00#$00#$00#$00#$00;
              FNKSTR[ 7] := 'else'#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00#$00;
              FNKSTR[ 8] := 'goto ;'#$00#$00#$00#$00#$00#$00#$00#$00#$0#$00;
              FNKSTR[ 9] := 'case  of'#$0D'end;'#$00#$00#$00;
              FNKSTR[10] := 'with  do'#$00#$00#$00#$00#$00#$00#$00#$00;
              if CNSDFG <> 0 then
                Bios(DSPFNC);
            end;
          'S': Bios(DSPFNC);
          'H': Bios(ERAFNC);
        end;
    end;
  end; { ChangeFunction }
begin
  if ParamCount = 0 then
    Usage
  else
    ChangeFunction;
end.
