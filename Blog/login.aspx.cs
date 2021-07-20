using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Blog
{
    public partial class login : System.Web.UI.Page
    {
        static Blog.bloguser user;
        public blogEntities Bg = new blogEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.Params.Get("user") != "" && Request.Params.Get("user") != null && Request.Params.Get("pasw") != "" && Request.Params.Get("pasw") != null)
            {
                Session["user"] = null;
                foreach (var u in Bg.bloguser.ToList())
                {
                    if (u.username == Request.Params.Get("user").ToString())
                    {
                        user = u;
                    }
                }

                //List<bloguser> list = Bg.bloguser.ToList();
                //for (int i = 0; i < list.Count; i++)
                //{
                //    bloguser u = list[i];
                //    if (u.username == Request.Params.Get("user").ToString())
                //    {
                //        user = u;
                //    }
                //}

                if (user.pswrd == FormsAuthentication.HashPasswordForStoringInConfigFile(Request.Params.Get("pasw").ToString(), "SHA1"))
                {
                    Session["user"] = Request.Params.Get("user");
                    Response.Redirect(Bg.menuLink.First().nameM + ".aspx");
                }
            }
        }
    }
}