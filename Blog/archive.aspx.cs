using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace Blog
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        public static  blogEntities Bg = new blogEntities();

        public List<int> anneArch = new List<int>((from p in Bg.poste.ToList() orderby p.datePublication descending select p.datePublication.Value.Year).Distinct());
        public static int indexAnne = 1;
        public string namePage;

        public string anneHTTP;
        protected void Page_Load(object sender, EventArgs e)
        {
            namePage = Path.GetFileNameWithoutExtension(Page.AppRelativeVirtualPath).ToString();

            anneHTTP = Request.Params.Get("anne");
            if (anneHTTP== anneArch[indexAnne].ToString()+"_pres")
            {
                if (indexAnne < anneArch.Count - 1)
                {
                    indexAnne++;
                }
               
                Response.Redirect(namePage.ToString() + ".aspx?anne=" + anneArch[indexAnne]);
            }
            else if(anneHTTP == anneArch[indexAnne].ToString() + "_suiv")
            {
                if (indexAnne > 0)
                {
                    indexAnne--;
                }
                Response.Redirect(namePage.ToString() + ".aspx?anne=" + anneArch[indexAnne]);
            }
        }
    }
}