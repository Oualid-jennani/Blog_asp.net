using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blog
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public blogEntities Bg = new blogEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.Params.Get("btn") != "" && Request.Params.Get("btn") != null)
            {
                short a = short.Parse(Request.Params.Get("id"));
                string name = Request.Params.Get("name");
                string email = Request.Params.Get("email");
                string message = Request.Params.Get("message");
                if (Request.Params.Get("name") != "" && Request.Params.Get("email") != "" && Request.Params.Get("message") != "")
                {
                    var t = new Blog.comment
                    {
                        nameCom = name,
                        messageC = message,
                        email = email,
                        posteId = a,
                    };
                    //  bg.AddTocomment(t);
                    Bg.comment.Add(t);
                    Bg.SaveChanges();
                }
                
            }
            

        }
    }
}