<%@ Page Title="Add Product" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Add_Products.aspx.cs" Inherits="Database_Connectivity.Add_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
    <style>
        .page-container {
            width: 100%;
            max-width: 850px;
            margin: 10px auto 40px auto;
        }

        .product-card {
            background: #ffffff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(183, 110, 121, 0.12), 0 5px 15px rgba(0, 0, 0, 0.04);
            border: 1px solid #F3D9E2;
        }

        .top-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            margin-bottom: 25px;
            padding-bottom: 18px;
            border-bottom: 1px solid #F8BBD0;
        }

        .top-section h1 {
            margin: 0;
            font-size: 28px;
            font-family: 'Playfair Display', serif;
            color: #3E2723;
            font-weight: 700;
        }

        .company-link {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 10px 20px;
            background: linear-gradient(135deg, #B76E79, #8D6E63);
            color: #ffffff !important;
            text-decoration: none;
            border-radius: 10px;
            font-weight: 600;
            font-size: 14px;
            box-shadow: 0 4px 12px rgba(183, 110, 121, 0.25);
            transition: all 0.3s ease;
        }

        .company-link:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(183, 110, 121, 0.35);
            color: #ffffff !important;
        }

        .welcome {
            display: block;
            margin-bottom: 22px;
            color: #D81B60;
            font-weight: 600;
            font-size: 15px;
            padding: 9px 16px;
            background: #FFF0F5;
            border-radius: 8px;
            border: 1px solid #F8BBD0;
        }

        .product-form {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 16px;
        }

        .product-form td {
            padding: 4px 6px;
            vertical-align: middle;
        }

        .product-form td:first-child {
            width: 190px;
            font-weight: 600;
            color: #3E2723;
            font-size: 14px;
        }

        .input-box,
        .select-box,
        .file-box {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #E8B4B8;
            border-radius: 10px;
            background: #FFFDF9;
            outline: none;
            font-size: 14px;
            color: #2D2424;
            transition: all 0.25s ease;
            box-sizing: border-box;
        }

        .input-box:focus,
        .select-box:focus,
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

            .product-card {
                padding: 22px 18px;
            }

            .top-section {
                flex-direction: column;
                align-items: stretch;
            }

            .product-form,
            .product-form tbody,
            .product-form tr,
            .product-form td {
                display: block;
                width: 100% !important;
            }

            .product-form td:first-child {
                padding-bottom: 4px;
            }

            .product-form td:last-child {
                padding-top: 0;
                margin-bottom: 12px;
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
                    <li class="breadcrumb-item"><a href="Show_Products.aspx">Products</a></li>
                    <li class="breadcrumb-item active text-danger" aria-current="page">Add Product</li>
                </ol>
            </nav>
            <h2 class="font-serif text-dark mb-0">Add New Cake or Dessert Product</h2>
        </div>
        <div>
            <a href="Show_Products.aspx" class="btn btn-sd-secondary">
                <i class="bi bi-grid me-1"></i> View All Products
            </a>
        </div>
    </div>

    <!-- Product Card Container -->
    <div class="page-container">
        <div class="product-card">
            <div class="top-section">
                <h1><i class="bi bi-cake2 text-danger me-2"></i>Add Product</h1>
                <asp:HyperLink
                    ID="ShowCompany"
                    runat="server"
                    NavigateUrl="~/Show_Company.aspx"
                    CssClass="company-link">
                    <i class="bi bi-shop me-1"></i> View Companies
                </asp:HyperLink>
            </div>

            <asp:Label
                ID="lblWelcome"
                runat="server"
                CssClass="welcome">
            </asp:Label>

            <table class="product-form">
                <tr>
                    <td><i class="bi bi-building text-danger me-1"></i> Company</td>
                    <td>
                        <asp:DropDownList
                            ID="drpcompid"
                            runat="server"
                            AutoPostBack="True"
                            CssClass="select-box">
                            <asp:ListItem>---Select Product---</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td><i class="bi bi-tag text-danger me-1"></i> Product Model</td>
                    <td>
                        <asp:TextBox
                            ID="txtmodel"
                            runat="server"
                            CssClass="input-box"
                            placeholder="Enter model or product title">
                        </asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td><i class="bi bi-file-text text-danger me-1"></i> Description</td>
                    <td>
                        <asp:TextBox
                            ID="txtdesc"
                            runat="server"
                            TextMode="MultiLine"
                            Rows="4"
                            CssClass="input-box"
                            placeholder="Enter detailed product description">
                        </asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td><i class="bi bi-speedometer text-danger me-1"></i> Weight</td>
                    <td>
                        <asp:TextBox
                            ID="txtweight"
                            runat="server"
                            CssClass="input-box"
                            placeholder="e.g. 500g, 1kg, 2lbs">
                        </asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td><i class="bi bi-sliders text-danger me-1"></i> Configuration</td>
                    <td>
                        <asp:TextBox
                            ID="txtconfig"
                            runat="server"
                            TextMode="MultiLine"
                            Rows="4"
                            CssClass="input-box"
                            placeholder="Enter configurations or specifications">
                        </asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td><i class="bi bi-image text-danger me-1"></i> Product Image</td>
                    <td>
                        <asp:FileUpload
                            ID="imgUpload"
                            runat="server"
                            CssClass="file-box" />
                    </td>
                </tr>

                <tr>
                    <td><i class="fa-solid fa-indian-rupee-sign text-danger me-1"></i> Price (₹)</td>
                    <td>
                        <asp:TextBox
                            ID="txtprice"
                            runat="server"
                            CssClass="input-box"
                            placeholder="Enter price in ₹ (e.g. 280.00)">
                        </asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <asp:Button
                            ID="btnAdd"
                            runat="server"
                            Text="Add Product"
                            CssClass="add-btn"
                            OnClick="btnAdd_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
