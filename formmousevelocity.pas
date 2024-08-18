unit FormMouseVelocity;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

    { TMouseVelocityForm }

    TMouseVelocityForm = class(TForm)
        BtnClose:    TButton;
        LblTitle:    TLabel;
        LblVelocity: TLabel;
        TickTimer:   TTimer;
        procedure TimerTick(Sender: TObject);
    private

    public
        DeltaX:  Integer;
        DeltaY:  Integer;
        PMouseX: Integer;
        PMouseY: Integer;
    end;

var
    MouseVelocityForm: TMouseVelocityForm;

implementation

procedure TMouseVelocityForm.TimerTick(Sender: TObject);
var
    StartTime: TDateTime;
    EndTime:   TDateTime;
    VelocityX, VelocityY: Double;
begin
    StartTime := Now;

    DeltaX := Mouse.CursorPos.X - PMouseX;
    DeltaY := Mouse.CursorPos.Y - PMouseY;

    EndTime := Now;

    VelocityX := DeltaX / (EndTime - StartTime + 1);
    VelocityY := DeltaY / (EndTime - StartTime + 1);

    LblVelocity.Caption := PChar(Concat('Your mouse is moving with velocity:', #13#10, FloatToStr(VelocityX), 'px/s on x-axis', #13#10, FloatToStr(VelocityY), 'px/s on y-axis'));

    PMouseX := Mouse.CursorPos.X;
    PMouseY := Mouse.CursorPos.Y;
end;

{$R *.lfm}

end.
