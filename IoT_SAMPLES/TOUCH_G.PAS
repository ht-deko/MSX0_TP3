program TOUCH_G;
{$I MDLLIB.LIB}
{$I VRAM2.LIB}
{$I GRAPMSX2.LIB}
{$I GAMEIO.LIB}
var
  A: Boolean;
  S: Byte;
begin
  S := sys_scrmod;
  ScrMode(5);
  A := True;
  repeat
    while (Pad(4) = 0) and (not KeyPressed) do
      A := True;
    if A then
    begin
      Plot(Pad(5), Pad(6), 15);
      A := False;
    end
    else
      DrawTo(Pad(5), Pad(6), 15);
  until KeyPressed;
  ScrMode(S);
end.
