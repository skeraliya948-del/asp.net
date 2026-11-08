<%@ Page Title="Manage Orders" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="admin_order.aspx.cs" Inherits="Database_Connectivity.admin_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
    <style>
        .page-container {
            width: 100%;
            margin: 10px auto 40px auto;
        }

        .order-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 35px;
            box-shadow: 0 15px 40px rgba(183, 110, 121, 0.12), 0 5px 15px rgba(0, 0, 0, 0.04);
            border: 1px solid #F3D9E2;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 22px;
            padding-bottom: 18px;
            border-bottom: 1px solid #F8BBD0;
        }

        .top-bar h1 {
            margin: 0;
            font-size: 28px;
            font-family: 'Playfair Display', serif;
            color: #3E2723;
            font-weight: 700;
        }

        .action-links {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
        }

        .btn-order-action {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 9px 18px;
            border-radius: 10px;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .btn-dashboard {
            background: #FFFDF9;
            border: 1px solid #E8B4B8;
            color: #3E2723 !important;
        }

        .btn-dashboard:hover {
            background: #FFF0F5;
            border-color: #E91E63;
            color: #E91E63 !important;
            transform: translateY(-2px);
        }

        .btn-all-orders {
            background: linear-gradient(135deg, #E91E63, #C2185B);
            color: #ffffff !important;
            box-shadow: 0 4px 12px rgba(233, 30, 99, 0.25);
        }

        .btn-all-orders:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(233, 30, 99, 0.35);
            color: #ffffff !important;
        }

        .message {
            display: block;
            text-align: center;
            color: #D81B60;
            font-weight: 600;
            font-size: 14px;
            margin-bottom: 20px;
            padding: 10px 16px;
            background: #FFF0F5;
            border-radius: 10px;
            border: 1px solid #F8BBD0;
        }

        .table-wrap {
            width: 100%;
            overflow-x: auto;
            border-radius: 14px;
            border: 1px solid #F3D9E2;
            background: #ffffff;
        }

        .order-table {
            width: 100%;
            min-width: 1000px;
            border-collapse: collapse;
            font-size: 14px;
        }

        .order-table th {
            background: linear-gradient(135deg, #FFF0F5, #FCE4EC);
            color: #3E2723;
            padding: 14px 12px;
            text-align: left;
            font-size: 14px;
            font-weight: 700;
            border-bottom: 2px solid #F8BBD0;
            white-space: nowrap;
        }

        .order-table td {
            padding: 14px 12px;
            border-bottom: 1px solid #F7EFE8;
            vertical-align: middle;
            color: #2D2424;
            white-space: nowrap;
        }

        .order-table tr:nth-child(even) {
            background: #FFFDF9;
        }

        .order-table tr:hover {
            background: #FDE8EF;
            transition: background 0.2s ease;
        }

        /* Status Dropdown inside edit mode */
        .status-dropdown {
            padding: 6px 10px;
            border: 1px solid #E8B4B8;
            border-radius: 8px;
            background: #ffffff;
            font-size: 13px;
            font-weight: 600;
            outline: none;
            color: #3E2723;
        }

        .status-dropdown:focus {
            border-color: #E91E63;
            box-shadow: 0 0 0 3px rgba(233, 30, 99, 0.12);
        }

        /* Edit/Update/Cancel Action Buttons */
        .order-table a {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
            text-decoration: none;
            margin: 2px;
            transition: all 0.2s ease;
        }

        /* Edit Link */
        .order-table a[href*="Edit"] {
            background: linear-gradient(135deg, #B76E79, #8D6E63);
            color: #ffffff !important;
        }

        .order-table a[href*="Edit"]:hover {
            opacity: 0.9;
            transform: translateY(-1px);
        }

        /* Update Link */
        .order-table a[href*="Update"] {
            background: linear-gradient(135deg, #2E7D32, #1B5E20);
            color: #ffffff !important;
        }

        /* Cancel Link */
        .order-table a[href*="Cancel"] {
            background: #ECEFF1;
            color: #37474F !important;
        }

        .status-badge {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
            text-align: center;
        }

        @media (max-width: 768px) {
            .order-card {
                padding: 20px 15px;
            }

            .top-bar {
                flex-direction: column;
                align-items: flex-start;
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
                    <li class="breadcrumb-item active text-danger" aria-current="page">Manage Orders</li>
                </ol>
            </nav>
            <h2 class="font-serif text-dark mb-0">Customer Orders Fulfillment</h2>
        </div>
    </div>

    <div class="page-container">
        <div class="order-card">
            <div class="top-bar">
                <h1><i class="bi bi-receipt-cutoff text-danger me-2"></i>Manage Orders</h1>

                <div class="action-links">
                    <asp:HyperLink ID="lnkadmindsb"
                        runat="server"
                        NavigateUrl="Admin_Dashboard.aspx"
                        CssClass="btn-order-action btn-dashboard">
                        <i class="bi bi-speedometer2"></i> Admin Dashboard
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkAllOrders"
                        runat="server"
                        NavigateUrl="admin_order.aspx"
                        CssClass="btn-order-action btn-all-orders">
                        <i class="bi bi-list-check"></i> Show All Orders
                    </asp:HyperLink>
                </div>
            </div>

            <!-- Message Notification -->
            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

            <div class="table-wrap">
                <asp:GridView ID="GridView1"
                    runat="server"
                    AutoGenerateColumns="False"
                    DataKeyNames="Order_No"
                    CssClass="order-table"
                    GridLines="None"
                    EmptyDataText="No Orders Found in Database"
                    OnRowEditing="GridView1_RowEditing"
                    OnRowUpdating="GridView1_RowUpdating"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit">

                    <Columns>
                        <asp:BoundField DataField="Order_Detail_Id"
                            HeaderText="Order Detail ID" ReadOnly="True" />

                        <asp:BoundField DataField="Order_No"
                            HeaderText="Order No" ReadOnly="True" />

                        <asp:BoundField DataField="Name"
                            HeaderText="Customer Name" ReadOnly="True" />

                        <asp:BoundField DataField="Prod_Name"
                            HeaderText="Product Name" ReadOnly="True" />

                        <asp:BoundField DataField="Quentity"
                            HeaderText="Quantity" ReadOnly="True" />

                        <asp:TemplateField HeaderText="Amount">
                            <ItemTemplate>
                                <span class="fw-bold text-dark"><i class="fa-solid fa-indian-rupee-sign text-danger me-1"></i><%# Eval("Amount", "{0:0.00}") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="Order_Date"
                            HeaderText="Order Date"
                            DataFormatString="{0:dd/MM/yyyy HH:mm:ss tt}"
                            ReadOnly="True" />

                        <asp:BoundField DataField="Ship_Address"
                            HeaderText="Shipping Address" ReadOnly="True" />

                        <asp:BoundField DataField="Pay_Method"
                            HeaderText="Payment Method" ReadOnly="True" />

                        <asp:TemplateField HeaderText="Payment Status">
                            <ItemTemplate>
                                <span class="badge bg-light text-dark border px-3 py-1">
                                    <asp:Label ID="lblPayStatus"
                                        runat="server"
                                        Text='<%# Eval("Pay_Status") %>' />
                                </span>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlPayStatus"
                                    runat="server"
                                    CssClass="status-dropdown"
                                    SelectedValue='<%# Bind("Pay_Status") %>'>
                                    <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                    <asp:ListItem Value="Paid">Paid</asp:ListItem>
                                    <asp:ListItem Value="Failed">Failed</asp:ListItem>
                                    <asp:ListItem Value="Refunded">Refunded</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Order Status">
                            <ItemTemplate>
                                <span class="badge bg-danger text-white px-3 py-1">
                                    <asp:Label ID="lblOrderStatus"
                                        runat="server"
                                        Text='<%# Eval("Order_Status") %>' />
                                </span>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlOrderStatus"
                                    runat="server"
                                    CssClass="status-dropdown"
                                    SelectedValue='<%# Bind("Order_Status") %>'>
                                    <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                    <asp:ListItem Value="Processing">Processing</asp:ListItem>
                                    <asp:ListItem Value="Shipped">Shipped</asp:ListItem>
                                    <asp:ListItem Value="Delivered">Delivered</asp:ListItem>
                                    <asp:ListItem Value="Cancelled">Cancelled</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField
                            HeaderText="Action"
                            ShowEditButton="True"
                            EditText="Edit"
                            UpdateText="Update"
                            CancelText="Cancel" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
