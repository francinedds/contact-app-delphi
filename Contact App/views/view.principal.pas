unit view.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Buttons, Vcl.WinXPanels, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ComCtrls, service.conexao, Vcl.Menus;

type
  TViewPrincipal = class(TForm)
    pnlBackground: TPanel;
    CardPanel: TCardPanel;
    CardHome: TCard;
    imagePrincipal: TImage;
    menu: TImage;
    pnlMenu: TPanel;
    btnContatos: TSpeedButton;
    btnNovoContato: TSpeedButton;
    lineDetail: TPanel;
    lineDetail2: TPanel;
    CardContatos: TCard;
    SearchBox: TSearchBox;
    ListView: TListView;
    CardNovoContato: TCard;
    lblTitleCardNovoContato: TLabel;
    edtNomeCompleto: TEdit;
    lblNomeCompleto: TLabel;
    lblTelefone: TLabel;
    edtTelefone: TEdit;
    pnlBtnSalvar: TPanel;
    btnSalvar: TSpeedButton;
    homeCardNovoContato: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    TimerMenu: TTimer;
    bg: TImage;
    bgCardNovoContato: TImage;
    bgCardContatos: TImage;
    homeCardContatos: TImage;
    lblTitle: TLabel;
    lineCardContato: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    PopupMenu: TPopupMenu;
    Editar1: TMenuItem;
    Deletar1: TMenuItem;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure menuClick(Sender: TObject);
    procedure homeCardContatosClick(Sender: TObject);
    procedure btnContatosClick(Sender: TObject);
    procedure homeClick(Sender: TObject);
    procedure homeCardNovoContatoClick(Sender: TObject);
    procedure btnNovoContatoClick(Sender: TObject);
    procedure TimerMenuTimer(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure SearchBoxChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SearchBoxEnter(Sender: TObject);
  private
    { Private declarations }
    procedure ExibirContatos(const Filtro: string);
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

procedure TViewPrincipal.btnContatosClick(Sender: TObject);
begin
   CardPanel.ActiveCard := CardContatos;
end;

procedure TViewPrincipal.btnNovoContatoClick(Sender: TObject);
begin
  CardPanel.ActiveCard := CardNovoContato;
end;

procedure TViewPrincipal.btnSalvarClick(Sender: TObject);
begin
  ServiceConexao.FDQuery_Pessoas.SQL.Text := 'INSERT INTO Pessoas (pes_nomecompleto, pes_cpf, pes_telefone, pes_email) ' +
                       'VALUES (:pes_nomecompleto, :pes_cpf, :pes_telefone, :pes_email)';
  ServiceConexao.FDQuery_Pessoas.ParamByName('pes_nomecompleto').AsString := edtNomeCompleto.Text;
  ServiceConexao.FDQuery_Pessoas.ParamByName('pes_cpf').AsString          := 'Não Informado';
  ServiceConexao.FDQuery_Pessoas.ParamByName('pes_telefone').AsString     := edtTelefone.Text;
  ServiceConexao.FDQuery_Pessoas.ParamByName('pes_email').AsString        := 'Não Informado';
  ServiceConexao.FDQuery_Pessoas.ExecSQL;

  ShowMessage('Salvo com sucesso!');
end;

procedure TViewPrincipal.ExibirContatos(const Filtro: string);
  var
  NomeCompleto, Telefone: string;
  ListItem: TListItem;
begin
  ListView.Items.BeginUpdate;

  try
    ListView.Items.Clear;

    // filtro
    ServiceConexao.FDQuery_Pessoas.Close;
    ServiceConexao.FDQuery_Pessoas.SQL.Text :=
      'SELECT pes_codigo, pes_nomecompleto, pes_telefone, pes_email ' +
      'FROM Pessoas ' +
      'WHERE LOWER(pes_nomecompleto) LIKE :filtro';
    ServiceConexao.FDQuery_Pessoas.ParamByName('filtro').AsString := '%' + LowerCase(Filtro) + '%';
    ServiceConexao.FDQuery_Pessoas.Open;

    // preenche com os dados filtrados
    while not ServiceConexao.FDQuery_Pessoas.Eof do
    begin
      NomeCompleto := ServiceConexao.FDQuery_Pessoas.FieldByName('pes_nomecompleto').AsString;
      Telefone     := ServiceConexao.FDQuery_Pessoas.FieldByName('pes_telefone').AsString;

      ListItem := ListView.Items.Add;
      ListItem.Caption := NomeCompleto;
      ListItem.SubItems.Add(Telefone);

      ServiceConexao.FDQuery_Pessoas.Next;
    end;

    ServiceConexao.FDQuery_Pessoas.Close;
  finally
    ListView.Items.EndUpdate;
  end;
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
var
region : hrgn;
begin
  // inicializa o menu lateral com a largura 0 (oculto)
  pnlMenu.Width := 0;
  TimerMenu.Enabled := False;  // o timer inicialmente está desativado

  CardPanel.ActiveCard := CardHome;

  //arredondar os cantos
  begin
    region:= CreateRoundRectRgn(0, 0, width, height, 20, 20);
    setwindowrgn(handle, region, true);
  end;
end;

procedure TViewPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Close;
  end;
end;

procedure TViewPrincipal.FormShow(Sender: TObject);
begin
  ExibirContatos(SearchBox.Text);
end;

procedure TViewPrincipal.homeCardContatosClick(Sender: TObject);
begin
  CardPanel.ActiveCard := CardHome;
end;

procedure TViewPrincipal.homeCardNovoContatoClick(Sender: TObject);
begin
  CardPanel.ActiveCard := CardHome;
end;

procedure TViewPrincipal.homeClick(Sender: TObject);
begin
  CardPanel.ActiveCard := CardHome;
end;

procedure TViewPrincipal.menuClick(Sender: TObject);
begin
  // verifica se o menu está visível ou oculto e faz a animação
  if pnlMenu.Width = 0 then
  begin
    TimerMenu.Tag := 1;  // indicador de que o menu deve abrir
    TimerMenu.Enabled := True;
  end
  else
  begin
    TimerMenu.Tag := -1;  // indicador de que o menu deve fechar
    TimerMenu.Enabled := True;
  end;
end;

procedure TViewPrincipal.SearchBoxChange(Sender: TObject);
begin
  ExibirContatos(SearchBox.Text);
end;

procedure TViewPrincipal.SearchBoxEnter(Sender: TObject);
begin // limpa searchbox ao clicar
  SearchBox.Text := '';
end;

procedure TViewPrincipal.TimerMenuTimer(Sender: TObject);
begin
  // controla a animação de abertura ou fechamento do menu
  if TimerMenu.Tag = 1 then
  begin
    // aumenta a largura do menu para mostrar
    if pnlMenu.Width < 200 then
      pnlMenu.Width := pnlMenu.Width + 200
    else
      TimerMenu.Enabled := False;  // parar animação quando atingir o tamanho máximo
  end
  else if TimerMenu.Tag = -1 then
  begin
    // diminui a largura do menu para esconder
    if pnlMenu.Width > 0 then
      pnlMenu.Width := pnlMenu.Width - 200
    else
      TimerMenu.Enabled := False;  // parar animação quando atingir o tamanho mínimo
  end;
end;

end.

