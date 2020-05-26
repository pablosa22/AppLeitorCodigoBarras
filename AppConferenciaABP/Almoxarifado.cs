using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppConferenciaABP
{
    public class Almoxarifado
    {        
        public long Pedido { get; set; }        
        public string Cliente { get; set; }
        public string Obs { get; set; }
        public int Nota { get; set; }
        public string Conferente { get; set; }     
        public int CodProd { get; set; }
        public string Descricao { get; set; }
        public decimal Qtde { get; set; }
        public string Conferido { get; set; }
    }
}