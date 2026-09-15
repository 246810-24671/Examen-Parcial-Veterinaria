using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VeterinariaPawCare
{
    public partial class Mascotas : System.Web.UI.Page
    {
        string cadena = ConfigurationManager.ConnectionStrings["VeterinariaConex"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                listarMascotas();
            }
        }
        
        private void listarMascotas()
        {
            using (SqlConnection conn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("spListarMascotas", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                conn.Open();
                SqlDataReader read = cmd.ExecuteReader();

                gvMascotas.DataSource = read;
                gvMascotas.DataBind();
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(cadena))
            {
                if (Page.IsValid)
                {
                    SqlCommand cmd = new SqlCommand("spInsertarMascota", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@NombreMascota",txtNombreMascota.Text));
                    cmd.Parameters.Add(new SqlParameter("@NombreDueno",txtNombreDueno.Text));
                    cmd.Parameters.Add(new SqlParameter("@Tipo",ddlTipo.SelectedValue));
                    cmd.Parameters.Add(new SqlParameter("@Edad",Convert.ToInt32(txtEdad.Text)));
                    cmd.Parameters.Add(new SqlParameter("@Telefono",txtTelefono.Text));
                    cmd.Parameters.Add(new SqlParameter("@Observaciones", txtObservaciones.Text));

                    conn.Open();
                    cmd.ExecuteNonQuery();

                    listarMascotas();

                }
            }
        }
    }
}