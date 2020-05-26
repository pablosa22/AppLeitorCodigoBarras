using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppConferenciaABP
{
    public class Faturamento
    {
        public DateTime Data { get; set; }
        public long Carregamento { get; set; }
        public long Pedido { get; set; }
        public int Codigo { get; set; }
        public string Cliente { get; set; }
        public string CNPJ { get; set; }
        public string IE { get; set; }
        public string UF { get; set; }
        public decimal VlTotal { get; set; }
        public string Conferente { get; set; }
    }
}