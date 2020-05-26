using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppConferenciaABP
{
    public partial class AppConferencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int matricula = Convert.ToInt32(Request.QueryString["mat"]);
            string nome = Request.QueryString["name"].ToString();
            LbNome.Text = nome;
            LbMatricula.Text = Convert.ToString(matricula);
            DesabilitarDigitação();
            btFinalizarConf.Visible = false;
        }

        protected void btPesquisar_Click(object sender, EventArgs e)
        {            
            int codConferente = Convert.ToInt32(Request.QueryString["mat"]);
            long numped = string.IsNullOrEmpty(TextBoxPedido.Text) ? 0 : Convert.ToInt64(TextBoxPedido.Text);               
            ServiceReference3.WebService1SoapClient nn = new ServiceReference3.WebService1SoapClient();
            int matricula = nn.IniciaConferencia(numped).Maticula;        
            int qt_Itens_org = nn.ValidaConferenciaCompleta(numped).QT_Itens_Org;
            int qt_Itens_conf = nn.ValidaConferenciaCompleta(numped).QT_Itens_Conf;
     
            int condVenda = Convert.ToInt32(nn.IniciaConferencia(numped).CondVenda);
            int OrdemConf = Convert.ToInt32(nn.IniciaConferencia(numped).OrdemConf);
            int numCupom = Convert.ToInt32(nn.IniciaConferencia(numped).NumCupom);            

            string posicao = nn.IniciaConferencia(numped).Posicao;            

            if ((posicao == "F" && numCupom > 0 && OrdemConf == 2 && condVenda != 7) || (posicao != "F" && numCupom == 0 && OrdemConf == 2 && condVenda != 7))
            {
                if (matricula == 0 && ((qt_Itens_org) > qt_Itens_conf))
                {
                    nn.AtribuirPedidoParaCaonferente(codConferente, numped);
                    HabilitarBotaoPesquisar(numped);                
                }
                else if (matricula == codConferente && ((qt_Itens_org) > qt_Itens_conf))
                {
                    HabilitarBotaoPesquisar(numped);
                }
                else if (numped == 0 )
                {
                    String mensagem1 = "Pedido já finalizado ou invalido :" + numped;
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "MensagemDeAlert", "alert('" + mensagem1 + "');", true);
                }            
                else
                {
                    String mensagem = "Conferência Já Iniciada ou Finalizada: " + matricula;
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "MensagemDeAlert", "alert('" + mensagem + "');", true);
                }
            }
            else 
            {
                String mensagem3 = "Pedido já faturado ou não liberado pra conferência!";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "MensagemDeAlert", "alert('" + mensagem3 + "');", true);
            }
        }

        protected void HabilitarBotaoPesquisar(long numped)
        {
            ServiceReference3.WebService1SoapClient nn = new ServiceReference3.WebService1SoapClient();
            this.GridView1.DataSource = nn.ListaItensParaConferencia(numped);
            this.GridView1.DataBind();
            this.GridView2.DataSource = nn.ListaItensFinalizados(numped);
            this.GridView2.DataBind();
            this.GridView3.DataSource = nn.ListaDetalhesDoPedido(numped);
            this.GridView3.DataBind();
            HabilitarDigitação();
        }

        protected void DesabilitarDigitação()
        {
            TextBoxCodigo.Visible = false;            
            TextBoxDescricao.Visible = false;
            TextBoxQtPedida.Visible = false;
            TextBoxConferida.Visible = false;
            btConfirmar.Visible = false;
            btProduto.Visible = false;
            Image1.Visible = false;
            lbCodigo.Visible = false;
            lbDescricao.Visible = false;
            lbQtPedida.Visible = false;
            lbQtConf.Visible = false;            
        }

        protected void HabilitarDigitação()
        {
            TextBoxCodigo.Visible = true;            
            TextBoxDescricao.Visible = true;
            TextBoxQtPedida.Visible = true;
            TextBoxConferida.Visible = true;
            btConfirmar.Visible = true;
            btProduto.Visible = true;
            Image1.Visible = true;
            lbCodigo.Visible = true;
            lbDescricao.Visible = true;
            lbQtPedida.Visible = true;
            lbQtConf.Visible = true;
            TextBoxPedido.Enabled = false;
            btPesquisar.Visible = false;
        }

        protected void btProduto_Click(object sender, EventArgs e)
        {
            HabilitarDigitação();
            long pedido = string.IsNullOrEmpty(TextBoxPedido.Text) ? 0 : Convert.ToInt64(TextBoxPedido.Text);
            int codigo = string.IsNullOrEmpty(TextBoxCodigo.Text) ? 0 : Convert.ToInt32(TextBoxCodigo.Text);  
            ServiceReference3.WebService1SoapClient nn = new ServiceReference3.WebService1SoapClient();
            string descricao = nn.SepararProduto(pedido, codigo).Descricao;
            decimal qtPedida = nn.SepararProduto(pedido, codigo).Qt;             
            if (descricao == null || qtPedida == 0)
            {
                String mensagem = "Produto não consta na lista pra conferir: " + codigo;
                ClientScript.RegisterClientScriptBlock(this.GetType(), "MensagemDeAlert", "alert('" + mensagem + "');", true);
                TextBoxDescricao.Text = "";
                TextBoxQtPedida.Text = "";
            }        
            if (descricao != null && qtPedida != 0)
            {
                TextBoxDescricao.Text = descricao;
                TextBoxQtPedida.Text = Convert.ToString(qtPedida);
            }
        }

        protected void btConfirmar_Click(object sender, EventArgs e)
        {
            int codigo = string.IsNullOrEmpty(TextBoxCodigo.Text) ? 0 : Convert.ToInt32(TextBoxCodigo.Text);
            long numped = string.IsNullOrEmpty(TextBoxPedido.Text) ? 0 : Convert.ToInt64(TextBoxPedido.Text);
            int matricula = Convert.ToInt32(Request.QueryString["mat"]);
            decimal qt_separada = string.IsNullOrEmpty(TextBoxConferida.Text) ? 0 : Convert.ToDecimal(TextBoxConferida.Text);
            ServiceReference3.WebService1SoapClient nn = new ServiceReference3.WebService1SoapClient();

            decimal quantidadeSep = (qt_separada +  nn.SepararProduto(numped, codigo).QtSep);
            decimal qtOrigem = Convert.ToDecimal(nn.SepararProduto(numped, codigo).Qt);
            int numSeq = Convert.ToInt32(nn.SepararProduto(numped, codigo).Seq);

            if (matricula != 0 && numped != 0 && codigo != 0 && qt_separada != 0 && (quantidadeSep <= qtOrigem))
            {                
                nn.ConfirmaConferencia(qt_separada, matricula, numped, codigo, numSeq);
                nn.FinalizaConferenciaItem(numped, codigo, numSeq);
                HabilitarDigitação();
                this.AtualizarGrid();
                int qt_Itens_org = nn.ValidaConferenciaCompleta(numped).QT_Itens_Org;
                int qt_Itens_conf = nn.ValidaConferenciaCompleta(numped).QT_Itens_Conf;                          
                int qtlinhas = TotalDeLinhasConferencia(numped);

                if (qtlinhas == 0)
                {
                     InformaDataFimConferencia(qt_Itens_org, qt_Itens_conf);
                }                
            }
            else
            {
                String mensagem = "Verifique a quantidade conferida: " + qt_separada;
                ClientScript.RegisterClientScriptBlock(this.GetType(), "MensagemDeAlert", "alert('" + mensagem + "');", true);
                HabilitarDigitação();
            }
        }

        protected void InformaDataFimConferencia(int separacao, int conferencia)
        {
            if (separacao == conferencia )
            {
                btFinalizarConf.Visible = true;                
            }
        }


        protected void AtualizarGrid()
        {
            long numped = string.IsNullOrEmpty(TextBoxPedido.Text) ? 0 : Convert.ToInt64(TextBoxPedido.Text);
            ServiceReference3.WebService1SoapClient nn = new ServiceReference3.WebService1SoapClient();            
            GridView1.DataSource = nn.ListaItensParaConferencia(numped);
            GridView1.DataBind();
            GridView2.DataSource = nn.ListaItensFinalizados(numped);
            GridView2.DataBind();
            LimparCampos();
        }
              
        protected void LimparCampos()
        {
            TextBoxDescricao.Text = "";
            TextBoxQtPedida.Text = "";
            TextBoxConferida.Text = "";
            //   TextBoxCodigo.Text = "";
            TextBoxCodigo.Text = "";
        }

        protected void btFinalizarConf_Click(object sender, EventArgs e)
        {
            ServiceReference3.WebService1SoapClient nn = new ServiceReference3.WebService1SoapClient();
            int matricula = Convert.ToInt32(Request.QueryString["mat"]);
            long numped = string.IsNullOrEmpty(TextBoxPedido.Text) ? 0 : Convert.ToInt64(TextBoxPedido.Text);
            nn.FinalizaConferencia(numped, matricula);
            LimparCampos();
            DesabilitarDigitação();
            TextBoxPedido.Visible = true;
            TextBoxPedido.Enabled = true;
            TextBoxPedido.Text = "";
            btPesquisar.Visible = true;
        }

        protected int TotalDeLinhasConferencia(long numped)
        {
            int TotLinhas = 0;
            OracleConnection cnn = new OracleConnection("DATA SOURCE=192.168.251.3:1521/WINT;PERSIST SECURITY INFO=True;USER ID=ACOBRAZIL; Password=SGAGRANADO");            
            try
            {
                cnn.Open();
                OracleCommand cmd = new OracleCommand("SELECT I.* FROM PCPEDI I, PCPRODUT P, PCEMBALAGEM E WHERE I.CODPROD = P.CODPROD AND E.CODPROD = P.CODPROD AND I.CODFILIALRETIRA = 2 " +
                    "  AND E.CODFILIAL = 2 AND(I.QT / E.QTUNIT) <> NVL(I.QTSEPARADA, 0) AND I.NUMPED =: numped ORDER BY 2 ASC", cnn);                
                cmd.Parameters.Add(new OracleParameter("NUMPED", numped));
                OracleDataReader rdr = cmd.ExecuteReader();

                Produto produto = null;
                while (rdr.Read())
                {
                    produto = new Produto();
                    TotLinhas ++;                                       
                }
                rdr.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                cnn.Close();
            }
            return TotLinhas;
        }
    }
}