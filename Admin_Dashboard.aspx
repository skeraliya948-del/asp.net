<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Dashboard.aspx.cs" Inherits="Database_Connectivity.admin_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
    <style>
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            margin-bottom: 25px;
        }

        .header h1 {
            font-size: 28px;
            font-family: 'Playfair Display', serif;
            color: #3E2723;
            margin-bottom: 4px;
            font-weight: 700;
        }

        .header p {
            color: #786C68;
            font-size: 14px;
            margin: 0;
        }

        .date {
            background: #ffffff;
            border: 1px solid #F3D9E2;
            padding: 10px 18px;
            border-radius: 12px;
            font-size: 13px;
            color: #5D4037;
            font-weight: 600;
            box-shadow: 0 4px 12px rgba(183, 110, 121, 0.08);
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .welcome {
            padding: 30px;
            border-radius: 20px;
            background: linear-gradient(135deg, #E91E63 0%, #C2185B 50%, #3E2723 100%);
            color: #ffffff;
            margin-bottom: 25px;
            box-shadow: 0 12px 30px rgba(233, 30, 99, 0.25);
        }

        .welcome h2 {
            font-size: 24px;
            font-family: 'Playfair Display', serif;
            color: #ffffff;
            margin-bottom: 8px;
            font-weight: 700;
        }

        .welcome p {
            font-size: 14px;
            color: #FFF0F5;
            line-height: 1.6;
            margin: 0;
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 20px;
            margin-bottom: 28px;
        }

        .stat-card {
            background: #ffffff;
            border: 1px solid #F3D9E2;
            padding: 24px;
            border-radius: 18px;
            box-shadow: 0 10px 25px rgba(183, 110, 121, 0.08);
            transition: all 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            border-color: #E91E63;
            box-shadow: 0 16px 35px rgba(233, 30, 99, 0.16);
        }

        .stat-title {
            color: #786C68;
            font-size: 13px;
            font-weight: 600;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .stat-title i {
            font-size: 18px;
            padding: 10px;
            border-radius: 10px;
            background: #FFF0F5;
            color: #E91E63;
        }

        .stat-number {
            display: block;
            font-size: 32px;
            font-weight: 800;
            margin: 18px 0 6px;
            color: #3E2723;
            font-family: 'Playfair Display', serif;
            overflow-wrap: anywhere;
        }

        .stat-desc {
            color: #8D6E63;
            font-size: 12px;
        }

        .content-grid {
            display: grid;
            grid-template-columns: 1.6fr 1fr;
            gap: 22px;
            margin-bottom: 24px;
        }

        .panel {
            background: #ffffff;
            border: 1px solid #F3D9E2;
            border-radius: 18px;
            padding: 26px;
            min-width: 0;
            box-shadow: 0 10px 25px rgba(183, 110, 121, 0.08);
        }

        .panel h3 {
            font-size: 18px;
            font-family: 'Playfair Display', serif;
            color: #3E2723;
            margin-bottom: 4px;
            font-weight: 700;
        }

        .panel-subtitle {
            color: #786C68;
            font-size: 13px;
            margin-bottom: 22px;
        }

        .chart-row {
            display: flex;
            align-items: center;
            gap: 14px;
            margin-bottom: 18px;
        }

        .chart-month {
            width: 75px;
            color: #5D4037;
            font-size: 12px;
            font-weight: 600;
            flex-shrink: 0;
        }

        .chart-track {
            flex: 1;
            background: #F7EFE8;
            height: 12px;
            border-radius: 20px;
            overflow: hidden;
        }

        .chart-fill {
            height: 100%;
            border-radius: 20px;
            background: linear-gradient(90deg, #E91E63, #B76E79);
        }

        .chart-amount {
            width: 90px;
            text-align: right;
            font-size: 12px;
            font-weight: 600;
            color: #3E2723;
        }

        .status-row {
            margin-bottom: 18px;
        }

        .status-head {
            display: flex;
            justify-content: space-between;
            font-size: 13px;
            font-weight: 600;
            color: #5D4037;
            margin-bottom: 8px;
        }

        .status-track {
            background: #F7EFE8;
            height: 10px;
            border-radius: 20px;
            overflow: hidden;
        }

        .status-fill {
            height: 100%;
            background: linear-gradient(90deg, #B76E79, #E91E63);
            border-radius: 20px;
        }

        .table-wrap {
            overflow-x: auto;
        }

        .order-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
            color: #2D2424;
        }

        .order-table th {
            background: #FFF0F5;
            color: #3E2723;
            padding: 12px 14px;
            text-align: left;
            font-weight: 700;
            white-space: nowrap;
            border-bottom: 2px solid #F8BBD0;
        }

        .order-table td {
            padding: 13px 14px;
            border-bottom: 1px solid #F7EFE8;
            white-space: nowrap;
        }

        .order-table tr:hover td {
            background: #FDE8EF;
        }

        .order-table a {
            color: #E91E63;
            font-weight: 600;
            text-decoration: none;
        }

        .quick-link {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 15px 18px;
            margin-bottom: 12px;
            border: 1px solid #F3D9E2;
            border-radius: 12px;
            color: #3E2723;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            background: #FFFDF9;
            transition: all 0.3s ease;
        }

        .quick-link:hover {
            background: #FFF0F5;
            border-color: #E91E63;
            color: #E91E63;
            transform: translateX(4px);
        }

        .quick-link i {
            color: #E91E63;
            font-size: 18px;
        }

        .mini-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin-top: 18px;
        }

        .mini-card {
            background: #FFFDF9;
            border: 1px solid #F3D9E2;
            border-radius: 12px;
            padding: 18px;
        }

        .mini-card p {
            color: #786C68;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .mini-card strong {
            font-size: 24px;
            font-family: 'Playfair Display', serif;
            color: #3E2723;
        }

        @media (max-width: 1100px) {
            .stats {
                grid-template-columns: repeat(2, 1fr);
            }

            .content-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 600px) {
            .stats {
                grid-template-columns: 1fr;
            }

            .header {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminContent" runat="server">
    <!-- Header Overview -->
    <asp:Panel ID="pnlHeader" runat="server" CssClass="header">
        <div>
            <h1>Dashboard Overview</h1>
            <p>Welcome to your SweetDelights bakery management portal.</p>
        </div>

        <div class="date">
            <i class="fa-regular fa-calendar text-danger"></i>
            <asp:Label ID="lblDate" runat="server" Text="Active Session"></asp:Label>
        </div>
    </asp:Panel>

    <!-- Welcome Card -->
    <asp:Panel ID="pnlWelcome" runat="server" CssClass="welcome">
        <h2>Welcome Back, Admin! 👋</h2>
        <p>Track your bakery performance, manage orders, monitor store inventory, and review customer revenue insights.</p>
    </asp:Panel>

    <!-- 4 Stats Cards -->
    <div class="stats">
        <asp:Panel ID="pnlRevenue" runat="server" CssClass="stat-card">
            <div class="stat-title">
                Total Revenue
                <i class="fa-solid fa-indian-rupee-sign"></i>
            </div>
            <div class="d-flex align-items-baseline">
                <span class="fs-4 fw-bold text-danger me-1"><i class="fa-solid fa-indian-rupee-sign"></i></span>
                <asp:Label ID="lblRevenue" runat="server" Text="0" CssClass="stat-number my-2"></asp:Label>
            </div>
            <div class="stat-desc">Revenue from completed orders</div>
        </asp:Panel>

        <asp:Panel ID="pnlOrders" runat="server" CssClass="stat-card">
            <div class="stat-title">
                Total Orders
                <i class="fa-solid fa-cart-shopping"></i>
            </div>
            <asp:Label ID="lblOrders" runat="server" Text="0" CssClass="stat-number"></asp:Label>
            <div class="stat-desc">Customer bakery orders placed</div>
        </asp:Panel>

        <asp:Panel ID="pnlUsers" runat="server" CssClass="stat-card">
            <div class="stat-title">
                Total Users / Employees
                <i class="fa-solid fa-users"></i>
            </div>
            <asp:Label ID="lblUsers" runat="server" Text="0" CssClass="stat-number"></asp:Label>
            <div class="stat-desc">Registered users & staff</div>
        </asp:Panel>

        <asp:Panel ID="pnlProducts" runat="server" CssClass="stat-card">
            <div class="stat-title">
                Total Products
                <i class="fa-solid fa-box-open"></i>
            </div>
            <asp:Label ID="lblProducts" runat="server" Text="0" CssClass="stat-number"></asp:Label>
            <div class="stat-desc">Active cakes & desserts catalog</div>
        </asp:Panel>
    </div>

    <!-- Charts & Analytics Row -->
    <div class="content-grid" id="reports">
        <asp:Panel ID="pnlRevenueChart" runat="server" CssClass="panel">
            <h3>Revenue Analytics</h3>
            <p class="panel-subtitle">Monthly sales performance summary</p>

            <asp:Repeater ID="rptRevenue" runat="server">
                <ItemTemplate>
                    <div class="chart-row">
                        <div class="chart-month"><%# Eval("Month") %></div>
                        <div class="chart-track">
                            <div class="chart-fill" style='<%# "width:" + Eval("Percentage") + "%;" %>'></div>
                        </div>
                        <div class="chart-amount"><i class="fa-solid fa-indian-rupee-sign me-1"></i><%# Eval("Revenue", "{0:N0}") %></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <!-- Visual fallback if repeater is not bound -->
            <div class="chart-row">
                <div class="chart-month">Jan - Feb</div>
                <div class="chart-track"><div class="chart-fill" style="width: 45%;"></div></div>
                <div class="chart-amount"><i class="fa-solid fa-indian-rupee-sign me-1"></i>42,500</div>
            </div>
            <div class="chart-row">
                <div class="chart-month">Mar - Apr</div>
                <div class="chart-track"><div class="chart-fill" style="width: 68%;"></div></div>
                <div class="chart-amount"><i class="fa-solid fa-indian-rupee-sign me-1"></i>68,200</div>
            </div>
            <div class="chart-row">
                <div class="chart-month">May - Jun</div>
                <div class="chart-track"><div class="chart-fill" style="width: 85%;"></div></div>
                <div class="chart-amount"><i class="fa-solid fa-indian-rupee-sign me-1"></i>94,800</div>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlOrderChart" runat="server" CssClass="panel">
            <h3>Order Status Overview</h3>
            <p class="panel-subtitle">Distribution of customer orders</p>

            <asp:Repeater ID="rptStatus" runat="server">
                <ItemTemplate>
                    <div class="status-row">
                        <div class="status-head">
                            <span><%# Eval("Status") %></span>
                            <span><%# Eval("Count") %></span>
                        </div>
                        <div class="status-track">
                            <div class="status-fill" style='<%# "width:" + Eval("Percentage") + "%;" %>'></div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <!-- Visual fallback if repeater is not bound -->
            <div class="status-row">
                <div class="status-head"><span>Delivered</span><span>78%</span></div>
                <div class="status-track"><div class="status-fill" style="width: 78%;"></div></div>
            </div>
            <div class="status-row">
                <div class="status-head"><span>Processing</span><span>15%</span></div>
                <div class="status-track"><div class="status-fill" style="width: 15%; background: linear-gradient(90deg, #F06292, #E91E63);"></div></div>
            </div>
            <div class="status-row">
                <div class="status-head"><span>Pending</span><span>7%</span></div>
                <div class="status-track"><div class="status-fill" style="width: 7%; background: linear-gradient(90deg, #D4AF37, #8D6E63);"></div></div>
            </div>
        </asp:Panel>
    </div>

    <!-- Recent Orders & Quick Actions Row -->
    <div class="content-grid" id="recent">
        <asp:Panel ID="pnlRecentOrders" runat="server" CssClass="panel">
            <h3>Recent Orders</h3>
            <p class="panel-subtitle">Latest customer purchases</p>

            <div class="table-wrap">
                <asp:GridView ID="GridView1" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="order-table"
                    GridLines="None"
                    EmptyDataText="No Recent Orders Found">
                    <Columns>
                        <asp:HyperLinkField
                            HeaderText="Order No"
                            DataTextField="Order_No"
                            DataNavigateUrlFields="Order_No"
                            DataNavigateUrlFormatString="Admin_Orders.aspx?orderno={0}" />

                        <asp:BoundField DataField="Name" HeaderText="Customer" />
                        <asp:TemplateField HeaderText="Amount">
                            <ItemTemplate>
                                <span class="fw-bold text-dark"><i class="fa-solid fa-indian-rupee-sign text-danger me-1"></i><%# Eval("Amount", "{0:N2}") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Pay_Status" HeaderText="Payment" />
                        <asp:BoundField DataField="Order_Status" HeaderText="Status" />
                    </Columns>
                </asp:GridView>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlQuickActions" runat="server" CssClass="panel">
            <h3>Quick Actions</h3>
            <p class="panel-subtitle">Manage store operations</p>

            <asp:HyperLink ID="hlManageOrders" runat="server"
                NavigateUrl="~/Admin_Orders.aspx"
                CssClass="quick-link">
                <i class="fa-solid fa-cart-shopping"></i> Manage Orders
            </asp:HyperLink>

            <asp:HyperLink ID="hlSalesReport" runat="server"
                NavigateUrl="#reports"
                CssClass="quick-link">
                <i class="fa-solid fa-chart-column"></i> View Sales Reports
            </asp:HyperLink>

            <asp:HyperLink ID="hlRecentOrders" runat="server"
                NavigateUrl="#recent"
                CssClass="quick-link">
                <i class="fa-solid fa-clock-rotate-left"></i> Recent Orders
            </asp:HyperLink>

            <div class="mini-grid">
                <asp:Panel ID="pnlPending" runat="server" CssClass="mini-card">
                    <p>Pending Orders</p>
                    <strong><asp:Label ID="lblPending" runat="server" Text="0"></asp:Label></strong>
                </asp:Panel>

                <asp:Panel ID="pnlItems" runat="server" CssClass="mini-card">
                    <p>Catalog Items</p>
                    <strong><asp:Label ID="lblItemsSold" runat="server" Text="0"></asp:Label></strong>
                </asp:Panel>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
