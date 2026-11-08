using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SweetDelights
{
    public partial class Contact : Page
    {
        protected Label lblSuccessMessage;
        protected TextBox txtFullName;
        protected TextBox txtEmail;
        protected TextBox txtPhone;
        protected DropDownList ddlSubject;
        protected TextBox txtEventDate;
        protected TextBox txtMessage;
        protected Button btnSubmitContact;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmitContact_Click(object sender, EventArgs e)
        {
            lblSuccessMessage.Visible = true;
            txtFullName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtMessage.Text = string.Empty;
        }
    }
}
