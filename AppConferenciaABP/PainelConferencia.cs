using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppConferenciaABP
{
    public class PainelConferencia
    {    
        public long Pedido { get; set; }
        public int Nota { get; set; }
        public int Codigo { get; set; }
        public string Cliente { get; set; }
        public string UF { get; set; }
        public string Obs { get; set; }
        public string Obs1 { get; set; }
        public string Obs2 { get; set; }
        public string Conferente { get; set; }
        public string Conferido { get; set; }
    }
}