object FormPrincipal: TFormPrincipal
  Left = 889
  Top = 221
  Width = 399
  Height = 188
  Caption = 'Validador de N'#250'mero de Documentos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 304
    Height = 13
    Caption = 'Por favor, informe o n'#250'mero do documento que se deseja validar'
  end
  object Edit1: TEdit
    Left = 24
    Top = 48
    Width = 305
    Height = 30
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 200
    Top = 88
    Width = 131
    Height = 25
    Caption = 'Validar Documento'
    TabOrder = 1
    OnClick = Button1Click
  end
end
