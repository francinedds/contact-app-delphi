object ViewMeusContatos: TViewMeusContatos
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'ViewMeusContatos'
  ClientHeight = 742
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  TextHeight = 15
  object pnlBackground: TPanel
    Left = 0
    Top = 0
    Width = 347
    Height = 742
    Align = alClient
    BevelOuter = bvNone
    Color = 12699361
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = -16
    ExplicitTop = -39
    object menu: TImage
      Left = 296
      Top = 0
      Width = 51
      Height = 48
      Cursor = crHandPoint
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000280000
        002808060000008CFEB86D000000097048597300000B1300000B1301009A9C18
        000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000000
        8D4944415478DAEDD5C10980301044D16C07DA8156A62D58819660095A99E9C0
        7410E7929B8180E244980F4BAE8F5CC65CE5191B20A0806C80809F02638C039E
        15D7903C1EB798D99E031E783A122E15006C73C0D3F17E2FE501EC73C011CFEC
        78BF18701380DB2DB0C6041490DDBF805A92B2B4244FD29208585D02BE0AD492
        94A52579929644C0EA1250407617EE9D42290607B53F0000000049454E44AE42
        6082}
      OnClick = menuClick
    end
    object home: TImage
      Left = 144
      Top = 688
      Width = 57
      Height = 49
      Cursor = crHandPoint
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000280000
        002808060000008CFEB86D000000097048597300000B1300000B1301009A9C18
        000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000001
        DC4944415478DAED988155C23010862F13281B30024E206EA013081350266899
        009C009940984037B01BD811BA41FDEF1110C25D5A6A5A78DA7B2F2F94CB5DBE
        E492A387A12B1713CA5151147D7413FBF8628CC9AE06107043746F68B7F62B86
        1B03F2E3E280808BD1258A3A01E4EC228000E3DD5AA23D960C5DA34DEB86BC16
        20E006B40D69BFA209C33DD4813C1B10707C1112FA396F3BC9D19EECE7A500CF
        FA1920178D01026E8E2E125429C3ED76C8DEE8779277788171D3A08076420EE9
        4050734A89143BDEAD89A0E285540A7929A0904276522964B067F858B067B8D2
        54E405F4A41076CE214DCB1668FDF4490FB9371519C5A12F85ACEDCAF32A700E
        E4DCE3534C454670E44B211C526947CF0165FB585031DCC9B9348EF1333A3E53
        620A09F1D365E719929E8A22CCB3D200BF04A3A314124A3CE732C75C3D0DB070
        06AB292420E8492AC29C7B2E2FE0E1C08621D579FF26A0E7326992D136DFAD14
        7FC101A5CB54264787BF69C0826A48557FFF0FB0C9711D6007D80176801D6007
        D82020A427556F9704745FA3B81CDC083E97CEF39864A932EE1E6D74F09C82EF
        4E034C482E09DB945700EE17E202F21BF2279DFF321A4A32726A63A9706738ED
        6F8A26452C6FD5A208A023DAFE9B75D302DC06606B49D14AD5F61BF90675E4AB
        3873FB877F0000000049454E44AE426082}
      OnClick = homeClick
    end
    object pnlMenu: TPanel
      Left = 180
      Top = 39
      Width = 163
      Height = 161
      BevelOuter = bvNone
      Color = 12699361
      ParentBackground = False
      TabOrder = 0
      object btnContatos: TSpeedButton
        Left = 8
        Top = 15
        Width = 153
        Height = 46
        Cursor = crHandPoint
        Caption = 'Meus Contatos'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnNovoContato: TSpeedButton
        Left = 7
        Top = 77
        Width = 153
        Height = 46
        Cursor = crHandPoint
        Caption = 'Adicionar Novo Contato'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lineDetail: TPanel
        Left = 14
        Top = 67
        Width = 140
        Height = 1
        BevelOuter = bvNone
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object lineDetail2: TPanel
        Left = 14
        Top = 129
        Width = 140
        Height = 1
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
      end
    end
  end
  object TimerMenu: TTimer
    OnTimer = TimerMenuTimer
    Left = 32
    Top = 96
  end
end
