<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="Database_Connectivity.ViewDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .details-wrapper {
            width: 100%;
            max-width: 900px;
            margin: 20px auto 50px auto;
        }

        .back-nav {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: #E91E63;
            font-weight: 600;
            text-decoration: none;
            margin-bottom: 22px;
            transition: all 0.2s ease;
        }

        .back-nav:hover {
            color: #C2185B;
            transform: translateX(-3px);
        }

        .details-card {
            background: #ffffff;
            border-radius: 24px;
            padding: 40px;
            box-shadow: 0 15px 40px rgba(183, 110, 121, 0.14), 0 5px 15px rgba(0, 0, 0, 0.04);
            border: 1px solid #F3D9E2;
        }

        .details-grid {
            display: grid;
            grid-template-columns: 1fr 1.2fr;
            gap: 35px;
            align-items: start;
        }

        .image-frame {
            width: 100%;
            height: 380px;
            border-radius: 18px;
            overflow: hidden;
            background: #FFFDF9;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #F7EFE8;
            box-shadow: 0 6px 18px rgba(183, 110, 121, 0.12);
        }

        .product-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.4s ease;
        }

        .details-card:hover .product-image {
            transform: scale(1.04);
        }

        .product-info {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .details-title {
            font-size: 26px;
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            color: #3E2723;
            margin: 0 0 10px 0;
            border-bottom: 1px solid #F8BBD0;
            padding-bottom: 12px;
        }

        .price-badge {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            font-size: 26px;
            font-weight: 800;
            color: #D81B60;
            background: #FFF0F5;
            padding: 8px 22px;
            border-radius: 12px;
            border: 1px solid #F8BBD0;
            width: fit-content;
        }

        .info-box {
            background: #FFFDF9;
            border-radius: 14px;
            padding: 18px 20px;
            border: 1px solid #F3D9E2;
        }

        .info-title {
            font-size: 13px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: #8D6E63;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .config {
            font-size: 15px;
            line-height: 1.7;
            color: #3E2723;
            font-weight: 500;
            margin: 0;
        }

        .description {
            font-size: 15px;
            line-height: 1.8;
            color: #5D4037;
            margin: 0;
        }

        .action-row {
            display: flex;
            gap: 12px;
            margin-top: 10px;
            flex-wrap: wrap;
        }

        .btn-action-cart {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 12px 26px;
            border-radius: 10px;
            background: linear-gradient(135deg, #E91E63, #C2185B);
            color: #ffffff !important;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            box-shadow: 0 4px 12px rgba(233, 30, 99, 0.28);
            transition: all 0.25s ease;
        }

        .btn-action-cart:hover {
            opacity: 0.92;
            transform: translateY(-2px);
            box-shadow: 0 8px 18px rgba(233, 30, 99, 0.38);
            color: #ffffff !important;
        }

        .btn-action-all {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 12px 22px;
            border-radius: 10px;
            background: #FFFDF9;
            border: 1px solid #E8B4B8;
            color: #3E2723 !important;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.25s ease;
        }

        .btn-action-all:hover {
            background: #FFF0F5;
            color: #E91E63 !important;
            border-color: #E91E63;
        }

        @media (max-width: 768px) {
            .details-grid {
                grid-template-columns: 1fr;
            }

            .image-frame {
                height: 280px;
            }

            .details-card {
                padding: 24px 18px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header Banner -->
    <div class="py-4 text-center" style="background: radial-gradient(circle, #FFF0F5 0%, #FCE4EC 100%); border-bottom: 1px solid #F8BBD0;">
        <div class="container">
            <span class="sd-section-subtitle" style="font-size:1.8rem;">Artisan Showcase</span>
            <h1 class="font-serif text-dark mb-0">Product Details & Culinary Overview</h1>
        </div>
    </div>

    <div class="container py-4">
        <div class="details-wrapper">
            <a href="Show_Products.aspx" class="back-nav">
                <i class="bi bi-arrow-left"></i> Back to Cake Collection
            </a>

            <div class="details-card">
                <asp:DataList
                    ID="DataList1"
                    runat="server"
                    Width="100%"
                    RepeatLayout="Flow">
                    <ItemTemplate>
                        <div class="details-grid">
                            <!-- Left: Product Image -->
                            <div class="image-frame">
                                <asp:Image
                                    ID="Image1"
                                    runat="server"
                                    CssClass="product-image"
                                    ImageUrl='<%# Eval("Prod_Img") %>' />
                            </div>

                            <!-- Right: Product Info -->
                            <div class="product-info">
                                <h2 class="details-title">
                                    <i class="bi bi-cake2 text-danger me-2"></i>Product Details
                                </h2>

                                <div>
                                    <div class="price-badge">
                                        <i class="fa-solid fa-indian-rupee-sign me-1"></i><asp:Label
                                            ID="Label1"
                                            runat="server"
                                            Text='<%# Eval("Prod_Price") == DBNull.Value ? "0.00" : Convert.ToDecimal(Eval("Prod_Price")).ToString("N2") %>'>
                                        </asp:Label>
                                    </div>
                                </div>

                                <div class="info-box">
                                    <div class="info-title">
                                        <i class="bi bi-sliders text-danger"></i> Specifications & Weight
                                    </div>
                                    <div class="config">
                                        <asp:Label
                                            ID="Label2"
                                            runat="server"
                                            Text='<%# Eval("Prod_Config") %>'>
                                        </asp:Label>
                                    </div>
                                </div>

                                <div class="info-box">
                                    <div class="info-title">
                                        <i class="bi bi-file-earmark-text text-danger"></i> Culinary Description & Flavor
                                    </div>
                                    <div class="description">
                                        <asp:Label
                                            ID="Label3"
                                            runat="server"
                                            Text='<%# Eval("Prod_Desc") %>'>
                                        </asp:Label>
                                    </div>
                                </div>

                                <div class="action-row">
                                    <a href="Show_Products.aspx" class="btn-action-all">
                                        <i class="bi bi-grid"></i> Browse More
                                    </a>
                                    <a href="Add_to_Cart.aspx" class="btn-action-cart">
                                        <i class="bi bi-cart3"></i> View Cart
                                    </a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>
</asp:Content>
