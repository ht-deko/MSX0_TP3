(*
  M0SETCLR v1.00
*)
program M0SetClr;
{$I MDLLIB.LIB}
{$I VRAM2.LIB}
  procedure _ShowColor(f, b, d: integer);
  begin
    Writeln('M0SetClr [/Fnum] [/Bnum] [/Dnum]');
    Writeln;
    Writeln('Current settings:');
    Writeln('  Foreground-color: ', f);
    Writeln('  Background-color: ', b);
    Writeln('  Border-color: '    , d);
  end; { _ShowColor }
  procedure _SetColor(f, b, d: integer);
  var
    i, v, r: integer;
    s: string[10];
  begin
    for i:=1 to ParamCount do
      begin
        s := ParamStr(i);
        if s[1] in ['-', '/'] then
        begin
          Val(Copy(s, 3, Length(s)), v, r);
          if r = 0 then
            case UpCase(s[2]) of
              'F': f := v;
              'B': b := v;
              'D': d := v;
            end;
        end;
        Color(f, b, d);
      end;
  end;{ _SetColor }
begin
  if ParamCount = 0 then
    _ShowColor(sys_forclr, sys_bakclr, sys_bdrclr)
  else
    _SetColor(sys_forclr, sys_bakclr, sys_bdrclr);
end.
