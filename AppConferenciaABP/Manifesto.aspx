<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manifesto.aspx.cs" Inherits="AppConferenciaABP.Manifesto" %>

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
    <title>Manifesto</title>  
</head>
<body>
    <form id="form1" runat="server">
             <div class="pb-2 mt-4 mb-2 border-bottom container">
                <h6>Dados do Motorista</h6> 
             </div>
             <div class="form-group row container">
                <asp:Label class="container" runat="server">Nome</asp:Label>
                <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                    <asp:TextBox ID="TextBoxNome" class="form-control" runat="server"></asp:TextBox>
                </div>
                <asp:Label class="container" runat="server">CPF</asp:Label>
                <div class="col-10 col-sm-10 col-md-10 col-lg-10 col-xl-10">
                    <asp:TextBox ID="TextBoxCPF" class="form-control" runat="server"></asp:TextBox>
                </div>               
            </div> 
            <div class="pb-2 mt-4 mb-2 border-bottom container">
                <h6>Dados do Veiculo</h6> 
            </div>  
                <div class="row">
                        <div class="col-1 col-sm-1 col-md-1 col-lg-1 col-xl-1">
                        </div>
                        
                        <div class="col-6 col-sm-6 col-md-6 col-lg-6 col-xl-6">
                            <asp:Label runat="server">Marca</asp:Label>
                        </div>
                        <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                            <asp:Label runat="server">Placa</asp:Label>
                        </div>                        
                </div>           
                <div class="row">
                    <div class="col-1 col-sm-1 col-md-1 col-lg-1 col-xl-1">
                    </div>
                    <div class="col-6 col-sm-6 col-md-6 col-lg-6 col-xl-6">
                        <asp:TextBox ID="TextBoxMarca" class="form-control" runat="server"></asp:TextBox>
                    </div>
                     <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                        <asp:TextBox ID="TextBoxPlaca" class="form-control" runat="server"></asp:TextBox>
                    </div>              
                </div>
                <div class="row">
                    <div class="col-1 col-sm-1 col-md-1 col-lg-1 col-xl-1">
                    </div>  
                     <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                        <asp:Label runat="server">UF</asp:Label>
                     </div>
                </div>
                
                <div class="row">
                    <div class="col-1 col-sm-1 col-md-1 col-lg-1 col-xl-1">
                    </div>  
                    <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                        <asp:TextBox ID="TextBoxUF" class="form-control" runat="server"></asp:TextBox>
                    </div>                    
                </div>
             <div class="pb-2 mt-4 mb-2 border-bottom container">
                <h6>Endereço</h6> 
            </div>  
                <div class="row">
                     <div class="col-1 col-sm-1 col-md-1 col-lg-1 col-xl-1">
                    </div>
                     <div class="col-11 col-sm-11 col-md-11 col-lg-11 col-xl-11">
                            <asp:Label runat="server">Rua</asp:Label>
                     </div> 
                </div>
               
                <div class="row">
                    <div class="col-1 col-sm-1 col-md-1 col-lg-1 col-xl-1">
                    </div>
                    <div class="col-10 col-sm-10 col-md-10 col-lg-10 col-xl-10">
                        <asp:TextBox ID="TextBoxRua" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                
                 <div class="row">
                     <div class="col-1 col-sm-1 col-md-1 col-lg-1 col-xl-1">
                    </div>
                     <div class="col-5 col-sm-5 col-md-5 col-lg-5 col-xl-5">
                            <asp:Label runat="server">Bairro</asp:Label>
                     </div> 
                     <div class="col-5 col-sm-5 col-md-5 col-lg-5 col-xl-5">
                            <asp:Label runat="server">Cidade</asp:Label>
                     </div>
                </div> 
                
                <div class="row">
                    <div class="col-1 col-sm-1 col-md-1 col-lg-1 col-xl-1">
                    </div>
                    <div class="col-5 col-sm-5 col-md-5 col-lg-5 col-xl-5">
                        <asp:TextBox ID="TextBoxBairro" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-5 col-sm-5 col-md-5 col-lg-5 col-xl-5">
                        <asp:TextBox ID="TextBoxCidade" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                     <div class="col-1 col-sm-1 col-md-1 col-lg-1 col-xl-1">
                    </div>
                    <div class="col-2 col-sm-2 col-md-2 col-lg-2 col-xl-2">
                            <asp:Label runat="server">UF</asp:Label>
                     </div>
                </div>
                <div class="row">
                    <div class="col-1 col-sm-1 col-md-1 col-lg-1 col-xl-1">
                    </div>
                    <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                        <asp:TextBox ID="TextBoxUFEnd" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:Button ID="btSalvar" class="btn btn-outline-success" runat="server" Text="Salvar"  />
                    <div class="col-1 col-sm-1 col-md-1 col-lg-1 col-xl-1">
                    </div>
                    <asp:Button ID="btVoltar" class="btn btn-outline-danger" runat="server" Text="Sair"  />
                </div>

    </form>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>   
</body>
</html>
