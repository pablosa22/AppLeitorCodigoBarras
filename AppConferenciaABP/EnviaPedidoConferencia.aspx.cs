using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppConferenciaABP
{
    public partial class EnviaPedidoConferencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btConfirmar_Click(object sender, EventArgs e)
        {
            int opcao = Convert.ToInt32(DropDownList1.SelectedItem.Value);
            int filial = Convert.ToInt32(DropDownList2.SelectedItem.Value);
            long numped = string.IsNullOrEmpty(TextBoxNumero.Text) ? 0 : Convert.ToInt64(TextBoxNumero.Text);
            ServiceReference3.WebService1SoapClient nn = new ServiceReference3.WebService1SoapClient();

            long numero = string.IsNullOrEmpty(TextBoxNumero.Text) ? 0 : Convert.ToInt64(TextBoxNumero.Text);
            int condVenda = nn.ValidaEnvioPedidoPainel(opcao, numero, filial).CondVenda;

            if (opcao == 2 && filial != 0 && numped < 999998 && condVenda == 8)
            {
                nn.EnviaPedidoParaPainel(opcao, numped, filial);
                String mensagem = "Pedido da NFC-e de N. " + numped + " enviado pra o painel!";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "MensagemDeAlert", "alert('" + mensagem + "');", true);
                TextBoxNumero.Text = "";
            }
            else if (opcao == 3 && filial != 0 && numped > 99999 && (condVenda == 8 || condVenda == 1))
            {
                nn.EnviaPedidoParaPainel(opcao, numped, filial);
                String mensagem = "Pedido " + numped + " enviado pra o painel!";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "MensagemDeAlert", "alert('" + mensagem + "');", true);
                TextBoxNumero.Text = "";
            }
            else
            {
                String mensagem = "Não foi possível enviar o pedido favor verificar as informações ou Verifique com a TI!";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "MensagemDeAlert", "alert('" + mensagem + "');", true);
            }

        }

        protected void btExcluir_Click(object sender, EventArgs e)
        {
            int opcao = Convert.ToInt32(DropDownList1.SelectedItem.Value);
            int filial = Convert.ToInt32(DropDownList2.SelectedItem.Value);
            long numped = string.IsNullOrEmpty(TextBoxNumero.Text) ? 0 : Convert.ToInt64(TextBoxNumero.Text);
            ServiceReference3.WebService1SoapClient nn = new ServiceReference3.WebService1SoapClient();
            if (opcao == 2 && filial != 0 && numped < 999998)
            {
                nn.ExcluirPedidoDoPainel(opcao, numped, filial);
                String mensagem = "Pedido da NFC-e de N. " + numped + " excluido do painel!";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "MensagemDeAlert", "alert('" + mensagem + "');", true);
                TextBoxNumero.Text = "";
            }
            else if (opcao == 3 && filial != 0 && numped > 99999)
            {
                nn.ExcluirPedidoDoPainel(opcao, numped, filial);
                String mensagem = "Pedido " + numped + " excluido do painel!";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "MensagemDeAlert", "alert('" + mensagem + "');", true);
                TextBoxNumero.Text = "";
            }
            else
            {
                String mensagem = "Não foi possível excluido do painel verificar as informações!";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "MensagemDeAlert", "alert('" + mensagem + "');", true);
            }

        }
    }
}