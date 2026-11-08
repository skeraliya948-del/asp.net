<%@ Page Title="Our Cakes & Desserts" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Show_Products.aspx.cs" Inherits="Database_Connectivity.Show_Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .product-header-bar {
            background: linear-gradient(135deg, #FFF0F5, #FCE4EC);
            border: 1px solid #F8BBD0;
            border-radius: 16px;
            padding: 16px 24px;
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            box-shadow: 0 4px 15px rgba(183, 110, 121, 0.08);
        }

        .product-header-bar h2 {
            margin: 0;
            font-size: 22px;
            font-family: 'Playfair Display', serif;
            color: #3E2723;
            font-weight: 700;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
        }

        .welcome-badge {
            color: #D81B60;
            font-weight: 600;
            font-size: 14px;
            padding: 6px 14px;
            background: #ffffff;
            border-radius: 20px;
            border: 1px solid #F8BBD0;
        }

        .btn-back-companies {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 8px 18px;
            background: linear-gradient(135deg, #B76E79, #8D6E63);
            color: #ffffff !important;
            text-decoration: none;
            border-radius: 10px;
            font-size: 13px;
            font-weight: 600;
            box-shadow: 0 4px 10px rgba(183, 110, 121, 0.2);
            transition: all 0.25s ease;
        }

        .btn-back-companies:hover {
            opacity: 0.92;
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(183, 110, 121, 0.3);
            color: #ffffff !important;
        }

        .page-wrap {
            padding: 10px 0 50px 0;
            max-width: 1250px;
            margin: auto;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
            gap: 28px;
        }

        .product-card {
            background: #ffffff;
            border-radius: 20px;
            border: 1px solid #F3D9E2;
            box-shadow: 0 10px 30px rgba(183, 110, 121, 0.10);
            padding: 20px;
            display: flex;
            flex-direction: column;
            transition: all 0.35s cubic-bezier(0.25, 1, 0.5, 1);
            overflow: hidden;
        }

        .product-card:hover {
            transform: translateY(-8px);
            border-color: #E91E63;
            box-shadow: 0 18px 40px rgba(233, 30, 99, 0.18);
        }

        .img-frame {
            width: 100%;
            height: 210px;
            border-radius: 14px;
            overflow: hidden;
            background: #FFFDF9;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
            border: 1px solid #F7EFE8;
            box-shadow: inset 0 2px 6px rgba(0,0,0,0.02);
        }

        .img-frame img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.4s ease;
        }

        .product-card:hover .img-frame img {
            transform: scale(1.06);
        }

        .prod-name {
            font-size: 17px;
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            color: #3E2723;
            margin-bottom: 8px;
            min-height: 48px;
            line-height: 1.4;
        }

        .prod-price {
            font-size: 20px;
            font-weight: 700;
            color: #D81B60;
            margin-bottom: 16px;
        }

        .btn-row {
            display: flex;
            gap: 10px;
            margin-top: auto;
        }

        .btn-row .btn {
            flex: 1;
            text-align: center;
            padding: 10px 8px;
            border-radius: 10px;
            font-size: 13px;
            font-weight: 600;
            border: none;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            transition: all 0.25s ease;
        }

        .btn-view {
            background: #FFF0F5;
            color: #3E2723 !important;
            border: 1px solid #F8BBD0;
        }

        .btn-view:hover {
            background: #FDE8EF;
            color: #E91E63 !important;
            transform: translateY(-1px);
        }

        .btn-cart {
            background: linear-gradient(135deg, #E91E63, #C2185B);
            color: #ffffff !important;
            box-shadow: 0 4px 10px rgba(233, 30, 99, 0.25);
        }

        .btn-cart:hover {
            opacity: 0.92;
            transform: translateY(-1px);
            box-shadow: 0 6px 16px rgba(233, 30, 99, 0.35);
            color: #ffffff !important;
        }

        .empty-msg {
            display: block;
            text-align: center;
            color: #786C68;
            font-size: 16px;
            padding: 50px 20px;
            background: #ffffff;
            border-radius: 16px;
            border: 1px solid #F3D9E2;
            margin-top: 20px;
        }

        @media (max-width: 600px) {
            .product-grid {
                grid-template-columns: 1fr;
            }

            .product-header-bar {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header Banner -->
    <div class="py-5 text-center" style="background: radial-gradient(circle, #FFF0F5 0%, #FCE4EC 100%); border-bottom: 1px solid #F8BBD0;">
        <div class="container">
            <span class="sd-section-subtitle">Freshly Baked Daily</span>
            <h1 class="display-4 font-serif text-dark mb-2">Artisanal Cakes & Desserts Collection</h1>
            <p class="lead text-muted mx-auto" style="max-width: 650px;">
                Handcrafted with pure Belgian chocolate, fresh seasonal fruits, and love. Order online for same-day delivery.
            </p>
        </div>
    </div>

    <div class="container py-4">
        <!-- Sub-Navigation Header Bar -->
        <div class="product-header-bar">
            <h2><i class="bi bi-cake2 text-danger me-2"></i>Desserts & Confectioneries</h2>

            <div class="header-actions">
                <asp:Label
                    ID="Label3"
                    runat="server"
                    CssClass="welcome-badge">
                </asp:Label>

                <a href="Show_Company.aspx" class="btn-back-companies">
                    <i class="bi bi-arrow-left"></i> Back to Companies
                </a>
            </div>
        </div>

        <!-- Products Grid Wrap -->
        <div class="page-wrap">
            <asp:DataList
                ID="DataList1"
                runat="server"
                RepeatLayout="Flow"
                CssClass="product-grid"
                OnItemCommand="DataList1_ItemCommand">

                <ItemTemplate>
                    <div class="product-card">
                        <div class="img-frame">
                            <asp:Image
                                ID="Image1"
                                runat="server"
                                ImageUrl='<%# Eval("Prod_Img") %>'
                                AlternateText='<%# Eval("Prod_Model") %>' />
                        </div>

                        <div class="prod-name">
                            <asp:Label
                                ID="Label1"
                                runat="server"
                                Text='<%# Eval("Prod_Model") %>'>
                            </asp:Label>
                        </div>

                        <div class="prod-price">
                            <i class="fa-solid fa-indian-rupee-sign me-1"></i><asp:Label
                                ID="Label2"
                                runat="server"
                                Text='<%# Eval("Prod_Price") == DBNull.Value ? "0.00" : Convert.ToDecimal(Eval("Prod_Price")).ToString("N2") %>'>
                            </asp:Label>
                        </div>

                        <div class="btn-row">
                            <asp:LinkButton
                                ID="btnView"
                                runat="server"
                                CssClass="btn btn-view"
                                CommandName="cmd_view"
                                CommandArgument='<%# Eval("Prod_Id") %>'>
                                <i class="bi bi-eye"></i> View
                            </asp:LinkButton>

                            <asp:LinkButton
                                ID="btnCart"
                                runat="server"
                                CssClass="btn btn-cart"
                                CommandName="cmd_cart"
                                CommandArgument='<%# Eval("Prod_Id") %>'>
                                <i class="bi bi-cart-plus"></i> Add
                            </asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>

            <asp:Label
                ID="lblEmpty"
                runat="server"
                CssClass="empty-msg"
                Text="No products found for this company."
                Visible="false">
            </asp:Label>
        </div>
    </div>
</asp:Content>
