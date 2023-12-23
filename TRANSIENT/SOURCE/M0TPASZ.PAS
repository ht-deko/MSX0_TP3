(*
  M0TPASZ v1.10
*)
program M0TPASZ;
var
  sz: Integer absolute $0006;
  r: Real;
begin
  r := sz and $7FFF;
  if sz < 0 then
    r := r + $7F00
  else
    r := r - $100;
  Writeln('TPA size: ', r:1:0);
end.
