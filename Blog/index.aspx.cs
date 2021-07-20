using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blog
{
    public partial class index : System.Web.UI.Page
    {
        public blogEntities Bg = new blogEntities();
        public string Cat;
        public string search;

        public List<poste> CTG = new List<poste>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }

            Cat = Request.Params.Get("catecory");
            search = Request.Params.Get("qsearch");

            if (Cat != null)
            {
                var Post = from C in Bg.poste where C.category.names == Cat select C;
                CTG.AddRange(Post);
            }
            else if (search != null && search != null)
            {
                var Post = from C in Bg.poste where C.title.Contains(search) || C.content.Contains(search)  select C;

                //var poste = Bg.poste.Where( x => x.title.Contains(search) || x.content.Contains(search));
                CTG.AddRange(Post);
            }
            else
            {
                //var Post = from C in Bg.poste select C;
                CTG.AddRange(Bg.poste.ToList());
            }
        }

    }
}