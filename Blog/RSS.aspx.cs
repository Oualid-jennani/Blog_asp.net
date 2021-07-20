using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blog
{
    public partial class RSS : System.Web.UI.Page
    {
        public static blogEntities Bg = new blogEntities();

        public List<poste> post = new List<poste>(Bg.poste.ToList());

        protected void Page_Load(object sender, EventArgs e)
        {
            RepeaterRSS.DataSource = Bg.poste.ToList();
        }
    }
}