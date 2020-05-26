using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppConferenciaABP
{
    public partial class PainelAlmoxarifado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ServiceReference3.WebService1SoapClient nn = new ServiceReference3.WebService1SoapClient();
            this.GridView1.DataSource = nn.ListaPedidosdoAlmoxarifado();
            this.GridView1.DataBind();
            LbPedido.Visible = false;
            LbCodigo.Visible = false;
            LbDescicao.Visible = false;
        }

        //selecionar linha na grid
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
            }
        }

        //continuação...selecionar linha na grid
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowIndex == GridView1.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                    String pedido = row.Cells[0].Text;
                    String codigoProduto = row.Cells[5].Text;
                    String Descricao = row.Cells[6].Text;

                    LbPedido.Text = pedido;
                    LbCodigo.Text = codigoProduto;
                    LbDescicao.Text = Descricao;

                    long numped = Convert.ToInt64(pedido);
                    int codprod = Convert.ToInt32(codigoProduto);
                    ConferenciaAlmoxarifado(numped, codprod);
                    ServiceReference3.WebService1SoapClient nn = new ServiceReference3.WebService1SoapClient();
                    this.GridView1.DataSource = nn.ListaPedidosdoAlmoxarifado();
                    this.GridView1.DataBind();
                    LbPedido.Visible = false;
                    LbCodigo.Visible = false;
                    LbDescicao.Visible = false;


                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }            
            }
            LbPedido.Visible = true;
            LbCodigo.Visible = true;
            LbDescicao.Visible = true;
        }

        protected void ConferenciaAlmoxarifado(long numped, int codprod)
        {
            OracleConnection cnn = new OracleConnection("DATA SOURCE=192.168.251.3:1521/WINT;PERSIST SECURITY INFO=True;USER ID=ACOBRAZIL; Password=SGAGRANADO;");
            try
            {
                if (codprod != 0 && numped != 0)
                {
                    cnn.Open();
                    OracleCommand cmd = new OracleCommand("UPDATE PCPEDI SET CODFUNCCONF2 = 1 WHERE NUMPED =:numped AND CODPROD =:codprod", cnn);
                    cmd.Parameters.Add(new OracleParameter("NUMPED", numped));
                    cmd.Parameters.Add(new OracleParameter("CODPROD", codprod));
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                cnn.Close();
            }
        }

    }
}