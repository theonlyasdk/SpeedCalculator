unit FormAbout;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, FormMouseVelocity;

type

  { TAboutForm }

  TAboutForm = class(TForm)
    LblCopyright: TLabel;
    LblEdit: TLabel;
    LblTitle: TLabel;
    LicenseMemo: TMemo;
    procedure LblTitleClick(Sender: TObject);
  private

  public

  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.lfm}

{ TAboutForm }

procedure TAboutForm.LblTitleClick(Sender: TObject);
var
  MouseVelocityForm: TMouseVelocityForm;
begin
     MouseVelocityForm := TMouseVelocityForm.Create(Self);
     MouseVelocityForm.ShowModal;
end;

end.

