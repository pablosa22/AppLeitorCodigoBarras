using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppConferenciaABP
{
    public partial class FinalizaConferencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DesabilitarBotoes();
        }

        protected void btPesquisar_Click(object sender, EventArgs e)
        {
            ServiceReference3.WebService1SoapClient nn = new ServiceReference3.WebService1SoapClient();
            int matricula = string.IsNullOrEmpty(TextBoxCodConferente.Text) ? 0 : Convert.ToInt32(TextBoxCodConferente.Text);
            long pedido = string.IsNullOrEmpty(TextBoxNumero.Text) ? 0 : Convert.ToInt32(TextBoxNumero.Text);
            if (matricula != 0) 
            { 
                TextBoxConferente.Text = nn.ConfirmaMatricula(matricula).Nome;
                HabilitarBotoes();
                this.GridView1.DataSource = nn.ListaItensParaConferencia(pedido);
                this.GridView1.DataBind();
            }
        }

        protected void DesabilitarBotoes() 
        {
            btConfirmar.Visible = false;
        }

        protected void HabilitarBotoes() 
        {
            btConfirmar.Visible = true;
        }

        protected void btConfirmar_Click(object sender, EventArgs e)
        {
            ServiceReference3.WebService1SoapClient nn = new ServiceReference3.WebService1SoapClient();
            int matricula = string.IsNullOrEmpty(TextBoxCodConferente.Text) ? 0 : Convert.ToInt32(TextBoxCodConferente.Text);
            long pedido = string.IsNullOrEmpty(TextBoxNumero.Text) ? 0 : Convert.ToInt32(TextBoxNumero.Text);
            nn.ConfirmaConferenciaAutomatica(pedido, matricula);
            this.GridView1.DataBind();
            DesabilitarBotoes();
            TextBoxCodConferente.Text = "";
            TextBoxConferente.Text = "";
            TextBoxNumero.Text = "";
        }
    }
}