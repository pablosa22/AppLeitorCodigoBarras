<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AppConferenciaABP.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="estilo.css" />
    <link href="signin.css" rel="stylesheet" />
    <script type="text/javascript" DEFER="DEFER">
        // INICIO FUNÇÃO DE MASCARA MAIUSCULA
        function maiuscula(z){
                v = z.value.toUpperCase();
                z.value = v;
        }
        //FIM DA FUNÇÃO MASCARA MAIUSCULA            
    </script>
    <title>Tela de Acesso</title>
</head>
<body class="text-center">
    <form runat="server">         
        <br />
        <br />
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Img/aco2.png"/>                     
        <br />
        <br />
        <div class="container ">
                <asp:TextBox ID="TextBoxMatricula" placeholder="Matricula" class="form-control" runat="server"></asp:TextBox>
            <br />
                <asp:TextBox ID="TextBoxUsuario" placeholder="Usuário" class="form-control" runat="server" onkeyup="maiuscula(this)"></asp:TextBox>
            <br />       
                <asp:Button ID="btEntrar" class="btn btn-outline-success btn-block" runat="server" Text="Entrar" OnClick="btEntrar_Click" />                    
            <br />                 
            <p class="mt-5 mb-3 text-muted">&copy; Desenvolvido Pela TI AçoBrazil Versão 4.2</p>
            <asp:Label ID="lbDescricao" class="container" runat="server">Filial: 2 - Aço Bompreço</asp:Label>
        </div>
    </form>
  </body>
</html>
