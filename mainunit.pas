unit MainUnit;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
    LCLType, Spin, SpinEx, FormAbout;

type

    { TMainForm }

    TMainForm = class(TForm)
        BtnAbout:  TButton;
        LblMs:     TLabel;
        LblMs1:    TLabel;
        LblResult: TLabel;
        LblTitle:  TLabel;
        LblTotalDistance: TLabel;
        LblTotalTime: TLabel;
        SETotalDistance: TSpinEdit;
        SETotalTime: TSpinEdit;
        procedure BtnAboutClick(Sender: TObject);
        procedure SETotalDistanceChange(Sender: TObject);
        procedure Calc();
        procedure SETotalTimeChange(Sender: TObject);
    private

    public
    end;

var
    MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }


procedure TMainForm.Calc();
var
    TotalDistance: Integer;
    TotalTime:     Integer;
    CalculatedSpeed: Extended;
begin
    TotalDistance := SETotalDistance.Value;
    TotalTime := SETotalTime.Value;

    if TotalTime = 0 then
    begin
        LblResult.Caption := 'Time cannot be zero. Please set time to another value.';
        Exit;
    end;

    CalculatedSpeed := TotalDistance / TotalTime;
    LblResult.Caption := PChar(Concat('Speed is: ', FloatToStr(CalculatedSpeed), 'm/s'));
end;

procedure TMainForm.SETotalTimeChange(Sender: TObject);
begin
    Calc();
end;

procedure TMainForm.SETotalDistanceChange(Sender: TObject);
begin
    Calc();
end;

procedure TMainForm.BtnAboutClick(Sender: TObject);
begin
    AboutForm.ShowModal;
end;

end.
