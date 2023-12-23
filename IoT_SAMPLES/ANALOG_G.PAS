program ANALOG_G;
{$I MDLLIB.LIB}
{$I VRAM2.LIB}
{$I GRAPMSX2.LIB}
{$I SYSUTILS.LIB}
{$I IOT.LIB}
var
  A, X, Y: Integer;
begin
  ScrMode(5);
  while not KeyPressed do
  begin
    A := IoTGetInt('device/analog/in');
    Y := 206 - Trunc(A / 4096 * 200);
    if X = 0 then
      Plot(X, Y, 15) 
    else 
      DrawTo(X, Y, 15);
    X := X + 1;
    if X >= 256 then 
    begin
      X := 0;
      ClrScr;
    end;  
  end;
  TextMode;
end.
