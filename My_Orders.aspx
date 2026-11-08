<%@ Page Title="Order Confirmation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="My_Orders.aspx.cs" Inherits="Database_Connectivity.My_Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .checkout-wrapper {
            width: 100%;
            max-width: 1100px;
            margin: 20px auto 50px auto;
        }

        .checkout-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 15px 40px rgba(183, 110, 121, 0.12), 0 5px 15px rgba(0, 0, 0, 0.04);
            border: 1px solid #F3D9E2;
            margin-bottom: 25px;
        }

        .section-header {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 18px;
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            color: #3E2723;
            margin-bottom: 18px;
            padding-bottom: 10px;
            border-bottom: 1px solid #F8BBD0;
        }

        .section-header i {
            color: #E91E63;
            font-size: 20px;
        }

        .form-label {
            font-size: 13px;
            font-weight: 600;
            color: #3E2723;
            margin-bottom: 5px;
        }

        .input-box {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid #E8B4B8;
            border-radius: 10px;
            font-size: 14px;
            background: #FFFDF9;
            color: #2D2424;
            outline: none;
            transition: all 0.25s ease;
            box-sizing: border-box;
        }

        .input-box:focus {
            border-color: #E91E63;
            box-shadow: 0 0 0 3px rgba(233, 30, 99, 0.12);
        }

        .input-box[readonly] {
            background: #FDF7F4;
            color: #5D4037;
            font-weight: 600;
            cursor: default;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: #E91E63;
            font-weight: 600;
            text-decoration: none;
            margin-bottom: 20px;
            transition: all 0.2s ease;
        }

        .back-link:hover {
            color: #C2185B;
            transform: translateX(-3px);
        }

        .alert-error {
            display: block;
            text-align: center;
            color: #C62828;
            font-weight: 600;
            font-size: 14px;
            margin-bottom: 20px;
            padding: 10px 16px;
            background: #FFEBEE;
            border-radius: 10px;
            border: 1px solid #FFCDD2;
        }

        .grid-wrap {
            width: 100%;
            overflow-x: auto;
            border-radius: 14px;
            border: 1px solid #F3D9E2;
            background: #ffffff;
            margin-top: 15px;
        }

        .order-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }

        .order-table th {
            background: linear-gradient(135deg, #FFF0F5, #FCE4EC);
            color: #3E2723;
            padding: 14px 12px;
            text-align: left;
            font-weight: 700;
            border-bottom: 2px solid #F8BBD0;
            white-space: nowrap;
        }

        .order-table td {
            padding: 12px;
            border-bottom: 1px solid #F7EFE8;
            vertical-align: middle;
            color: #2D2424;
            white-space: nowrap;
        }

        .order-table tr:nth-child(even) {
            background: #FFFDF9;
        }

        .order-table img {
            border-radius: 10px;
            object-fit: cover;
            border: 1px solid #E8B4B8;
            box-shadow: 0 3px 8px rgba(183, 110, 121, 0.15);
        }

        .summary-card {
            background: linear-gradient(135deg, #FFFDF9, #FFF0F5);
            border: 1px solid #F8BBD0;
            border-radius: 18px;
            padding: 25px;
            box-shadow: 0 10px 25px rgba(183, 110, 121, 0.10);
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 14px;
            font-size: 14px;
            color: #5D4037;
        }

        .summary-total {
            font-size: 20px;
            font-weight: 700;
            font-family: 'Playfair Display', serif;
            color: #3E2723;
            padding-top: 12px;
            border-top: 2px dashed #F8BBD0;
            margin-top: 10px;
        }

        .btn-place-order {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, #E91E63, #C2185B);
            color: #ffffff;
            font-size: 16px;
            font-weight: 700;
            letter-spacing: 0.5px;
            cursor: pointer;
            box-shadow: 0 8px 22px rgba(233, 30, 99, 0.32);
            transition: all 0.3s ease;
            margin-top: 20px;
        }

        .btn-place-order:hover {
            opacity: 0.95;
            transform: translateY(-2px);
            box-shadow: 0 12px 28px rgba(233, 30, 99, 0.42);
        }

        .radio-pay label {
            margin-right: 20px;
            margin-left: 6px;
            font-weight: 600;
            color: #3E2723;
            cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header Banner -->
    <div class="py-4 text-center" style="background: radial-gradient(circle, #FFF0F5 0%, #FCE4EC 100%); border-bottom: 1px solid #F8BBD0;">
        <div class="container">
            <span class="sd-section-subtitle" style="font-size:1.8rem;">Checkout Finalization</span>
            <h1 class="font-serif text-dark mb-0">Order Confirmation & Dispatch</h1>
        </div>
    </div>

    <div class="container py-4">
        <div class="checkout-wrapper">
            <a href="Add_to_Cart.aspx" class="back-link">
                <i class="bi bi-arrow-left"></i> Back to Cart
            </a>

            <!-- Error / Validation Message -->
            <asp:Label ID="lblMessage" runat="server" CssClass="alert-error" Visible="false"></asp:Label>

            <div class="row g-4">
                <!-- Left Column: Customer, Shipping & Items -->
                <div class="col-lg-7">
                    <!-- Order & Customer Information -->
                    <div class="checkout-card">
                        <div class="section-header">
                            <i class="bi bi-file-earmark-text"></i> Order & Customer Details
                        </div>
                        <div class="row g-3">
                            <div class="col-sm-6">
                                <label class="form-label">Order No</label>
                                <asp:TextBox ID="txtordno" runat="server" ReadOnly="true" CssClass="input-box"></asp:TextBox>
                            </div>
                            <div class="col-sm-6">
                                <label class="form-label">Order Date</label>
                                <asp:TextBox ID="txtorddate" runat="server" ReadOnly="true" CssClass="input-box"></asp:TextBox>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Customer Name</label>
                                <asp:TextBox ID="txtcustname" runat="server" ReadOnly="true" CssClass="input-box"></asp:TextBox>
                            </div>
                            <div class="col-sm-6">
                                <label class="form-label">Email</label>
                                <asp:TextBox ID="txtemail" runat="server" ReadOnly="true" CssClass="input-box"></asp:TextBox>
                            </div>
                            <div class="col-sm-6">
                                <label class="form-label">Mobile</label>
                                <asp:TextBox ID="txtmobile" runat="server" ReadOnly="true" CssClass="input-box"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <!-- Shipping Details -->
                    <div class="checkout-card">
                        <div class="section-header">
                            <i class="bi bi-geo-alt"></i> Delivery & Shipping Address
                        </div>
                        <div>
                            <label class="form-label">Delivery Address *</label>
                            <asp:TextBox ID="txtaddress" runat="server"
                                TextMode="MultiLine" Rows="3"
                                CssClass="input-box"
                                placeholder="Enter full delivery address, house/flat no, landmark..."></asp:TextBox>
                        </div>
                    </div>

                    <!-- Cart Review Items Grid -->
                    <div class="checkout-card">
                        <div class="section-header">
                            <i class="bi bi-bag-check"></i> Items in This Order
                        </div>
                        <div class="grid-wrap">
                            <asp:GridView ID="GridView1" runat="server"
                                AutoGenerateColumns="False"
                                CssClass="order-table"
                                GridLines="None"
                                EmptyDataText="Your cart is empty">
                                <Columns>
                                    <asp:TemplateField HeaderText="Product Image">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server"
                                                ImageUrl='<%# Eval("Prod_Img") %>'
                                                Width="70px" Height="70px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="Prod_Name" HeaderText="Product Name" />
                                    <asp:BoundField DataField="Quentity" HeaderText="Qty" />
                                    <asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <i class="fa-solid fa-indian-rupee-sign text-secondary me-1"></i><%# Eval("Prod_Price", "{0:0.00}") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total">
                                        <ItemTemplate>
                                            <i class="fa-solid fa-indian-rupee-sign text-danger me-1"></i><%# Eval("Total", "{0:0.00}") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

                <!-- Right Column: Order Summary & Place Order CTA -->
                <div class="col-lg-5">
                    <div class="summary-card">
                        <div class="section-header">
                            <i class="bi bi-receipt"></i> Payment & Order Summary
                        </div>

                        <div class="summary-row">
                            <span>Cart Subtotal:</span>
                            <div class="d-flex align-items-center">
                                <span class="me-1 text-muted"><i class="fa-solid fa-indian-rupee-sign"></i></span>
                                <asp:TextBox ID="txtsubtotal" runat="server" ReadOnly="true" CssClass="input-box text-end" style="width: 130px;"></asp:TextBox>
                            </div>
                        </div>

                        <div class="summary-row">
                            <span>Delivery Fee:</span>
                            <div class="d-flex align-items-center">
                                <span class="me-1 text-muted"><i class="fa-solid fa-indian-rupee-sign"></i></span>
                                <asp:TextBox ID="txtdelcharge" runat="server" ReadOnly="true" CssClass="input-box text-end" style="width: 130px;"></asp:TextBox>
                            </div>
                        </div>

                        <div class="summary-row summary-total">
                            <span>Grand Total:</span>
                            <div class="d-flex align-items-center">
                                <span class="me-1 text-danger"><i class="fa-solid fa-indian-rupee-sign"></i></span>
                                <asp:TextBox ID="txtgrandtotal" runat="server" ReadOnly="true" CssClass="input-box text-end fw-bold text-danger fs-5" style="width: 140px;"></asp:TextBox>
                            </div>
                        </div>

                        <hr style="border-color: #F8BBD0;" />

                        <div class="mb-3">
                            <label class="form-label"><i class="bi bi-credit-card text-danger me-1"></i> Payment Method</label>
                            <asp:RadioButtonList ID="rblpay" runat="server"
                                RepeatDirection="Horizontal"
                                AutoPostBack="true"
                                CssClass="radio-pay"
                                OnSelectedIndexChanged="rblpay_SelectedIndexChanged">
                                <asp:ListItem Value="Cash" Selected="True">Cash on Delivery</asp:ListItem>
                                <asp:ListItem Value="Banking">Net Banking / UPI</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>

                        <div class="row g-2 mb-3">
                            <div class="col-6">
                                <label class="form-label small">Payment Status</label>
                                <asp:TextBox ID="txtpaystatus" runat="server" ReadOnly="true" CssClass="input-box text-center small"></asp:TextBox>
                            </div>
                            <div class="col-6">
                                <label class="form-label small">Order Status</label>
                                <asp:TextBox ID="txtorderstatus" runat="server" ReadOnly="true" CssClass="input-box text-center small"></asp:TextBox>
                            </div>
                        </div>

                        <asp:Button ID="btn_place" runat="server"
                            Text="Confirm & Place Order"
                            CssClass="btn-place-order"
                            OnClick="btn_place_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
