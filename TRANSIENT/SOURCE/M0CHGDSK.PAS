(*
  M0CHGDSK v1.20
*)
program M0CHGDSK;
type
  LibStr = string[80];
{$I SYSUTILS.LIB}
{$I IOT.LIB}

var
  List, Last, p: PItem;

  procedure DiskList;
  const
    Arrow: array [boolean] of string[4] = ('    ', '--> ');
  var
    List, Last, p: PItem;
    cDsk: LibStr;
    n: Integer;
  begin
    cDsk := IotGetStr('msx/u0/drive/a');
    List := nil;
    n := IotFindCount('host/media/dsk');
    IotFind('host/media/dsk', List, Last);
    p := List;
    while p <> nil do
    begin
      WriteLn(Arrow[p^.Data = cDsk], p^.Data);
      p := p^.Next;
    end;
    ClearListItem(List);
  end; { DiskList }

  procedure ChangeDisk(Disk: LibStr);
  var
    s, n: LibStr;
    b, e: byte;
  begin
    s := UpperCase(Disk);
    if s[1] = '"' then
      s := Copy(s, 2, Length(s));
    if s[Length(s)] = '"' then
      s := Copy(s, 1, Length(s)-1);
    if Pos('.', s) = 0 then
      s := s + '.DSK';
    Writeln('Change to: ', s);
    IoTPutStr('msx/u0/drive/a', s);
    IoTPutStr('conf/dsk0', s);
    IoTPutInt('conf/save', 1);
    n := IoTGetStr('msx/u0/drive/a');
    if n <> s then
      begin
        Writeln;
        WriteLn('Could not replace disk.');
        WriteLn('Current: ', n);
      end;
  end; { ChangeDisk }
begin
  if ParamCount = 0 then
    DiskList
  else
    ChangeDisk(ParamStr(1));
end.
