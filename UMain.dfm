object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 183
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 6
    Top = 4
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object Label2: TLabel
    Left = 92
    Top = 5
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label71: TLabel
    Left = 6
    Top = 83
    Width = 65
    Height = 13
    Caption = 'Complemento'
  end
  object Label1: TLabel
    Left = 347
    Top = 40
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object Label3: TLabel
    Left = 150
    Top = 40
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label4: TLabel
    Left = 6
    Top = 40
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  object Label5: TLabel
    Left = 334
    Top = 83
    Width = 23
    Height = 13
    Caption = 'IBGE'
  end
  object VSEditCEP: TVSEdit
    Tag = 1
    Left = 6
    Top = 17
    Width = 78
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    MaxLength = 8
    TabOrder = 0
    OnKeyPress = VSEditCEPKeyPress
  end
  object VSEditEndereco: TVSEdit
    Tag = 1
    Left = 91
    Top = 17
    Width = 479
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    Enabled = False
    MaxLength = 60
    TabOrder = 1
  end
  object MemoComplemento: TMemo
    Tag = 1
    Left = 6
    Top = 95
    Width = 309
    Height = 51
    Color = clBtnFace
    Enabled = False
    TabOrder = 2
  end
  object VSDEditCidade: TVSDEdit
    Left = 150
    Top = 56
    Width = 190
    Height = 21
    TabStop = False
    Color = clBtnFace
    Enabled = False
    ReadOnly = True
    TabOrder = 3
  end
  object VSEditBairro: TVSEdit
    Tag = 1
    Left = 347
    Top = 56
    Width = 190
    Height = 21
    CharCase = ecUpperCase
    Color = clBtnFace
    Enabled = False
    MaxLength = 60
    TabOrder = 4
  end
  object VSDEditEstado: TVSDEdit
    Left = 6
    Top = 56
    Width = 140
    Height = 21
    TabStop = False
    Color = clBtnFace
    Enabled = False
    ReadOnly = True
    TabOrder = 5
  end
  object VSEditIBGE: TVSDEdit
    Left = 334
    Top = 102
    Width = 137
    Height = 21
    TabStop = False
    Color = clBtnFace
    Enabled = False
    ReadOnly = True
    TabOrder = 6
  end
  object BTNCep: TButton
    Left = 416
    Top = 152
    Width = 137
    Height = 25
    Caption = 'Consultar CEP'
    TabOrder = 7
    OnClick = BTNCepClick
  end
  object BtnLimpar: TButton
    Left = 7
    Top = 152
    Width = 137
    Height = 25
    Caption = 'Nova Consulta'
    TabOrder = 8
    OnClick = BtnLimparClick
  end
end
