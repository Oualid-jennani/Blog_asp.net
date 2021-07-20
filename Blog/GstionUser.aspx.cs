using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Blog
{
    public partial class GstionUser : System.Web.UI.Page
    {
        public blogEntities bg = new blogEntities();
        public List<bloguser> users = new List<bloguser>();
        protected void Page_Load(object sender, EventArgs e)
        {
            users.AddRange(bg.bloguser.ToList());
        }


        protected void Ajouter_Click(object sender, EventArgs e)
        {
            bloguser user = new bloguser();
            user.username = UserName.Value.ToString();
            user.pswrd = FormsAuthentication.HashPasswordForStoringInConfigFile(Password.Value.ToString(), "SHA1");

            bg.bloguser.Add(user);
            bg.SaveChanges();
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            bloguser user = bg.bloguser.Find(int.Parse( NumClient.Value.ToString()));

            bg.bloguser.Remove(user);
            bg.SaveChanges();

        }

        protected void Update_Click(object sender, EventArgs e)
        {
            bloguser user = bg.bloguser.Find(int.Parse(NumClient.Value.ToString()));
            user.username = UserName.Value.ToString();
            user.pswrd = FormsAuthentication.HashPasswordForStoringInConfigFile(Password.Value.ToString(), "SHA1");

            bg.SaveChanges();
        }

    }
}