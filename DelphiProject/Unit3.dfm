object Form3: TForm3
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'ASLR Modifier 1.3'
  ClientHeight = 555
  ClientWidth = 452
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 341
    Top = 506
    Width = 88
    Height = 41
    Picture.Data = {
      0A544A504547496D6167658C040000FFD8FFE000104A46494600010101006000
      600000FFDB0043000302020302020303030304030304050805050404050A0707
      06080C0A0C0C0B0A0B0B0D0E12100D0E110E0B0B1016101113141515150C0F17
      1816141812141514FFDB00430103040405040509050509140D0B0D1414141414
      1414141414141414141414141414141414141414141414141414141414141414
      14141414141414141414141414FFC00011080020005403011100021101031101
      FFC4001C0000020203010100000000000000000000040503060001020709FFC4
      002C100002020201030205040301000000000001020304051100061221133114
      22415161071532714281A1F1FFC4001401010000000000000000000000000000
      0000FFC40014110100000000000000000000000000000000FFDA000C03010002
      110311003F00FA4B62DC7586DDB5F61C00E4CD47015F5A3961563A0D246541FF
      0067807C72ACAA194EC1E06A59D211B6200E0462F46C8590F780367B7CE87DF8
      10FEEB1BF8895E76D6FB6252C7FE7032AE561B3218FCA483DD1C688FF47806F7
      0FBF0076B523B3082096C76F86F4D0B6B81150CC57C82831481B637C03B814CE
      B4EA1B581E9C9EF51216FD9BAB8F826201F44142ECE3F3A1AE027A54FA968E2E
      69E5C964EDD49E07F5CD8EF963EC2A76DB3BEDD7BEC6BDB80D467D3114706564
      697E3A291FC9F03B1BB7C701950EA18A2FD46C262DDA766B74FE2A32BAED0CD1
      B921BF1A53AD7D75C0A2F46F5256CF51BAD8C9B315AB438D9EC335D68C48C546
      FB7E51AED3F5E01692E6BAAFA470B074BE53E12DC524A7214E2B020B12924763
      29D8D8007DFEBF5D7806984FDCE4CCD7A595B938BD144416B83E64886D8B13FE
      43DFCFFDE06E8F5A53EA14BE30F25E5B35617B082DAA84B28BFC82EBCA9D7900
      F02BBD73D538BBFD1BD2F2B4B9D8DAF35B9235A1246AAD2A145264DFBA827E5D
      79D6F7C06F97EA0C7D3CF606A564CB9B8F85AAF08631FA2233DC07A9F5EFD03B
      D78F6E07A05491DEBA161A623CF02A5D5156B59A56B179099A9C12CE96EB5CEC
      2EB0CCA35F381E7B48F1BFA70114974623159B5B3D494EE0B588B146B53A5624
      9B73381D87B3B74BEC46CEB5BE02FAF516F74C74D09F2D4F196F1293C5623BCC
      CA5D1DC32B2681EE3AF1AE0318733497F53FA7F2F5EC7C5E329E3A2824B08846
      8947424AFB823B8123E9C00FA76941D29532541F2546E093176A38E5A8E58166
      5D2A9D81A63F6E0715BA731390C0530F95C7D6B5E98F562C83342D1BFE1B47B8
      7009FDFA25EA5C0409625CAE3E8E3E7A17F248AC4C825D81DBBF2C13C79FAF9E
      073894A9D178CB4E7254B25685796BD3868B17791DC150CE35F2003C9DFF00E8
      055F0E5FA6BA368E83D8A5F1A664D794EF914AEFFB00F02C17A2AF2E6B15954B
      B515AAE3E2A52D295889FBD09FE2BAF20EF7BDF02FF56712408C06811C0CB746
      1BA856540C0FDC7015C7D1F8D8E5F50574EEFEB813DBE9AA3700F52046D7B6C7
      0375FA7695642A90A807DFC70384E98A08C4881013F8E0736BA5685B03D4810E
      BF1C09AAF4FD3A91148E15553F61C0893A5A824DEA8813BBEFAE018B8BAE9277
      88D41FEB810CD80A73CE256894B8FAEB807C712C68140F0381FFD9}
  end
  object LoadButton: TButton
    Left = 96
    Top = 506
    Width = 75
    Height = 25
    Caption = 'Open File'
    TabOrder = 0
    OnClick = LoadButtonClick
    OnMouseEnter = LoadButtonMouseEnter
    OnMouseLeave = LoadButtonMouseLeave
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 71
    Width = 356
    Height = 429
    ColCount = 4
    FixedCols = 0
    RowCount = 17
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnDrawCell = StringGrid1DrawCell
    OnMouseMove = StringGrid1MouseMove
    ColWidths = (
      64
      45
      173
      67)
  end
  object CheckBox1: TCheckBox
    Left = 401
    Top = 103
    Width = 18
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 2
    OnClick = CheckBoxClick
  end
  object CheckBox2: TCheckBox
    Left = 401
    Top = 127
    Width = 18
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 3
    OnClick = CheckBoxClick
  end
  object CheckBox3: TCheckBox
    Left = 401
    Top = 150
    Width = 18
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 4
    OnClick = CheckBoxClick
  end
  object CheckBox4: TCheckBox
    Left = 401
    Top = 176
    Width = 18
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 5
    OnClick = CheckBoxClick
  end
  object CheckBox5: TCheckBox
    Left = 401
    Top = 203
    Width = 18
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 6
    OnClick = CheckBoxClick
  end
  object CheckBox6: TCheckBox
    Left = 401
    Top = 228
    Width = 18
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 7
    OnClick = CheckBoxClick
  end
  object CheckBox7: TCheckBox
    Left = 401
    Top = 252
    Width = 18
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 8
    OnClick = CheckBoxClick
  end
  object CheckBox8: TCheckBox
    Left = 401
    Top = 277
    Width = 18
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 9
    OnClick = CheckBoxClick
  end
  object CheckBox9: TCheckBox
    Left = 401
    Top = 303
    Width = 18
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 10
    OnClick = CheckBoxClick
  end
  object CheckBox10: TCheckBox
    Left = 401
    Top = 328
    Width = 18
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 11
    OnClick = CheckBoxClick
  end
  object CheckBox11: TCheckBox
    Left = 401
    Top = 352
    Width = 18
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 12
    OnClick = CheckBoxClick
  end
  object CheckBox12: TCheckBox
    Left = 401
    Top = 377
    Width = 18
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 13
    OnClick = CheckBoxClick
  end
  object CheckBox13: TCheckBox
    Left = 401
    Top = 401
    Width = 18
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 14
    OnClick = CheckBoxClick
  end
  object CheckBox14: TCheckBox
    Left = 401
    Top = 426
    Width = 18
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 15
    OnClick = CheckBoxClick
  end
  object CheckBox15: TCheckBox
    Left = 401
    Top = 451
    Width = 18
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 16
    OnClick = CheckBoxClick
  end
  object CheckBox16: TCheckBox
    Left = 401
    Top = 476
    Width = 18
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 17
    OnClick = CheckBoxClick
  end
  object Button1: TButton
    Left = 242
    Top = 506
    Width = 75
    Height = 25
    Caption = 'Sve changes'
    TabOrder = 18
    OnClick = Button1Click
    OnMouseEnter = Button1MouseEnter
    OnMouseLeave = Button1MouseLeave
  end
  object Button2: TButton
    Left = 380
    Top = 63
    Width = 64
    Height = 34
    Caption = 'Remove ASLR only'
    TabOrder = 19
    WordWrap = True
    OnClick = Button2Click
    OnMouseEnter = Button2MouseEnter
    OnMouseLeave = Button2MouseLeave
  end
  object Button3: TButton
    Left = 382
    Top = 24
    Width = 62
    Height = 41
    Caption = 'Remove all proteccion'
    TabOrder = 20
    WordWrap = True
    OnClick = Button3Click
    OnMouseEnter = Button3MouseEnter
    OnMouseLeave = Button3MouseLeave
  end
  object BitBtn1: TBitBtn
    Left = 190
    Top = 40
    Width = 57
    Height = 25
    Caption = 'Help ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
    OnClick = BitBtn1Click
  end
  object OpenDialog1: TOpenDialog
    Left = 264
    Top = 24
  end
  object SaveDialog1: TSaveDialog
    Left = 296
    Top = 24
  end
end
