using EstocasticProjectEstimation.App_Code;
using EstocasticProjectEstimation.DataAccess.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EstocasticProjectEstimation
{
    public partial class Login : BasePage
    {
       /// <summary>
       /// Evento Page Load
       /// </summary>
       /// <param name="sender"></param>
       /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Evento al pulsar el boton de Login
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            if (Service.CheckUserPassWord(this.TxtUser.Text, this.TxtPassword.Text))
            {
                UsuarioDTO user = Service.GetUsuarioByUserName(this.TxtUser.Text);
                Service.InitializeUser(user.Id_Usuario, user.Nombre, user.Apellidos);
                Response.Redirect("~/Menu.aspx");

            }
            else
            {
                this.lblLoginError.Visible = true;
            }
        }
    }
}