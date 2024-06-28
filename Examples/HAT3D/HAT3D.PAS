{
  HAT3D.PAS
}
program HAT3D;
{$I MDLLIB.LIB}
{$I VRAM1.LIB}
{$I GRAPMSX1.LIB}
const
  Colors: array [0..7] of byte = (1, 5, 8, 13, 12, 7, 10, 15);
var
  D: array [0..127] of Integer;
  X, Y, SX, SY: Integer;
  DR, R, Z: Real;
begin
  Color(15, 1, 1); ScrMode(2);
  for X:=0 to 127 do D[X] := 100;
  DR := 3.14 / 180;
  Y := -180;
  repeat
    X := -180;
    repeat
      R := DR * Sqrt(Int(X * X) + Int(Y * Y));
      Z := 100 * Cos(R) - 30 * Cos(3 * R);
      SX := Trunc(64 + X / 3 - Y / 6);
      SY := Trunc(38 - Y / 6 - Z / 4);
      if SX in [0..127] then
        if D[SX] > SY then
        begin
          Plot(SX * 2, SY * 2, Colors[Trunc((Z + 100) * 0.035) + 1]);
          D[SX] := SY;
        end;
      X := X + 4;
    until X > 180;
    Y := Y + 6;
  until Y > 180;
  while not KeyPressed do;
  Color(15, 4, 7); TextMode;
end.
