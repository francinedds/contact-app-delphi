object ServiceConexao: TServiceConexao
  Height = 489
  Width = 152
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Users\EMANUEL\Desktop\banco\BANCOFDDS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Left = 64
    Top = 136
  end
  object FDQuery_Pessoas: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'select * from pessoas')
    Left = 64
    Top = 240
    object FDQuery_PessoasPES_CODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'PES_CODIGO'
      Origin = 'PES_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery_PessoasPES_NOMECOMPLETO: TStringField
      FieldName = 'PES_NOMECOMPLETO'
      Origin = 'PES_NOMECOMPLETO'
      Size = 200
    end
    object FDQuery_PessoasPES_TELEFONE: TStringField
      FieldName = 'PES_TELEFONE'
      Origin = 'PES_TELEFONE'
      Size = 50
    end
  end
end
