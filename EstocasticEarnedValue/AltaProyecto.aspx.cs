using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EstocasticProjectEstimation.App_Code;
using EstocasticProjectEstimation.DataAccess.DTO;

namespace EstocasticProjectEstimation
{
    public partial class AltaProyecto : BasePage
    {
        /// <summary>
        /// Lista de actividades del proyecto
        /// </summary>
        private List<ActividadesProyectoDTO> _listaActividades
        {
            get
            {
                return (List<ActividadesProyectoDTO>)ViewState["ListaActividades"];
            }
            set
            {
                ViewState["ListaActividades"] = value;
            }
        }

        List<RelacionesActividadesDTO> _relacionesActividades
        {
            get
            {
                return (List<RelacionesActividadesDTO>)ViewState["relacionesActividades"];
            }
            set
            {
                ViewState["relacionesActividades"] = value;
            }
        }
      

        /// <summary>
        /// Evento Page Load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        #region paso 1
        /// <summary>
        /// Evento al pulsar el boton de continuar en el paso 1
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNextPasoUno_Click(object sender, EventArgs e)
        {
            if (CheckPaso1())
                CrearPaso2();
            else
                this.lblErrorPasoUno.Visible = true;
        }

        /// <summary>
        /// Comprueba los campos requeridos en el paso 1
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private bool CheckPaso1()
        {
            return !string.IsNullOrEmpty(this.TxtNombreProyecto.Text) && !string.IsNullOrEmpty(this.TxtNumAct.Text);
        }

        /// <summary>
        /// Deshabilita los campos del paso 1
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void DisablePaso1()
        {
            this.tablePasoUno.Disabled = true;
            this.TxtNombreProyecto.Enabled = false;
            this.TxtNumAct.Enabled = false;
        }


        #endregion

        #region paso 2

        /// <summary>
        /// Crea el Paso 2
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void CrearPaso2()
        {
            List<ActividadesProyectoDTO> ListaActividades = new List<ActividadesProyectoDTO>();

            for (int i = 1; i <= Convert.ToInt32(this.TxtNumAct.Text); i++)
            {
                ActividadesProyectoDTO actividad = new ActividadesProyectoDTO();
                actividad.Descripcion = string.Empty;
                actividad.NombreActividad = string.Empty;
                actividad.Num_Actividad = i;
                ListaActividades.Add(actividad);
            }

            this._listaActividades = ListaActividades;
            this.GV_ACTIVIDADES.DataSource = ListaActividades;
            this.GV_ACTIVIDADES.DataBind();

            this.lblErrorPasoUno.Visible = false;
            DisablePaso1();
            this.btnNextPasoUno.Visible = false;
            this.fldSetPaso2.Visible = true;
        }

        /// <summary>
        /// Evento al pulsar el boton de continuar en el paso 2
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNextPasoDos_Click(object sender, EventArgs e)
        {
            if (CheckPaso2())
                CrearPaso3();
            else
                this.lblErrorPasoDos.Visible = true;
        }
       
        /// <summary>
        /// Comprueba los campos requeridos en el paso 2
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private bool CheckPaso2()
        {
            bool check = true;

            foreach (GridViewRow row in this.GV_ACTIVIDADES.Rows)
            {
                if (((TextBox)row.FindControl("TxtNombreActividad")).Text == string.Empty)
                    check = false;
            }

            return check;
        }


        /// <summary>
        /// Deshabilita los campos del paso 2
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void DisablePaso2()
        {
            this.tablePasoDos.Disabled = true;

            foreach (GridViewRow row in this.GV_ACTIVIDADES.Rows)
            {
                ((TextBox)row.FindControl("TxtNombreActividad")).Enabled = false;
                ((TextBox)row.FindControl("TxtDescripcionActividad")).Enabled = false;                  
            }

        }


        #endregion

        #region paso 3

        /// <summary>
        /// Crea el Paso 3
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void CrearPaso3()
        {
            this.GV_RELACIONES_ACTIVIDADES.DataSource = _listaActividades;
            this.GV_RELACIONES_ACTIVIDADES.DataBind();

            this.lblErrorPasoDos.Visible = false;
            DisablePaso2();
            this.btnNextPasoDos.Visible = false;
            this.fldSetPaso3.Visible = true;
        }

       
        /// <summary>
        /// Evento al pulsar el boton de continuar en el paso 2
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNextPasoTres_Click(object sender, EventArgs e)
        {
            if (CheckPaso3())
                CrearPaso4();
            else
                this.lblErrorPasoTres.Visible = true;
        }


        /// <summary>
        /// Evento Row DataBound del grid de relaciones entre actividades
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GV_RELACIONES_ACTIVIDADES_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int numActividad = Convert.ToInt32(e.Row.Cells[0].Text);
                CheckBoxList checkBoxList = (CheckBoxList)e.Row.FindControl("chkBoxList");
                checkBoxList.DataSource = _listaActividades.Where(f => f.Num_Actividad != numActividad);
                checkBoxList.DataBind();  
            }
        }

        /// <summary>
        /// Comprueba los campos requeridos en el paso 3
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private bool CheckPaso3()
        {

            foreach (GridViewRow row in this.GV_RELACIONES_ACTIVIDADES.Rows)
            {           
               CheckBoxList checkBoxList = (CheckBoxList)row.FindControl("chkBoxList");
                if (checkBoxList.Items.Cast<ListItem>().Where(x => x.Selected).Count() == 0)
                    return false;          
            }

            return true;
        }


        /// <summary>
        /// Deshabilita los campos del paso 2
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void DisablePaso3()
        {
            this.tablePasoTres.Disabled = true;

            foreach (GridViewRow row in this.GV_RELACIONES_ACTIVIDADES.Rows)
            {
                ((CheckBoxList)row.FindControl("chkBoxList")).Enabled = false;
            }

        }


        #endregion

        #region paso 4

        /// <summary>
        /// Crea el Paso 4
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void CrearPaso4()
        {
            List<RelacionesActividadesDTO> relacionesActividades = new List<RelacionesActividadesDTO>();

            foreach (GridViewRow row in this.GV_RELACIONES_ACTIVIDADES.Rows)
            {
                int actividaOrigen = Convert.ToInt32(this.GV_RELACIONES_ACTIVIDADES.DataKeys[row.RowIndex].Value);

                CheckBoxList checkBoxList = (CheckBoxList)row.FindControl("chkBoxList");

                List<int> actividadesDestino = new List<int>();
                foreach (ListItem item in checkBoxList.Items)
                {                   
                    if (item.Selected)
                        actividadesDestino.Add(Convert.ToInt32(item.Value));
                }


                RelacionesActividadesDTO relacion = new RelacionesActividadesDTO();
                relacion.NumActividadOrigen = actividaOrigen;
                relacion.ActividadesDestino = actividadesDestino;
                relacionesActividades.Add(relacion);
            }

            this._relacionesActividades = relacionesActividades;
         
            this.lblErrorPasoTres.Visible = false;
            DisablePaso3();
            this.btnNextPasoTres.Visible = false;
            this.fldSetPaso4.Visible = true;

        }

        #endregion

      
    }
}