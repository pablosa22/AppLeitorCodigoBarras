<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PainelAlmoxarifado.aspx.cs" Inherits="AppConferenciaABP.PainelAlmoxarifado" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta http-equiv="refresh" content="15" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="estilo.css" />
    <title>Painel Almoxarifado</title>  
</head>
<body>
    <form id="form1" runat="server">
        <div class="pb-2 mt-4 mb-2 border-bottom container">
		    <h4>Pedidos para Separação Almoxarifado</h4>                
	    </div>      
         <div class="row">            
            <div class="col-1 col-sm-1 col-md-1 col-lg-1 col-xl-1">
            </div>    
             <div class="col-10 col-sm-10 col-md-10 col-lg-10 col-xl-10">
			   <asp:GridView ID="GridView1" runat="server" Width="100%" CellPadding="4" ForeColor="White" Font-Size="10pt" CssClass="table table-bordered table-dark" GridLines="None" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">                   
               </asp:GridView>                                     
            </div>              
         </div>
        <div class="row">            
            <div class="col-1 col-sm-1 col-md-1 col-lg-1 col-xl-1">
            </div>             
                <div class="col-10 col-sm-10 col-md-10 col-lg-10 col-xl-10">
                    <div class="pb-2 mt-4 mb-2 border-bottom container">
		                <h6>Último Pedido e item conferido</h6>
                    </div>              
	            </div>
        </div>
        <div class="row"> 
             <div class="col-1 col-sm-1 col-md-1 col-lg-1 col-xl-1">
             </div>  
             <div class="col-10 col-sm-10 col-md-10 col-lg-10 col-xl-10">
                  <asp:Label ID="LbPedido" class="container" runat="server" />
                  <asp:Label ID="LbCodigo" class="container" runat="server" />		               
                  <asp:Label ID="LbDescicao" class="container" runat="server" />              
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
