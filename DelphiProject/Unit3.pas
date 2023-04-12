unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, jpeg, ExtCtrls, Buttons;

type
  TForm3 = class(TForm)
    LoadButton: TButton;
    OpenDialog1: TOpenDialog;
    StringGrid1: TStringGrid;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    Button2: TButton;
    Button3: TButton;
    Image1: TImage;
    BitBtn1: TBitBtn;
    procedure LoadButtonClick(Sender: TObject);
    procedure UpdateBitsGrid(DllCharacteristics: Word);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox17Click(Sender: TObject);
    procedure CheckBoxClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure StringGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure LoadButtonMouseEnter(Sender: TObject);
    procedure LoadButtonMouseLeave(Sender: TObject);
    procedure Button1MouseEnter(Sender: TObject);
    procedure Button1MouseLeave(Sender: TObject);
    procedure Button2MouseEnter(Sender: TObject);
    procedure Button2MouseLeave(Sender: TObject);
    procedure Button3MouseEnter(Sender: TObject);
    procedure Button3MouseLeave(Sender: TObject);
     
  private
    { Private declarations }
    var
     FNTHeaders: TImageNtHeaders;
      PEFile: TMemoryStream;
       FileName: string;


    function IntToBin(Value: Word; Digits: Integer): string;

  public
    { Public declarations }
       procedure BeforeDestruction; override;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}
procedure TForm3.BeforeDestruction;
begin
  PEFile.Free;
  inherited;
end;


procedure TForm3.BitBtn1Click(Sender: TObject);
begin
  if Screen.Cursor = crHelp then
  begin
    Screen.Cursor := crDefault;
    BitBtn1.Font.Color := clBlack;
  end
  else
  begin
    Screen.Cursor := crHelp;
    BitBtn1.Font.Color := clRed;
  end;
end;



procedure TForm3.Button1Click(Sender: TObject);
var
  i: Integer;
  BitValue: Word;
  ModifiedFileName: string;
begin
// Comprobar si se ha seleccionado un archivo
  if FileName = '' then
  begin
    ShowMessage('Please open a file first.');
    Exit;
  end;
  for i := 1 to 16 do
  begin
    BitValue := 1 shl (16 - i);
    if TCheckBox(FindComponent('CheckBox' + IntToStr(i))).Checked then
      FNTHeaders.OptionalHeader.DllCharacteristics := FNTHeaders.OptionalHeader.DllCharacteristics or BitValue
    else
      FNTHeaders.OptionalHeader.DllCharacteristics := FNTHeaders.OptionalHeader.DllCharacteristics and (not BitValue);
  end;

  // Actualizar el archivo PE en memoria con los nuevos valores de FNTHeaders
  Move(FNTHeaders, Pointer(NativeUInt(PEFile.Memory) + PImageDosHeader(PEFile.Memory)._lfanew)^, SizeOf(TImageNtHeaders));

  // Establecer el nombre de archivo predeterminado para guardar
  ModifiedFileName := ChangeFileExt(FileName, '_ASLRmodified' + ExtractFileExt(FileName));
  SaveDialog1.FileName := ModifiedFileName;

  // Mostrar el cuadro de diálogo de guardado y guardar el archivo si el usuario hace clic en Guardar
  if SaveDialog1.Execute then
  begin
    PEFile.Seek(0, soFromBeginning);
    PEFile.SaveToFile(SaveDialog1.FileName);
    ShowMessage('Changes saved. The File has been saved as: ' + SaveDialog1.FileName);
  end;
end;





procedure TForm3.Button1MouseEnter(Sender: TObject);
begin
  if Screen.Cursor = crHelp then
    Button1.Hint := 'Save changes in a new file'
  else
    Button1.Hint := '';
  Button1.ShowHint := True;
end;


procedure TForm3.Button1MouseLeave(Sender: TObject);
begin
  Button1.ShowHint := False;
end;


procedure TForm3.Button2Click(Sender: TObject);
begin
  // Desactivar solo los bits 5 y 6
  CheckBox11.Checked := False;
  CheckBox10.Checked := False;

  // Actualizar el estado de ASLR y la columna correspondiente del TStringGrid
  FNTHeaders.OptionalHeader.DllCharacteristics :=
    FNTHeaders.OptionalHeader.DllCharacteristics and (not (1 shl 5)) and (not (1 shl 6));
  UpdateBitsGrid(FNTHeaders.OptionalHeader.DllCharacteristics);
end;
procedure TForm3.Button2MouseEnter(Sender: TObject);
begin
  if Screen.Cursor = crHelp then
    Button2.Hint := 'Disable bits 5 and 6'
  else
    Button2.Hint := '';
  Button2.ShowHint := True;
end;


procedure TForm3.Button2MouseLeave(Sender: TObject);
begin
  Button2.ShowHint := False;
end;


procedure TForm3.Button3Click(Sender: TObject);
begin

// Desactivar solo los bits 5 6 7 y 8
  CheckBox11.Checked := False;
  CheckBox10.Checked := False;
  CheckBox9.Checked := False;
  CheckBox8.Checked := False;

  // Actualizar el estado de ASLR y la columna correspondiente del TStringGrid
  FNTHeaders.OptionalHeader.DllCharacteristics :=
    FNTHeaders.OptionalHeader.DllCharacteristics and (not (1 shl 5)) and (not (1 shl 6)) and (not (1 shl 7)) and (not (1 shl 8));
  UpdateBitsGrid(FNTHeaders.OptionalHeader.DllCharacteristics);
end;


procedure TForm3.Button3MouseEnter(Sender: TObject);
begin
  if Screen.Cursor = crHelp then
    Button3.Hint := 'Disable bits 5, 6, 7 and 8'
  else
    Button3.Hint := '';
  Button3.ShowHint := True;
end;


procedure TForm3.Button3MouseLeave(Sender: TObject);
begin
  Button3.ShowHint := False;
end;


procedure TForm3.CheckBox17Click(Sender: TObject);
begin
 FNTHeaders.OptionalHeader.DllCharacteristics := $0000;
end;

procedure TForm3.CheckBoxClick(Sender: TObject);
var
  BitIndex: Integer;
begin
 BitIndex := 15 - StrToInt(Copy(TComponent(Sender).Name, 9, 2)) + 1;


  // Actualizar el estado de ASLR y la columna correspondiente del TStringGrid
  if TCheckBox(Sender).Checked then
  begin
    FNTHeaders.OptionalHeader.DllCharacteristics := FNTHeaders.OptionalHeader.DllCharacteristics or (1 shl BitIndex);
  end
  else
  begin
    FNTHeaders.OptionalHeader.DllCharacteristics := FNTHeaders.OptionalHeader.DllCharacteristics and (not (1 shl BitIndex));
  end;
  UpdateBitsGrid(FNTHeaders.OptionalHeader.DllCharacteristics);

  
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  StringGrid1.Row := 0;
  StringGrid1.Col := 1;
  UpdateBitsGrid(FNTHeaders.OptionalHeader.DllCharacteristics);
end;



function TForm3.IntToBin(Value: Word; Digits: Integer): string;
var
  i: Integer;
begin
  Result := '';
  for i := Digits - 1 downto 0 do
  begin
    if (Value and (1 shl i)) <> 0 then
      Result := Result + '1'
       else
      Result := Result + '0';
  end;
end;

procedure TForm3.UpdateBitsGrid(DllCharacteristics: Word);
const
  BitDescriptions: array[0..15] of string = (
    'Reserved', 'Reserved', 'Reserved', 'Reserved', 'Reserved',
    'HIGH_ENTROPY_VA',
    'DYNAMIC_BASE',
    'FORCE_INTEGRITY',
    'NX_COMPAT',
    'NO_ISOLATION',
    'NO_SEH',
    'NO_BIND',
    'Reserved',
    'WDM_DRIVER',
    'Reserved',
    'TERMINAL_SERVER_AWARE'
  );

var
  i: Integer;
begin
  StringGrid1.Cells[0, 0] := 'Bit';
  StringGrid1.Cells[1, 0] := 'Value';
  StringGrid1.Cells[2, 0] := 'Description';
  //StringGrid1.Cells[3, 0] := 'Disable all -->';

  for i := 15 downto 0 do
  begin
    StringGrid1.Cells[0, 15 - i + 1] := IntToStr(i);
    StringGrid1.Cells[2, 15 - i + 1] := BitDescriptions[i];
    if (DllCharacteristics and (1 shl i)) <> 0 then
    begin
      StringGrid1.Cells[1, 15 - i + 1] := '1';
      StringGrid1.Cells[3, 15 - i + 1] := 'Enabled';
    end
    else
    begin
      StringGrid1.Cells[1, 15 - i + 1] := '0';
      StringGrid1.Cells[3, 15 - i + 1] := 'Disabled';
    end;
  end;
end;

// Resto del código

procedure TForm3.LoadButtonClick(Sender: TObject);
const
  IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE = $40;
  IMAGE_DOS_SIGNATURE = $5A4D; // "MZ"
  IMAGE_NT_SIGNATURE = $00004550; // "PE"

var
  DOSHeader: PImageDosHeader;
  DllCharacteristicsBits: string;
  i: Integer;
  BitValue: Word;
begin
  if OpenDialog1.Execute then
  begin
    FileName := OpenDialog1.FileName;
    PEFile := TMemoryStream.Create;
    PEFile.LoadFromFile(FileName);
    DOSHeader := PEFile.Memory;

    // Comprobar si es un archivo ejecutable PE
    if (DOSHeader.e_magic <> IMAGE_DOS_SIGNATURE) or (PImageNtHeaders(NativeUInt(PEFile.Memory) + DOSHeader._lfanew).Signature <> IMAGE_NT_SIGNATURE) then
    begin
      ShowMessage('The selected file is not a PE executable.');
      Exit;
    end;

    // Inicializa FNTHeaders con el valor actual de NTHeaders
    Move(Pointer(NativeUInt(PEFile.Memory) + DOSHeader._lfanew)^, FNTHeaders, SizeOf(TImageNtHeaders));

    DllCharacteristicsBits := IntToBin(FNTHeaders.OptionalHeader.DllCharacteristics, 16); // Convertir a binario (16 bits)
    UpdateBitsGrid(FNTHeaders.OptionalHeader.DllCharacteristics);
    // Actualizar los TCheckBox según los valores de DllCharacteristics
    for i := 1 to 16 do
    begin
      BitValue := 1 shl (16 - i);
      TCheckBox(FindComponent('CheckBox' + IntToStr(i))).Checked := (FNTHeaders.OptionalHeader.DllCharacteristics and BitValue) <> 0;
    end;

    // Comprobar si ASLR está activado
    if FNTHeaders.OptionalHeader.DllCharacteristics <> $0000 then
    begin
      ShowMessage('DLL Characteristics WORD: ' + IntToHex(FNTHeaders.OptionalHeader.DllCharacteristics, 4));
    end
    else
    begin
      ShowMessage('ASLR not activated!' + sLineBreak + 'DLL Characteristics WORD: ' + IntToHex(FNTHeaders.OptionalHeader.DllCharacteristics, 4));
    end;
  end;
end;





procedure TForm3.LoadButtonMouseEnter(Sender: TObject);
begin
  if Screen.Cursor = crHelp then
    LoadButton.Hint := 'Open PE file'
  else
    LoadButton.Hint := '';
  LoadButton.ShowHint := True;
end;

procedure TForm3.LoadButtonMouseLeave(Sender: TObject);
begin
  LoadButton.ShowHint := False;
end;


procedure TForm3.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);


begin
  if (ARow > 0) and (ACol < 4) and (StringGrid1.Cells[3, ARow] = 'Enabled') then
  begin
    StringGrid1.Canvas.Font.Style := [fsBold];
  end
  else
  begin
    StringGrid1.Canvas.Font.Style := [];
  end;

  StringGrid1.Canvas.FillRect(Rect);
  StringGrid1.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, StringGrid1.Cells[ACol, ARow]);
end;




// Paso 3: Agregue el evento OnMouseMove al StringGrid1
// Modifique el evento OnMouseMove en StringGrid1
procedure TForm3.StringGrid1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  ACol, ARow: Integer;
begin
  StringGrid1.MouseToCell(X, Y, ACol, ARow);
  if (Screen.Cursor = crHelp) and (ACol = 2) then
  begin
    if (ARow = 1) then
    begin
      StringGrid1.Hint := 'Compatibility with execution in a Terminal Server environment.';
    end
    else if (ARow = 3) then
    begin
      StringGrid1.Hint := 'PE file is a Windows Driver Model (WDM) driver';
    end
     else if (ARow = 5) then
    begin
      StringGrid1.Hint := 'PE file should not be bound during incremental linking';
    end
    else if (ARow = 6) then
    begin
      StringGrid1.Hint := 'Executable does not use Structured Exception Handling (SEH), making it harder to exploit vulnerabilities';
    end
    else if (ARow = 7) then
    begin
      StringGrid1.Hint := 'The file should not be isolated in the process activation context. Mainly used in manifest files';
    end
    else if (ARow = 8) then
    begin
      StringGrid1.Hint := 'compatibility with Data Execution Prevention (DEP), preventing memory areas marked as data from being executed';
    end
    else if (ARow = 9) then
    begin
      StringGrid1.Hint := 'Requires the OS to verify the signature of the files before loading. Ensures the file is not tampered with and comes from a trusted source';
    end
    else if (ARow = 10) then
    begin
      StringGrid1.Hint := 'the executable should be loaded at a random base memory address (ASLR), making it harder for an attacker to predict code locations';
    end
    else if (ARow = 11) then
    begin
      StringGrid1.Hint := 'Supports high-entropy memory addresses, improving ASLR by using more entropy bits for memory addresses';
    end
     else
  begin
    StringGrid1.Hint := '';
  end;
   Application.ActivateHint(Mouse.CursorPos);
  end;
end;



end.
