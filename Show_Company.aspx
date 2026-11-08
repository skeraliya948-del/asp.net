<%@ Page Title="Bakery Brands & Companies" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Show_Company.aspx.cs" Inherits="Database_Connectivity.Show_Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .company-header-bar {
            background: linear-gradient(135deg, #FFF0F5, #FCE4EC);
            border: 1px solid #F8BBD0;
            border-radius: 16px;
            padding: 18px 25px;
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            box-shadow: 0 4px 15px rgba(183, 110, 121, 0.08);
        }

        .company-header-bar h2 {
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

        .btn-brand-nav {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 9px 18px;
            border-radius: 10px;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.25s ease;
        }

        .btn-products {
            background: linear-gradient(135deg, #B76E79, #8D6E63);
            color: #ffffff !important;
            box-shadow: 0 4px 10px rgba(183, 110, 121, 0.2);
        }

        .btn-products:hover {
            opacity: 0.92;
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(183, 110, 121, 0.3);
            color: #ffffff !important;
        }

        .btn-cart {
            background: linear-gradient(135deg, #E91E63, #C2185B);
            color: #ffffff !important;
            box-shadow: 0 4px 10px rgba(233, 30, 99, 0.25);
        }

        .btn-cart:hover {
            opacity: 0.92;
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(233, 30, 99, 0.35);
            color: #ffffff !important;
        }

        .page-wrap {
            padding: 10px 0 50px 0;
            max-width: 1250px;
            margin: auto;
        }

        .company-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
            gap: 28px;
        }

        .company-box {
            background: #ffffff;
            border-radius: 20px;
            border: 1px solid #F3D9E2;
            box-shadow: 0 10px 30px rgba(183, 110, 121, 0.10);
            padding: 22px;
            text-align: center;
            transition: all 0.35s cubic-bezier(0.25, 1, 0.5, 1);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .company-box:hover {
            transform: translateY(-8px);
            border-color: #E91E63;
            box-shadow: 0 18px 40px rgba(233, 30, 99, 0.18);
        }

        .img-frame {
            width: 100%;
            height: 190px;
            border-radius: 14px;
            overflow: hidden;
            background: #FFFDF9;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 16px;
            border: 1px solid #F7EFE8;
            box-shadow: inset 0 2px 6px rgba(0,0,0,0.02);
        }

        .img-frame img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.4s ease;
        }

        .company-box:hover .img-frame img {
            transform: scale(1.05);
        }

        .company-name {
            display: inline-block;
            font-size: 18px;
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            color: #3E2723;
            text-decoration: none;
            background: none;
            border: none;
            cursor: pointer;
            padding: 8px 12px;
            border-radius: 8px;
            transition: all 0.2s ease;
        }

        .company-name:hover {
            color: #E91E63;
            background: #FFF0F5;
            text-decoration: none;
        }

        .company-explore-btn {
            margin-top: 10px;
            font-size: 13px;
            font-weight: 600;
            color: #E91E63;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 4px;
        }

        @media (max-width: 600px) {
            .company-grid {
                grid-template-columns: 1fr;
            }

            .company-header-bar {
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
            <span class="sd-section-subtitle">Our Artisan Network</span>
            <h1 class="display-4 font-serif text-dark mb-2">Featured Bakery Brands & Partners</h1>
            <p class="lead text-muted mx-auto" style="max-width: 680px;">
                Discover elite patisseries, master chocolatiers, and heritage bakeries featured exclusively on SweetDelights.
            </p>
        </div>
    </div>

    <div class="container py-4">
        <!-- Action & Navigation Bar -->
        <div class="company-header-bar">
            <h2><i class="bi bi-shop text-danger me-2"></i>Artisan Bakeries</h2>

            <div class="header-actions">
                <asp:Label
                    ID="Label1"
                    runat="server"
                    CssClass="welcome-badge">
                </asp:Label>

                <asp:HyperLink
                    ID="ShowCompany"
                    runat="server"
                    NavigateUrl="Show_Products.aspx"
                    CssClass="btn-brand-nav btn-products">
                    <i class="bi bi-cake2"></i> Show Products
                </asp:HyperLink>

                <asp:HyperLink
                    ID="ShowCart"
                    runat="server"
                    NavigateUrl="Add_to_Cart.aspx"
                    CssClass="btn-brand-nav btn-cart">
                    <i class="bi bi-cart3"></i> View Cart
                </asp:HyperLink>
            </div>
        </div>

        <!-- Companies Grid Wrap -->
        <div class="page-wrap">
            <asp:DataList
                ID="DataList1"
                runat="server"
                RepeatLayout="Flow"
                CssClass="company-grid"
                OnItemCommand="DataList1_ItemCommand">
                <ItemTemplate>
                    <div class="company-box">
                        <div class="img-frame">
                            <asp:Image
                                ID="Image1"
                                runat="server"
                                ImageUrl='<%# Eval("Comp_Cover_Img") %>'
                                AlternateText='<%# Eval("Comp_Name") %>' />
                        </div>

                        <div>
                            <asp:LinkButton
                                ID="LinkButton1"
                                runat="server"
                                CssClass="company-name"
                                Text='<%# Eval("Comp_Name") %>'
                                CommandArgument='<%# Eval("Comp_Id") %>'
                                CommandName="cmd_cid">
                            </asp:LinkButton>

                            <div class="company-explore-btn">
                                <span>Explore Cakes & Treats</span>
                                <i class="bi bi-arrow-right-short fs-5"></i>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
