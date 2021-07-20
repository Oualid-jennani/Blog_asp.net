using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Entity;

namespace Blog
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public blogEntities Bg = new blogEntities();

        public string namePage;

        protected void Page_Load(object sender, EventArgs e)
        {
            namePage = Path.GetFileNameWithoutExtension(Page.AppRelativeVirtualPath).ToString();
        }
    }
}