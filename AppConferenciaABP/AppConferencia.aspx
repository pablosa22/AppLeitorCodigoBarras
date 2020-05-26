<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppConferencia.aspx.cs" Inherits="AppConferenciaABP.AppConferencia" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="estilo.css" />  
    
    <script type="text/javascript">

        if (window.location.hash.substr(1, 2) == "zx") {
            var bc = window.location.hash.substr(3);
            localStorage["barcode"] = decodeURI(window.location.hash.substr(3))
            window.close();
            self.close();
            window.location.href = "about:blank";//In case self.close isn't allowed
        }
</script>
<SCRIPT type="text/javascript" >
    var changingHash = false;
    function onbarcode(event) {
        switch (event.type) {
            case "hashchange": {
                if (changingHash == true) {
                    return;
                }
                var hash = window.location.hash;
                if (hash.substr(0, 3) == "#zx") {
                    hash = window.location.hash.substr(3);
                    changingHash = true;
                    window.location.hash = event.oldURL.split("\#")[1] || ""
                    changingHash = false;
                    processBarcode(hash);
                }

                break;
            }
            case "storage": {
                window.focus();
                if (event.key == "barcode") {
                    window.removeEventListener("storage", onbarcode, false);
                    processBarcode(event.newValue);
                }
                break;
            }
            default: {
                console.log(event)
                break;
            }
        }
    }
    window.addEventListener("hashchange", onbarcode, false);

    function getScan() {
        var href = window.location.href;
        var ptr = href.lastIndexOf("#");
        if (ptr > 0) {
            href = href.substr(0, ptr);
        }
        window.addEventListener("storage", onbarcode, false);
        setTimeout('window.removeEventListener("storage", onbarcode, false)', 15000);
        localStorage.removeItem("barcode");
        //window.open  (href + "#zx" + new Date().toString());

        if (navigator.userAgent.match(/Firefox/i)) {
            //Used for Firefox. If Chrome uses this, it raises the "hashchanged" event only.
            window.location.href = ("zxing://scan/?ret=" + encodeURIComponent(href + "#zx{CODE}"));
        } else {
            //Used for Chrome. If Firefox uses this, it leaves the scan window open.
            window.open("zxing://scan/?ret=" + encodeURIComponent(href + "#zx{CODE}"));
        }
    }

    function processBarcode(bc) {
        document.getElementById("TextBoxCodigo").value = bc ;
        //put your code in place of the line above.
        btProduto.click();
    }

</SCRIPT>    

    <title>AppConferencia</title>
</head>
<body>
   <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">            
            <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Conferência</a>
            <a class="nav-item nav-link" id="nav-conferidos-tab" data-toggle="tab" href="#nav-conferidos" role="tab" aria-controls="nav-conferidos" aria-selected="false">Conferidos </a>
            <a class="nav-item nav-link" id="nav-restantes-tab" data-toggle="tab" href="#nav-restantes" role="tab" aria-controls="nav-restantes" aria-selected="false">A Conferir </a>
        </div>
    </nav>

    <form id="form1" action="#" runat="server">
    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
        

        <div class="pb-2 mt-4 mb-2 border-bottom container">          
            <asp:Label ID="LbMatricula" class="container" runat="server" />
            <asp:Label ID="LbNome" class="container" runat="server" />
        </div>

            <div class="form-group row container">
                <asp:Label class="container" runat="server">Pedido</asp:Label>
                <div class="col-6 col-sm-6 col-md-8 col-lg-8 col-xl-10">
                    <asp:TextBox ID="TextBoxPedido" class="form-control" runat="server" ></asp:TextBox>
                </div>
                <asp:Button ID="btPesquisar" class="btn btn-outline-dark" runat="server" Text="Pesquisar" OnClick="btPesquisar_Click" />
            </div>

            <div class="form-group row container">
                <asp:Label ID="lbCodigo" class="container" runat="server">Código</asp:Label>
                <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                    <asp:TextBox id="TextBoxCodigo" Text="" class="form-control" runat="server" ></asp:TextBox>
                </div>
                <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                    <asp:Button ID="btProduto" class="btn btn-outline-primary" runat="server" Text="Pesquisar" OnClick="btProduto_Click" />               
                </div>
                <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Img/codebar.png" onclick="getScan();"/>                
                </div>
            </div>

            <div class="form-group row container">
                <asp:Label ID="lbDescricao" class="container" runat="server">Descrição</asp:Label>
                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                    <asp:TextBox ID="TextBoxDescricao" ReadOnly="True" class="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

             <div class="form-group row container">                
                <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                    <asp:Label ID="lbQtPedida" class="container" runat="server">Qt.Pedida</asp:Label>
                    <asp:TextBox ID="TextBoxQtPedida" ReadOnly="True" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                    <asp:Label ID="lbQtConf" class="container" runat="server">Qt.Conferida</asp:Label>
                    <asp:TextBox ID="TextBoxConferida" class="form-control" runat="server"></asp:TextBox>                    
                </div>
                 <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                    <br />
                    <asp:Button ID="btConfirmar" class="btn btn-outline-success" runat="server" Text="Confirmar" OnClick="btConfirmar_Click" />                    
                </div>
                <div class="col-10 col-sm-10 col-md-10 col-lg-10 col-xl-10" >
                    <br />
                    <asp:Button ID="btFinalizarConf" align="center" class="btn btn-danger btn-lg btn-block" runat="server" Text="Finalizar Conferência" OnClick="btFinalizarConf_Click" />                    
                </div>

            </div>         
    </div>

    <!-- Fim da 1ª Aba de conferencia-->    
    <!-- Inicio da Aba Produtos Conferidos-->
        <div class="tab-pane fade" id="nav-conferidos" role="tabpanel" aria-labelledby="nav-profile-tab">
            <div class="pb-2 mt-4 mb-2 border-bottom container">
                <h4>Produtos Conferidos</h4>                
                   <asp:GridView ID="GridView2" runat="server" Width="100%" CellPadding="4" ForeColor="White" Font-Size="8" CssClass="table table-bordered table-dark" GridLines="None" AllowPaging="False">           
                   </asp:GridView> 
            </div>            
        </div>
    <!-- Fim da 2ª Aba de conferencia-->    
    <!-- Inicio da Aba Produtos a Conferir-->    
        <div class="tab-pane fade" id="nav-restantes" role="tabpanel" aria-labelledby="nav-profile-tab">
			<div class="pb-2 mt-4 mb-2 border-bottom container">
				<h4>Produtos a Conferir</h4>                
			        <asp:GridView ID="GridView1" runat="server" Width="100%" CellPadding="4" ForeColor="White" Font-Size="8" CssClass="table table-bordered table-dark" GridLines="None" AllowPaging="False">           
                    </asp:GridView>                                     
			</div>	
             <br />
            <div class="pb-2 mt-4 mb-2 border-bottom container">
                <h6>Detalhes</h6>                
                   <asp:GridView ID="GridView3" runat="server" Width="100%" CellPadding="4" ForeColor="Black" Font-Size="8" CssClass="table table-bordered" GridLines="None" AllowPaging="False">           
                   </asp:GridView>
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
