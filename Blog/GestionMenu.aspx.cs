using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blog
{
    public partial class GestionMenu : System.Web.UI.Page
    {
        public blogEntities Bg = new blogEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            menuLink link = new menuLink();
            link.nameM = TextBox1.Text;
            link.linkOrder = byte.Parse(TextBox2.Text);

            Bg.menuLink.Add(link);
            Bg.SaveChanges();
        }
    }
}