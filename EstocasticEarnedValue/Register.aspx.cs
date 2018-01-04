using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EstocasticProjectEstimation.App_Code;

namespace EstocasticProjectEstimation
{
    public partial class Register : BasePage
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
        /// Evento al pulsar el boton de Registrarse
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            string nombre = this.TxtNombre.Text;
            string apellidos = this.TxtApellidos.Text;
            string username = this.TxtUser.Text;
            string password = this.TxtPassword.Text;
     
            if (string.IsNullOrEmpty(nombre) || string.IsNullOrEmpty(apellidos) || string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                this.lblRegisterError.Text = Resources.WebResources.ERROR_FILL_FIELDS;
                this.lblRegisterError.Visible = true;
            }
            else
            {
                if (Service.ExisteUserName(username))
                {
                    this.lblRegisterError.Text = Resources.WebResources.ERROR_USER_ALREADY_EXISTS;
                    this.lblRegisterError.Visible = true;
                }
                else
                { 
                    Service.AltaUsuario(username, password, nombre, apellidos);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + Resources.WebResources.USUARIO_REGISTRADO + "')", true);
                    this.lblRegisterError.Visible = false;
                    //Response.Redirect("~/Login.aspx");
                }


            }


        }
    }
}