program LED;
{$I MDLLIB.LIB}
{$I VRAM1.LIB}
{$I SYSUTILS.LIB}
{$I IOT.LIB}
var
  I, L, P: Byte;
  W, WN: Integer;
  D: LibStr;
  PT: array [0..9] of LibStr;

  procedure AllSame(R, G, B: Byte);
  begin
    D := Chr(G shl 4 + B) + Chr(10 shl 4 + R);
    IoTPutStr('device/leds/data', D);
    sys_timer := 0;
    repeat
    until sys_timer >= 60;
  end; { AllSame }

  procedure AllOff;
  begin
    IoTPutInt('device/leds/trans_ms', 300);
    AllSame(0, 0, 0);
  end; { AllOff }

  procedure RGB;
  begin
    IoTPutInt('device/leds/trans_ms', 1000);
    for L:=1 to 3 do
    begin
      AllSame(15, 0, 0);
      ALLSame(0, 15, 0);
      ALLSame(0, 0, 15);
    end;
  end; { RGB }

  procedure Rotate;
  const
    R = 0; G = 0; B = 15; (* Blue *)
  begin
    for P := 0 to 9 do
    begin
      D := '';
      for I := 0 to 9 do
        if I = P then
          D := D + Chr(G shl 4 + B) + Chr(R)
        else
          D := D + #$00#$00;
      PT[P] := D;
    end;
    IoTPutInt('device/leds/trans_ms', 100);
    for L := 1 to 50 do
    begin
      WN := 30 - L;
      if WN < 0 then WN := 0;
      for I := 0 to 9 do
      begin
        IoTPutStr('device/leds/data', PT[i]);
        for W := 0 to WN do Delay(1);
      end;
    end;
    AllOff;
  end; { Rotate }

  procedure Flash;
  const
    R = 15; G = 15; B = 15; (* White *)
  begin
    for P := 0 to 9 do
    begin
      D := '';
      for I := 0 to 9 do
        if I = P then
          D := D + Chr(G shl 4 + B) + Chr(R)
        else
          D := D + #$00#$00;
      PT[P] := D;
    end;
    IoTPutInt('device/leds/trans_ms', 20);
    for L := 1 to 200 do
      IoTPutStr('device/leds/data', PT[Random(10)]);
    AllOff;
  end; { Flash }
begin
  ClrScr;
  Color(15, 1, 1);
  repeat
    RGB;
    Rotate;
    Flash;
  until KeyPressed;
  AllOff;
  Color(15, 4, 7);
end.
