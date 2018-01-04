using EstocasticProjectEstimation.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EstocasticProjectEstimation.App_Code
{
    public class BasePage : System.Web.UI.Page
    {
        Service _service = null;

        /// <summary>
        /// Servicio de acceso a datos
        /// </summary>
        protected Service Service
        {
            get
            {
                if (this._service == null)
                    this._service = new Service();

                return this._service;
            }
        }

    }
}