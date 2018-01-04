using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using EstocasticProjectEstimation;
using System.Threading;
using System.Globalization;

namespace EstocasticProjectEstimation
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Código que se ejecuta al iniciarse la aplicación
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterOpenAuth();
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Código que se ejecuta al cerrarse la aplicación

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Código que se ejecuta cuando se produce un error sin procesar

        }


        /// <summary>
        /// Begin requests.
        /// Set default language. Cookies are used here because session objects are not accessible in the context when BeginRequest executes.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void Application_BeginRequest(object sender, EventArgs e)
        {
            //Si viene el idioma por la query string.. cambiamos de idioma
            if (Request.QueryString["idioma"] != null)
            {
                if (Request.QueryString["idioma"] == "ES")
                {
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo("es-ES");
                    Thread.CurrentThread.CurrentCulture = new CultureInfo("es-ES");
                }
                else if (Request.QueryString["idioma"] == "IN")
                {
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-GB");
                    Thread.CurrentThread.CurrentCulture = new CultureInfo("en-GB");
                }
            }
            else
            {
                HttpCookie cookie = Request.Cookies["CultureInfo"];

                if (cookie != null && cookie.Value != null)
                {
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(cookie.Value);
                    Thread.CurrentThread.CurrentCulture = new CultureInfo(cookie.Value);
                }
                else
                {
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-GB");
                    Thread.CurrentThread.CurrentCulture = new CultureInfo("en-GB");
                }
            }
        }
    }
}
