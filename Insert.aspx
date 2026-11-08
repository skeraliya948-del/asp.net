<%@ Page Title="User Registration & Staff Management" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Insert.aspx.cs" Inherits="Database_Connectivity.insert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
    <style type="text/css">
        .page-container {
            width: 100%;
            max-width: 1100px;
            margin: 10px auto 40px auto;
        }

        .registration-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 35px;
            box-shadow: 0 15px 40px rgba(183, 110, 121, 0.12), 0 5px 15px rgba(0, 0, 0, 0.04);
            border: 1px solid #F3D9E2;
        }

        .title {
            text-align: center;
            font-size: 26px;
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            color: #3E2723;
            padding: 10px 0 20px 0;
            border-bottom: 1px solid #F8BBD0;
            margin-bottom: 20px;
        }

        .title br {
            display: none;
        }

        .form-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 14px;
        }

        .form-table td {
            padding: 4px 6px;
            vertical-align: middle;
        }

        .form-table td:first-child {
            width: 180px;
            font-weight: 600;
            color: #3E2723;
            font-size: 14px;
        }

        .input-box,
        .select-box {
            width: 100%;
            padding: 11px 14px;
            border: 1px solid #E8B4B8;
            border-radius: 10px;
            font-size: 14px;
            background: #FFFDF9;
            color: #2D2424;
            outline: none;
            transition: all 0.25s ease;
            box-sizing: border-box;
        }

        .input-box:focus,
        .select-box:focus {
            border-color: #E91E63;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(233, 30, 99, 0.12);
        }

        .save-button {
            padding: 12px 40px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, #E91E63, #C2185B);
            color: #ffffff;
            font-size: 15px;
            font-weight: 600;
            letter-spacing: 0.5px;
            cursor: pointer;
            box-shadow: 0 8px 20px rgba(233, 30, 99, 0.28);
            transition: all 0.3s ease;
        }

        .save-button:hover {
            opacity: 0.95;
            transform: translateY(-2px);
            box-shadow: 0 12px 25px rgba(233, 30, 99, 0.38);
        }

        .login-panel {
            text-align: center;
            padding: 18px;
            color: #786C68;
            font-size: 14px;
            background: #FFFDF9;
            border-radius: 10px;
            border: 1px solid #F3D9E2;
            margin-top: 15px;
        }

        .login-panel a {
            color: #E91E63;
            font-weight: 600;
            text-decoration: none;
            margin-left: 5px;
        }

        .login-panel a:hover {
            text-decoration: underline;
        }

        .admin-section {
            margin-top: 40px;
            padding-top: 30px;
            border-top: 2px dashed #F8BBD0;
            overflow-x: auto;
        }

        .admin-title {
            font-size: 22px;
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            color: #3E2723;
            margin-bottom: 18px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .admin-grid-wrap {
            border-radius: 14px;
            border: 1px solid #F3D9E2;
            overflow: hidden;
            background: #ffffff;
        }

        .admin-grid {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .admin-grid th {
            background: linear-gradient(135deg, #FFF0F5, #FCE4EC);
            color: #3E2723;
            padding: 14px 12px;
            font-weight: 700;
            white-space: nowrap;
            text-align: center;
            border-bottom: 2px solid #F8BBD0;
        }

        .admin-grid td {
            padding: 12px 10px;
            border-bottom: 1px solid #F7EFE8;
            text-align: center;
            vertical-align: middle;
            color: #2D2424;
        }

        .admin-grid tr:nth-child(even) {
            background: #FFFDF9;
        }

        .admin-grid tr:hover {
            background: #FDE8EF;
            transition: background 0.2s ease;
        }

        .admin-grid img {
            object-fit: cover;
            border-radius: 8px;
            border: 1px solid #E8B4B8;
            box-shadow: 0 2px 6px rgba(183, 110, 121, 0.15);
        }

        .admin-grid a {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        /* Edit Button in Grid */
        .admin-grid a[id*="LinkButton1"] {
            background: linear-gradient(135deg, #B76E79, #8D6E63);
            color: #ffffff !important;
        }

        .admin-grid a[id*="LinkButton1"]:hover {
            opacity: 0.9;
            transform: translateY(-1px);
        }

        /* Delete Button in Grid */
        .admin-grid a[id*="LinkButton2"] {
            background: linear-gradient(135deg, #E53935, #C62828);
            color: #ffffff !important;
        }

        .admin-grid a[id*="LinkButton2"]:hover {
            opacity: 0.9;
            transform: translateY(-1px);
        }

        /* RadioButtonList styling */
        .radio-gender label {
            margin-right: 18px;
            margin-left: 6px;
            font-weight: 500;
            color: #3E2723;
            cursor: pointer;
        }

        @media (max-width: 700px) {
            .registration-card {
                padding: 20px 15px;
            }

            .form-table,
            .form-table tbody,
            .form-table tr,
            .form-table td {
                display: block;
                width: 100% !important;
            }

            .form-table td:first-child {
                padding-bottom: 4px;
            }

            .form-table td:last-child {
                padding-top: 0;
                margin-bottom: 10px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
    <!-- Breadcrumb Navigation -->
    <div class="d-flex flex-wrap justify-content-between align-items-center mb-4">
        <div>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb sd-breadcrumb mb-1">
                    <li class="breadcrumb-item"><a href="Admin_Dashboard.aspx">Dashboard</a></li>
                    <li class="breadcrumb-item active text-danger" aria-current="page">Staff & User Management</li>
                </ol>
            </nav>
            <h2 class="font-serif text-dark mb-0">Staff & Employee Records</h2>
        </div>
    </div>

    <div class="page-container">
        <div class="registration-card">
            <table class="form-table">
                <tr>
                    <td colspan="2" class="title">
                        <i class="bi bi-person-badge text-danger me-2"></i>User / Staff Registration
                        <br />
                        <asp:Label
                            ID="lblResult"
                            runat="server"
                            CssClass="badge bg-danger text-white mt-2 fs-6 px-3 py-1"
                            Visible="false">
                        </asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label
                            ID="Label2"
                            runat="server"
                            Text="Username">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox
                            ID="txtusername"
                            runat="server"
                            CssClass="input-box"
                            placeholder="Enter username">
                        </asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label
                            ID="Label3"
                            runat="server"
                            Text="Gender">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList
                            ID="rdogen"
                            runat="server"
                            RepeatDirection="Horizontal"
                            CssClass="radio-gender">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label
                            ID="Label4"
                            runat="server"
                            Text="Email">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox
                            ID="txtemail"
                            runat="server"
                            TextMode="Email"
                            CssClass="input-box"
                            placeholder="e.g. employee@sweetdelights.com">
                        </asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label
                            ID="Label9pwd"
                            runat="server"
                            Text="Password">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox
                            ID="txtpassword"
                            runat="server"
                            TextMode="Password"
                            CssClass="input-box"
                            placeholder="••••••••">
                        </asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label
                            ID="Label5"
                            runat="server"
                            Text="City">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList
                            ID="drpcity"
                            runat="server"
                            CssClass="select-box">
                            <asp:ListItem>---Select City---</asp:ListItem>
                            <asp:ListItem>Rajkot</asp:ListItem>
                            <asp:ListItem>Bhuj</asp:ListItem>
                            <asp:ListItem>Botad</asp:ListItem>
                            <asp:ListItem>Ahmedabad</asp:ListItem>
                            <asp:ListItem>Surat</asp:ListItem>
                            <asp:ListItem>Vadodara</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label
                            ID="Label6"
                            runat="server"
                            Text="Address">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox
                            ID="txtaddress"
                            runat="server"
                            TextMode="MultiLine"
                            Rows="3"
                            CssClass="input-box"
                            placeholder="Enter physical address">
                        </asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label
                            ID="Label7"
                            runat="server"
                            Text="Mobile">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox
                            ID="txtmbl"
                            runat="server"
                            CssClass="input-box"
                            placeholder="Enter contact number">
                        </asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label
                            ID="Label8"
                            runat="server"
                            Text="Image">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload
                            ID="imgupload"
                            runat="server"
                            CssClass="input-box" />
                    </td>
                </tr>

                <tr>
                    <td colspan="2" style="text-align:center; padding-top: 15px;">
                        <asp:Button
                            ID="Save_btn"
                            runat="server"
                            Text="Save"
                            Width="140px"
                            CssClass="save-button"
                            OnClick="Save_btn_Click" />
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <asp:Panel
                            ID="pnlLoginLink"
                            runat="server"
                            CssClass="login-panel">
                            Already have an account?
                            <asp:HyperLink
                                ID="hlLogin"
                                runat="server"
                                NavigateUrl="~/Login.aspx">
                                Login here
                            </asp:HyperLink>
                        </asp:Panel>
                    </td>
                </tr>
            </table>

            <!-- Admin Grid Section (Visible when Admin Session is active) -->
            <asp:Panel
                ID="pnlAdminGrid"
                runat="server"
                CssClass="admin-section">
                <div class="admin-title">
                    <i class="bi bi-people-fill text-danger me-1"></i>
                    <asp:Label
                        ID="lblWelcome"
                        runat="server"
                        Text="">
                    </asp:Label>
                </div>

                <div class="admin-grid-wrap">
                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="admin-grid"
                        GridLines="None"
                        OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label
                                        ID="Label9"
                                        runat="server"
                                        Text='<%# Eval("Id") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label
                                        ID="Label10"
                                        runat="server"
                                        CssClass="fw-bold text-dark"
                                        Text='<%# Eval("Name") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Gender">
                                <ItemTemplate>
                                    <asp:Label
                                        ID="Label11"
                                        runat="server"
                                        Text='<%# Eval("Gender") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label
                                        ID="Label12"
                                        runat="server"
                                        Text='<%# Eval("Email") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="City">
                                <ItemTemplate>
                                    <span class="badge bg-light text-dark border px-2 py-1">
                                        <asp:Label
                                            ID="Label13"
                                            runat="server"
                                            Text='<%# Eval("City") %>'>
                                        </asp:Label>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label
                                        ID="Label14"
                                        runat="server"
                                        Text='<%# Eval("Address") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Mobile">
                                <ItemTemplate>
                                    <asp:Label
                                        ID="Label15"
                                        runat="server"
                                        Text='<%# Eval("Mobile") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Photo">
                                <ItemTemplate>
                                    <asp:Image
                                        ID="Image1"
                                        runat="server"
                                        Height="48"
                                        Width="48"
                                        ImageUrl='<%# Eval("Image") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton
                                        ID="LinkButton1"
                                        runat="server"
                                        CommandArgument='<%# Eval("Id") %>'
                                        CommandName="cmd_edt">
                                        <i class="bi bi-pencil-square"></i> Edit
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton
                                        ID="LinkButton2"
                                        runat="server"
                                        CommandArgument='<%# Eval("Id") %>'
                                        CommandName="cmd_dlt"
                                        OnClientClick="return confirm('Are you sure you want to delete this staff record?');">
                                        <i class="bi bi-trash3"></i> Delete
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
