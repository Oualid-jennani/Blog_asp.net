using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Blog
{
    public partial class GestionPost : System.Web.UI.Page
    {
        blogEntities bg = new blogEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillData();

                var q = from c in bg.category select new { Names = c.names, idC = c.IdC };

                DropDownList1.DataSource = q.ToList();
                DropDownList1.DataTextField = "Names";
                DropDownList1.DataValueField = "idC";
                DropDownList1.DataBind();
            }
        }


        private void FillData()
        {
            GridView1.DataSource = bg.poste.Select(acc => new
            {
                idP = acc.idp,
                Title = acc.title,
                Content = acc.content,
                Image = acc.image,
                dateP = acc.datePublication,
                categryId = acc.category.names,
                userId = acc.bloguser.username,
                ViewCount = acc.viewCount
            }).ToList();
            GridView1.DataBind();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            HiddenField hd = (HiddenField)lb.FindControl("HiddenField1");
            poste p = bg.poste.Single(ps => ps.title.Equals(hd.Value));

            bg.poste.Remove(p);
            bg.SaveChanges();
            FillData();


        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {



            using (blogEntities context = new blogEntities())
            {
                LinkButton lb = (LinkButton)sender;
                HiddenField hd = (HiddenField)lb.FindControl("HiddenField1");
                int postId = short.Parse(hd.Value);

                var obj = context.poste.Where(ps => ps.idp == postId).First();

                obj.title = TextBox1.Text;
                obj.content = TextArea1.Text;
                obj.image = TextBox2.Text;

                obj.categoryId = short.Parse(DropDownList1.SelectedValue);
                context.SaveChanges();


                FillData();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            using (blogEntities entity = new blogEntities())
            {

                string user = Session["user"].ToString();
                var i = from c in entity.bloguser where c.username == user select c.IdB;

                var obj = new Blog.poste
                {
                    title = TextBox1.Text,
                    content = TextArea1.Text,
                    image = TextBox2.Text,
                    datePublication = DateTime.Now,
                    userId = short.Parse(user),
                    viewCount = 0,
                    categoryId = short.Parse(DropDownList1.SelectedValue)
                };
                entity.poste.Add(obj);
                entity.SaveChanges();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Record added successfully!');", true);

            }
        }
    }
}