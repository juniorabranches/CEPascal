unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXJSON, DBXJSONReflect,  idHTTP, IdSSLOpenSSL,
  Vcl.StdCtrls, VSDEdit, VSEdit;

type
  TForm1 = class(TForm)
    Label8: TLabel;
    VSEditCEP: TVSEdit;
    Label2: TLabel;
    VSEditEndereco: TVSEdit;
    Label71: TLabel;
    MemoComplemento: TMemo;
    VSDEditCidade: TVSDEdit;
    VSEditBairro: TVSEdit;
    VSDEditEstado: TVSDEdit;
    VSEditIBGE: TVSDEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BTNCep: TButton;
    BtnLimpar: TButton;
    procedure BTNCepClick(Sender: TObject);
    procedure VSEditCEPKeyPress(Sender: TObject; var Key: Char);
    procedure BtnLimparClick(Sender: TObject);
  private
    { Private declarations }
   function GetCEP(CEP:string): TJSONObject;
   procedure CarregaCep(JSON: TJSONObject);
   procedure LimpaCamposCEP;
   procedure KeyPressNumerico(var Tecla: Char);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BTNCepClick(Sender: TObject);
var
   LJsonObj: TJSONObject;
begin
   if length(VSEditCEP.Text) <> 8 then
   begin
      showMessage('CEP incorreto');
      LimpaCamposCEP;
      VSEditCEP.SetFocus;
      exit;
   end;

   LJsonObj := GetCEP(VSEditCEP.text);
   if LJsonOBJ <> nil then
      CarregaCep(LJsonObj)
   else
   begin
      showMessage('CEP inválido ou não encontrado');
      LimpaCamposCEP;
      VSEditCEP.SetFocus;
      exit;
   end;
end;

procedure TForm1.BtnLimparClick(Sender: TObject);
begin
   LimpaCamposCEP;
   VSEditCEP.SetFocus;
end;

procedure TForm1.CarregaCep(JSON: TJSONObject);
begin
   VSEditEndereco.Text := JSON.Get('logradouro').JsonValue.Value;
   VSDEditCidade.Text  := UpperCase(JSON.Get('localidade').JsonValue.Value);
   VSEditBairro.Text   := JSON.Get('bairro').JsonValue.Value;
   VSDEditEstado.Text  := JSON.Get('uf').JsonValue.Value;
   MemoComplemento.Lines.Add(JSON.Get('complemento').JsonValue.Value);
   VSEditIBGE.Text     := JSON.Get('ibge').JsonValue.Value;
end;

function TForm1.GetCEP(CEP: string): TJSONObject;
var
   HTTP: TIdHTTP;
   IDSSLHandler : TIdSSLIOHandlerSocketOpenSSL;
   Response: TStringStream;
   LJsonObj: TJSONObject;
begin
   try
      HTTP := TIdHTTP.Create;
      IDSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create;
      HTTP.IOHandler := IDSSLHandler;
      Response := TStringStream.Create('');
      HTTP.Get('https://viacep.com.br/ws/' + CEP + '/json', Response);
      if (HTTP.ResponseCode = 200) and not(Utf8ToAnsi(Response.DataString) = '{'#$A'  "erro": true'#$A'}') then
         Result := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes( Utf8ToAnsi(Response.DataString)), 0) as TJSONObject;
   finally
      FreeAndNil(HTTP);
      FreeAndNil(IDSSLHandler);
      Response.Destroy;
   end;
end;

procedure TForm1.KeyPressNumerico(var Tecla: Char);
begin
   if Tecla <> #8 then begin
      if not (Tecla in ['0'..'9']) then begin
         Tecla := #0;
      end;
   end;
end;

procedure TForm1.LimpaCamposCEP;
begin
   VSEditCEP.Text       := '';
   VSEditEndereco.Text  := '';
   VSEditBairro.Text    := '';
   VSDEditCidade.Text   := '';
   VSDEditEstado.Text   := '';
   VSEditIBGE.Text      := '';
   MemoComplemento.Lines.Clear;
end;

procedure TForm1.VSEditCEPKeyPress(Sender: TObject; var Key: Char);
begin
   KeyPressNumerico(Key);
end;

end.
