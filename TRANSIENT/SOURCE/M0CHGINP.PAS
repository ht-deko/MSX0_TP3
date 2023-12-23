(*
  M0CHGINP v1.00
*)
program M0CHGINP;
type
  LibStr = string[80];
{$I SYSUTILS.LIB}
{$I IOT.LIB}

const
  node = 'conf/ui/';

  procedure Usage;
  const
    cpn = 'num : Change the connection point of ';
    rfn = 'num : Change the rapid-fire speed of Button ';
    CP: array [0..3] of string[4] = ('OFF' , 'KBD' , 'JOY1', 'JOY2');
    RF: array [0..3] of string[4] = ('OFF' , 'LOW' , 'MID' , 'HIGH');
  var
    s: LibStr;
    v: integer;
    function GetValue(s: LibStr): integer;
    var
      v: integer;
    begin
      v := IoTGetInt(node + s);
      if not (v in [0..3]) then v := 0;
      GetValue := v;
    end;
  begin
    Writeln('M0ChgInp [/Gnum] [/Pnum] [/Jnum] [/Anum] [/Bnum] ');
    Writeln;
    Writeln(' /G', cpn, 'GamePad');
    Writeln(' /P', cpn, 'TouchPad');
    Writeln(' /J', cpn, 'TouchJoy');
    Writeln('         (num: 0=OFF, 1=KBD, 2=JOY1, 3=JOY2)');
    Writeln;
    Writeln(' /A', rfn, 'A');
    Writeln(' /B', rfn, 'B');
    Writeln('         (num: 0=OFF, 1=LOW, 2=MID, 3=HIGH)');
    Writeln;
    Writeln('Current settings:');
    v := GetValue('m5faces_game');
    Write('  GamePad: ',  CP[v], '  ');
    v := GetValue('touch_pad');
    Write('  TouchPad: ', CP[v], '  ');
    v := GetValue('touch_joypad');
    Write('  TouchJoy: ', CP[v]); Writeln;
    v := GetValue('rensha_a');
    Write('  Button A: ', RF[v], '  ');
    v := GetValue('rensha_b');
    Write('  Button B: ', RF[v]); Writeln;
  end; { Usage }

  procedure ChangeInput;
  var
    i: integer;
    s: LibStr;
    c: char;
    v: byte;
    procedure SetValue(s: LibStr; v: integer);
    begin
      IoTPutInt(node + s, v);
    end;
  begin
    for i:=1 to ParamCount do
    begin
      s := ParamStr(i) + '@0';
      v := Ord(s[3]) - Ord('0');
      if (s[1] in ['-', '/']) and (v in [0..3]) then
      begin
        case UpCase(s[2]) of
          'G': SetValue('m5faces_game' ,v);
          'P': SetValue('touch_pad'    ,v);
          'J': SetValue('touch_joypad' ,v);
          'A': SetValue('rensha_a'     ,v);
          'B': SetValue('rensha_b'     ,v);
        end;
      end;
    end;
    IoTPutInt('conf/save', 1);
  end; { ChangeInput }
begin
  if ParamCount = 0 then
    Usage
  else
    ChangeInput;
end.
