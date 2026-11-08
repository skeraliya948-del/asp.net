<%@ Page Title="Add Company" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Add_Company.aspx.cs" Inherits="Database_Connectivity.Add_Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
    <style>
        .page-container {
            width: 100%;
            max-width: 780px;
            margin: 10px auto 40px auto;
        }

        .company-card {
            background: #ffffff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(183, 110, 121, 0.12), 0 5px 15px rgba(0, 0, 0, 0.04);
            border: 1px solid #F3D9E2;
        }

        .title {
            text-align: center;
            margin-bottom: 25px;
        }

        .title h1 {
            margin: 0;
            font-size: 30px;
            font-family: 'Playfair Display', serif;
            color: #3E2723;
            font-weight: 700;
        }

        .title p {
            color: #786C68;
            margin-top: 6px;
            font-size: 15px;
        }

        .message {
            display: block;
            text-align: center;
            color: #D81B60;
            font-weight: 600;
            font-size: 15px;
            margin-bottom: 18px;
            padding: 8px 15px;
            background: #FFF0F5;
            border-radius: 8px;
            border: 1px solid #F8BBD0;
        }

        .products-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin: 0 auto 25px auto;
            padding: 10px 22px;
            border-radius: 10px;
            background: linear-gradient(135deg, #B76E79, #8D6E63);
            color: #ffffff !important;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
            box-shadow: 0 4px 12px rgba(183, 110, 121, 0.25);
            transition: all 0.3s ease;
        }

        .products-link:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(183, 110, 121, 0.35);
            color: #ffffff !important;
        }

        .company-form {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 16px;
        }

        .company-form td {
            padding: 4px 6px;
            vertical-align: middle;
        }

        .company-form td:first-child {
            width: 190px;
            font-weight: 600;
            color: #3E2723;
            font-size: 14px;
        }

        .input-box,
        .file-box {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #E8B4B8;
            border-radius: 10px;
            background: #FFFDF9;
            font-size: 14px;
            color: #2D2424;
            outline: none;
            transition: all 0.25s ease;
            box-sizing: border-box;
        }

        .input-box:focus,
        .file-box:focus {
            border-color: #E91E63;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(233, 30, 99, 0.12);
        }

        .add-btn {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, #E91E63, #C2185B);
            color: #ffffff;
            font-size: 16px;
            font-weight: 600;
            letter-spacing: 0.5px;
            cursor: pointer;
            box-shadow: 0 8px 20px rgba(233, 30, 99, 0.28);
            transition: all 0.3s ease;
            margin-top: 10px;
        }

        .add-btn:hover {
            opacity: 0.95;
            transform: translateY(-2px);
            box-shadow: 0 12px 25px rgba(233, 30, 99, 0.38);
        }

        @media (max-width: 650px) {
            .page-container {
                margin: 10px auto;
            }

            .company-card {
                padding: 22px 18px;
            }

            .company-form,
            .company-form tbody,
            .company-form tr,
            .company-form td {
                display: block;
                width: 100% !important;
            }

            .company-form td:first-child {
                padding-bottom: 4px;
            }

            .company-form td:last-child {
                padding-top: 0;
                margin-bottom: 12px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
    <!-- Breadcrumb & Top Bar -->
    <div class="d-flex flex-wrap justify-content-between align-items-center mb-4">
        <div>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb sd-breadcrumb mb-1">
                    <li class="breadcrumb-item"><a href="Admin_Dashboard.aspx">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="Show_Company.aspx">Companies</a></li>
                    <li class="breadcrumb-item active text-danger" aria-current="page">Add Company</li>
                </ol>
            </nav>
            <h2 class="font-serif text-dark mb-0">Onboard New Bakery Company</h2>
        </div>
        <div>
            <a href="Show_Company.aspx" class="btn btn-sd-secondary">
                <i class="bi bi-list-ul me-1"></i> View All Companies
            </a>
        </div>
    </div>

    <!-- Page Content Container -->
    <div class="page-container">
        <div class="company-card">
            <div class="title">
                <h1><i class="bi bi-building-add text-danger me-2"></i>Add Company</h1>
                <p>Register a new bakery partner or confectionery brand</p>
            </div>

            <!-- Welcome / Status Result Message -->
            <asp:Label
                ID="lblresult"
                runat="server"
                CssClass="message">
            </asp:Label>

            <!-- Navigation Button to Products -->
            <div class="text-center">
                <asp:LinkButton
                    ID="LinkButton1"
                    runat="server"
                    CssClass="products-link"
                    OnClick="LinkButton1_Click1">
                    <i class="bi bi-cake2 me-1"></i> Add Products
                </asp:LinkButton>
            </div>

            <!-- Company Form Table -->
            <table class="company-form">
                <tr>
                    <td><i class="bi bi-shop text-danger me-1"></i> Company Name</td>
                    <td>
                        <asp:TextBox
                            ID="txtnm"
                            runat="server"
                            CssClass="input-box"
                            placeholder="Enter company name">
                        </asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td><i class="bi bi-person text-danger me-1"></i> Owner Name</td>
                    <td>
                        <asp:TextBox
                            ID="txtonm"
                            runat="server"
                            CssClass="input-box"
                            placeholder="Enter owner name">
                        </asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td><i class="bi bi-envelope text-danger me-1"></i> Email</td>
                    <td>
                        <asp:TextBox
                            ID="txteml"
                            runat="server"
                            TextMode="Email"
                            CssClass="input-box"
                            placeholder="e.g. partner@sweetdelights.com">
                        </asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td><i class="bi bi-geo-alt text-danger me-1"></i> Address</td>
                    <td>
                        <asp:TextBox
                            ID="txtadd"
                            runat="server"
                            TextMode="MultiLine"
                            Rows="4"
                            CssClass="input-box"
                            placeholder="Enter physical address">
                        </asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td><i class="bi bi-image text-danger me-1"></i> Company Image</td>
                    <td>
                        <asp:FileUpload
                            ID="imgUpload"
                            runat="server"
                            CssClass="file-box" />
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <asp:Button
                            ID="add_comp_btn"
                            runat="server"
                            Text="Add Company"
                            CssClass="add-btn"
                            OnClick="add_comp_btn_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
