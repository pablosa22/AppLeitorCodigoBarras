using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppConferenciaABP
{
    public class Produto
    {
        public int Seq { get; set; }
        public int Codigo { get; set; }
        public string Descricao { get; set; }
        public decimal Qt { get; set; }
        public decimal QtSep { get; set; }
    }
}