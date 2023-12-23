program PERFORMC;
{$I MDLLIB.LIB}
{$I VRAM2.LIB}
{$I SYSUTILS.LIB}
{$I IOT.LIB}
label
  JP;
type
  Str4 = string[4];
const
  OVSTR: array [Boolean] of Str4 = ('', 'OVER');
var
  S: Byte;
  I, P, W: Integer;
begin
  S := sys_scrmod;
  ScrMode(1);
  Writeln;
  Writeln('**** PERFORMANCE CHECK ****');
  Writeln;
  I := 0;
  repeat
    I := I + 20;
    IoTPutInt('msx/me/pm/cpu/percent', I);
    write('Z80:', I:3, '% ');
    for W:=0 to 2 do
    begin
      Delay(I * 10);
      if KeyPressed then
        goto JP;
      write('-');
    end;
    P := IoTGetInt('msx/me/pm/cpu/load');
    Writeln(' LOAD:', P:3, '% ', OVSTR[P > 100]);
  until I >= 280;
  Writeln;
  Writeln('Press any key.');
  while not KeyPressed do
    ;
JP:
  IoTPutInt('msx/me/pm/cpu/percent', 100);
  ScrMode(S);
end.
