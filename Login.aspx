<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Database_Connectivity.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .login-wrapper {
            width: 100%;
            max-width: 460px;
            margin: 40px auto;
            padding: 10px;
        }

        .login-card {
            background: #ffffff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(183, 110, 121, 0.14), 0 5px 15px rgba(0, 0, 0, 0.04);
            border: 1px solid #F3D9E2;
        }

        .login-title {
            text-align: center;
            margin-bottom: 28px;
            padding-bottom: 18px;
            border-bottom: 1px solid #F8BBD0;
        }

        .login-title h1 {
            margin: 0;
            color: #3E2723;
            font-size: 28px;
            font-family: 'Playfair Display', serif;
            font-weight: 700;
        }

        .login-title p {
            color: #786C68;
            margin-top: 6px;
            font-size: 14px;
        }

        .form-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 16px;
        }

        .form-table td {
            padding: 4px 0;
            vertical-align: middle;
        }

        .form-table td:first-child {
            font-weight: 600;
            color: #3E2723;
            width: 28%;
            font-size: 14px;
        }

        .input-box {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #E8B4B8;
            border-radius: 10px;
            outline: none;
            font-size: 14px;
            background: #FFFDF9;
            color: #2D2424;
            transition: all 0.25s ease;
            box-sizing: border-box;
        }

        .input-box:focus {
            border-color: #E91E63;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(233, 30, 99, 0.12);
        }

        .login-button {
            width: 100%;
            padding: 14px;
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
            margin-top: 8px;
        }

        .login-button:hover {
            opacity: 0.95;
            transform: translateY(-2px);
            box-shadow: 0 12px 25px rgba(233, 30, 99, 0.38);
        }

        .register-link {
            text-align: center;
            margin-top: 25px;
            padding-top: 18px;
            border-top: 1px solid #F7EFE8;
            font-size: 14px;
            color: #786C68;
        }

        .register-link a {
            color: #E91E63;
            text-decoration: none;
            font-weight: 600;
            margin-left: 4px;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 500px) {
            .login-card {
                padding: 25px 20px;
            }

            .form-table td {
                display: block;
                width: 100% !important;
            }

            .form-table td:first-child {
                padding-bottom: 4px;
            }

            .form-table td:last-child {
                padding-top: 0;
                margin-bottom: 12px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header Banner -->
    <div class="py-4 text-center" style="background: radial-gradient(circle, #FFF0F5 0%, #FCE4EC 100%); border-bottom: 1px solid #F8BBD0;">
        <div class="container">
            <span class="sd-section-subtitle" style="font-size:1.8rem;">Member & Admin Portal</span>
            <h1 class="font-serif text-dark mb-0">Sign In to SweetDelights</h1>
        </div>
    </div>

    <div class="container py-5">
        <div class="login-wrapper">
            <div class="login-card">
                <div class="login-title">
                    <h1><i class="bi bi-shield-lock text-danger me-2"></i>Welcome Back</h1>
                    <p>Enter your credentials to continue</p>
                </div>

                <table class="form-table">
                    <tr>
                        <td><i class="bi bi-envelope text-danger me-1"></i> Email</td>
                        <td>
                            <asp:TextBox
                                ID="txtemail"
                                runat="server"
                                TextMode="Email"
                                CssClass="input-box"
                                placeholder="name@sweetdelights.com">
                            </asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td><i class="bi bi-lock text-danger me-1"></i> Password</td>
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
                        <td colspan="2">
                            <asp:Button
                                ID="login_btn"
                                runat="server"
                                Text="Login Here"
                                CssClass="login-button"
                                OnClick="login_btn_Click" />
                        </td>
                    </tr>
                </table>

                <div class="register-link">
                    <asp:HyperLink
                        ID="hlRegister"
                        runat="server"
                        NavigateUrl="~/Insert.aspx">
                        New user? Register here
                    </asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
