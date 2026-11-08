<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_to_Cart.aspx.cs" Inherits="Database_Connectivity.Add_To_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .page-container {
            width: 100%;
            max-width: 1100px;
            margin: 10px auto 40px auto;
        }

        .cart-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 35px;
            box-shadow: 0 15px 40px rgba(183, 110, 121, 0.12), 0 5px 15px rgba(0, 0, 0, 0.04);
            border: 1px solid #F3D9E2;
        }

        .cart-title {
            text-align: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #F8BBD0;
        }

        .cart-title h1 {
            margin: 0;
            font-size: 30px;
            font-family: 'Playfair Display', serif;
            color: #3E2723;
            font-weight: 700;
        }

        .message {
            display: block;
            text-align: center;
            color: #D81B60;
            font-weight: 600;
            font-size: 15px;
            margin-bottom: 20px;
            padding: 10px 16px;
            background: #FFF0F5;
            border-radius: 10px;
            border: 1px solid #F8BBD0;
        }

        .cart-table-wrapper {
            width: 100%;
            overflow-x: auto;
            border-radius: 14px;
            border: 1px solid #F3D9E2;
            background: #ffffff;
        }

        .cart-table {
            width: 100%;
            min-width: 800px;
            border-collapse: collapse;
        }

        .cart-table th {
            background: linear-gradient(135deg, #FFF0F5, #FCE4EC);
            color: #3E2723;
            padding: 16px 14px;
            text-align: center;
            font-size: 15px;
            font-weight: 700;
            border-bottom: 2px solid #F8BBD0;
            letter-spacing: 0.3px;
        }

        .cart-table td {
            padding: 14px 12px;
            text-align: center;
            border-bottom: 1px solid #F7EFE8;
            font-size: 15px;
            vertical-align: middle;
            color: #2D2424;
        }

        .cart-table tr:nth-child(even) {
            background: #FFFDF9;
        }

        .cart-table tr:hover {
            background: #FDE8EF;
            transition: background 0.2s ease;
        }

        .product-img {
            width: 85px !important;
            height: 85px !important;
            object-fit: cover;
            padding: 4px;
            background: #ffffff;
            border: 1px solid #E8B4B8;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(183, 110, 121, 0.15);
        }

        .product-model {
            font-size: 16px;
            font-weight: 600;
            color: #3E2723;
        }

        .quantity-dropdown {
            padding: 8px 12px;
            border: 1px solid #E8B4B8;
            border-radius: 8px;
            background: #FFFDF9;
            color: #2D2424;
            min-width: 70px;
            outline: none;
            font-weight: 600;
        }

        .quantity-dropdown:focus {
            border-color: #E91E63;
            box-shadow: 0 0 0 3px rgba(233, 30, 99, 0.12);
        }

        /* Buttons inside GridView */
        .cart-table input[type="submit"],
        .cart-table input[type="button"],
        .cart-table button,
        .cart-table a {
            padding: 8px 16px;
            border: none;
            border-radius: 8px;
            background: linear-gradient(135deg, #B76E79, #8D6E63);
            color: #ffffff !important;
            cursor: pointer;
            font-weight: 600;
            font-size: 13px;
            text-decoration: none;
            display: inline-block;
            box-shadow: 0 3px 8px rgba(183, 110, 121, 0.2);
            transition: all 0.25s ease;
        }

        .cart-table input[type="submit"]:hover,
        .cart-table input[type="button"]:hover,
        .cart-table button:hover,
        .cart-table a:hover {
            opacity: 0.92;
            transform: translateY(-1px);
            box-shadow: 0 5px 12px rgba(183, 110, 121, 0.3);
        }

        /* Specific style for Remove Button */
        .cart-table input[value="Remove"] {
            background: linear-gradient(135deg, #E53935, #C62828);
            box-shadow: 0 3px 8px rgba(229, 57, 53, 0.25);
        }

        .total-box {
            margin-top: 25px;
            text-align: right;
            padding: 24px;
            background: #FFFDF9;
            border-radius: 14px;
            border: 1px solid #F3D9E2;
            box-shadow: 0 4px 15px rgba(183, 110, 121, 0.06);
        }

        .total-label {
            font-size: 24px;
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            color: #3E2723;
        }

        .btn-checkout {
            display: inline-block;
            padding: 14px 34px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, #E91E63, #C2185B);
            color: #ffffff !important;
            font-size: 16px;
            font-weight: 600;
            letter-spacing: 0.5px;
            cursor: pointer;
            box-shadow: 0 8px 20px rgba(233, 30, 99, 0.28);
            transition: all 0.3s ease;
        }

        .btn-checkout:hover {
            opacity: 0.95;
            transform: translateY(-2px);
            box-shadow: 0 12px 25px rgba(233, 30, 99, 0.38);
        }

        @media (max-width: 768px) {
            .page-container {
                width: 95%;
                margin: 20px auto;
            }

            .cart-card {
                padding: 20px 15px;
            }

            .total-box {
                text-align: center;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header Banner -->
    <div class="py-4 text-center" style="background: radial-gradient(circle, #FFF0F5 0%, #FCE4EC 100%); border-bottom: 1px solid #F8BBD0;">
        <div class="container">
            <span class="sd-section-subtitle" style="font-size:1.8rem;">Your Sweet Selection</span>
            <h1 class="font-serif text-dark mb-0">Shopping Cart & Checkout</h1>
        </div>
    </div>

    <div class="container py-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <a href="Show_Products.aspx" class="text-danger fw-semibold text-decoration-none">
                <i class="bi bi-arrow-left me-1"></i> Continue Shopping
            </a>
            <span class="text-muted small"><i class="bi bi-bag-check-fill text-danger me-1"></i> Fresh Artisan Bakery Items</span>
        </div>

        <div class="page-container">
            <div class="cart-card">
                <div class="cart-title">
                    <h1><i class="bi bi-cart3 text-danger me-2"></i>Shopping Cart</h1>
                </div>

                <asp:Label
                    ID="Label5"
                    runat="server"
                    CssClass="message">
                </asp:Label>

                <div class="cart-table-wrapper">
                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        CssClass="cart-table"
                        AutoGenerateColumns="False"
                        DataKeyNames="Prod_Id"
                        OnRowCommand="GridView1_RowCommand"
                        OnRowEditing="GridView1_RowEditing"
                        OnRowUpdating="GridView1_RowUpdating">

                        <Columns>
                            <asp:TemplateField HeaderText="Product ID">
                                <ItemTemplate>
                                    <asp:Label
                                        ID="Label6"
                                        runat="server"
                                        Text='<%# Eval("Prod_Id") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Product Image">
                                <ItemTemplate>
                                    <asp:Image
                                        ID="Image1"
                                        runat="server"
                                        CssClass="product-img"
                                        ImageUrl='<%# Eval("Prod_Img") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Product Model">
                                <ItemTemplate>
                                    <asp:Label
                                        ID="Label2"
                                        runat="server"
                                        CssClass="product-model"
                                        Text='<%# Eval("Prod_Model") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    <span class="text-danger fw-bold"><i class="fa-solid fa-indian-rupee-sign me-1"></i></span>
                                    <asp:Label
                                        ID="Label3"
                                        runat="server"
                                        CssClass="fw-bold text-danger"
                                        Text='<%# Eval("Prod_Price") == DBNull.Value ? "0.00" : Convert.ToDecimal(Eval("Prod_Price")).ToString("N2") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:Label
                                        ID="Label4"
                                        runat="server"
                                        CssClass="badge bg-light text-dark px-3 py-2 border"
                                        Text='<%# Eval("Quentity") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList
                                        ID="DropDownList1"
                                        runat="server"
                                        CssClass="quantity-dropdown">
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                        <asp:ListItem Value="6">6</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:CommandField
                                HeaderText="Change Quantity"
                                ShowEditButton="True" />

                            <asp:TemplateField HeaderText="Remove">
                                <ItemTemplate>
                                    <asp:Button
                                        ID="btnRemove"
                                        runat="server"
                                        Text="Remove"
                                        CommandName="cmd_remove"
                                        CommandArgument='<%# Eval("Cart_Id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="total-box">
                    <asp:Label
                        ID="grand_total"
                        runat="server"
                        CssClass="total-label">
                    </asp:Label>

                    <br /><br />

                    <asp:Button
                        ID="btnCheckout"
                        runat="server"
                        Text="Proceed To Checkout"
                        CssClass="btn-checkout"
                        OnClick="btnCheckout_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
