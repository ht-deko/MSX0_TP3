(*
  TPKEYS v1.20
*)

program TPKEYS;
{$I MDLLIB.LIB}

  procedure Usage;
  begin
    Writeln('TPKEYS [Options]');
    Writeln;
    Writeln(' /B, /I', #$09#$09, 'Set template for BASIC (Initialize)');
    Writeln(' /P, /T', #$09#$09, 'Set template for Turbo Pascal');
    Writeln(' /S', #$09#$09, 'Show the function keys');
    Writeln(' /H', #$09#$09, 'Hide the function keys');
    Writeln(' /R<:file>', #$09, 'Read settings from file');
    Writeln(' /W<:file>', #$09, 'Write current settings to file');
  end; { Usage }

  procedure ChangeFunction;
  type
    TFuncStr = array [0..15] of Char;
  const
    DATFILE = 'FUNCKEYS.DAT';
    INIFNC = $003E;
    ERAFNC = $00CC;
    DSPFNC = $00CF;
  var
    F: file of TFuncStr;
    i: Integer;
    s, fn: LibStr;
    FNKSTR: array [1..10] of TFuncStr absolute $F87F;
    CNSDFG: Byte absolute $F3DE;
    function GetFileName: LibStr;
    begin
      if s[3] = ':' then
        GetFileName := Copy(s, 4, 120)
      else
        GetFileName := DATFILE;
    end;
  begin
    for i:=1 to ParamCount do
    begin
      s := ParamStr(i) + #$00#$00;
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
          'R':
            begin
              Assign(F, GetFileName);
              {$I-}
              Reset(F);
              {$I+}
              if IOResult = 0 then
              begin
                for i:=1 to 10 do
                  Read(F, FNKSTR[i]);
                Close(F);
                if CNSDFG <> 0 then
                  Bios(DSPFNC);
              end;
            end;
          'W':
            begin
              Assign(F, GetFileName);
              Rewrite(F);
              for i:=1 to 10 do
                Write(F, FNKSTR[i]);
              Close(F);
            end;
        end;
    end;
  end; { ChangeFunction }
begin
  if ParamCount = 0 then
    Usage
  else
    ChangeFunction;
end.
