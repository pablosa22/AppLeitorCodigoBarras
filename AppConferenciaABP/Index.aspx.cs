using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppConferenciaABP
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btEntrar_Click(object sender, EventArgs e)
        {
            int matricula = string.IsNullOrEmpty(TextBoxMatricula.Text)?0: Convert.ToInt32(TextBoxMatricula.Text);             
            string usuario = TextBoxUsuario.Text;
            ServiceReference3.WebService1SoapClient nn = new ServiceReference3.WebService1SoapClient();
            nn.ConfirmaAcesso(usuario, matricula);
            string name = "";
            int mat = 0;
            name = nn.ConfirmaAcesso(usuario, matricula).Nome;
            mat = nn.ConfirmaAcesso(usuario, matricula).Matricula;

            if (name != null && mat !=0)
            {
               Response.Redirect("AppConferencia.aspx?mat="+mat+ "&name="+name);
            }
            else
            {
                String mensagem = "Usuário ou senha incorreto!";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "MensagemDeAlert", "alert('" + mensagem + "');", true);                
            }
        }
    }
}