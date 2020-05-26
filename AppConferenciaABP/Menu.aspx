<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="AppConferenciaABP.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="estilo.css" />
    <link href="signin.css" rel="stylesheet" />
    <title>Menu Opções</title>
   

</head>
<body>
    <form id="form1" runat="server">
        <div class="col-1">
        </div>
        <br />
        <div class="col-lg-11 pb-3 mt-3 mb-3 border-bottom container text-center">		                
            <h4>Filial: 2 - Comercial Aço BomPreço Ltda</h4>            
	    </div><br />

        <div class="row">
                <div class="col-lg-4 text-center">
                    <div id="linkAlmoxarifado" onclick="window.location='http://192.168.251.2:8384/PainelAlmoxarifado.aspx'">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/Almoxarifado.png"  width="20%"/>                
                        <h4>Painel Almoxarifado</h4>
                    </div>
                </div>                
            
             <div class="col-lg-4 text-center">
                <div id="linkFaturamento" onclick="window.location='http://192.168.251.2:8384/PainelFaturamento.aspx'">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/img/Faturamento.png"  width="20%"/>                
                    <h4>Painel Faturamento</h4>
                </div>
            </div>
             <div class="col-lg-4 text-center">
                 <div id="linkConferencia" onclick="window.location='http://192.168.251.2:8384/PainelConferencia.aspx'">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/img/Conferencia.png"  width="20%"/>                
                    <h4>Painel Conferência</h4>
                </div>
            </div>
        </div>
        <br /><br /><br /><br />
        <div class="row">
            
            <div class="col-lg-4 text-center">
                <div id="linkLancamento" onclick="window.location='http://192.168.251.2:8384/EnviaPedidoConferencia.aspx'">
                    <asp:Image ID="Image6" runat="server" ImageUrl="~/img/LancarParaConferencia.png"  width="20%"/>                                    
                    <h4>Iniciar Conferência</h4>
                </div>                
            </div>

            <div class="col-lg-4 text-center">
                <div id="linkGrafico1" onclick="window.location='http://192.168.251.2:8384/Grafico.aspx'">
                    <asp:Image ID="Image5" runat="server" ImageUrl="~/img/Graficos.png"  width="20%"/>                
                    <h4>Gráficos Produtividade</h4>
                </div>
            </div>

        </div>
    </form>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>   
</body>
</html>