# 🧁 SweetDelights – Cakes & Desserts E-Commerce Website

A premium, modern, responsive frontend UI design for **SweetDelights**, an artisanal cake and dessert online bakery built with **ASP.NET Web Forms**, HTML5, CSS3, Bootstrap 5.3, and JavaScript.

---

## 🎨 Theme & Branding Palette
- **Primary Colors:** Pastel Pink (`#F8BBD0`, `#FCE4EC`), Blush Pink (`#F06292`, `#E91E63`), Cream (`#FFFDF9`, `#F7EDE2`), Pure White (`#FFFFFF`)
- **Accent Colors:** Belgian Chocolate Brown (`#3E2723`, `#5D4037`), Soft Rose Gold (`#B76E79`, `#C57D5D`), Warm Gold (`#D4AF37`)
- **Typography:**
  - Headings: *Playfair Display* & *Great Vibes* (Google Fonts)
  - Body & UI: *Poppins* (Google Fonts)
- **Aesthetic Elements:** Rounded cards, gentle pastel drop shadows, floating badges, smooth hover animations, interactive cart calculations, and responsive mobile layouts.

---

## 📂 Project Structure & Pages

```
d:\asp.net(pb)\
│
├── Web.config                     # Standard ASP.NET configuration
├── SweetDelights.sln              # Visual Studio Solution file
├── SweetDelights.csproj           # Visual Studio Project file
├── README.md                      # Documentation & Guide
│
├── Site.Master                    # Customer-facing Master Page (Header, Nav, Footer)
├── Site.Master.cs
├── Admin.Master                   # Admin Master Page (Sidebar, Topbar, Admin Footer)
├── Admin.Master.cs
│
├── css\
│   └── sweetdelights.css          # Custom bakery CSS styles, variables & animations
│
├── js\
│   └── sweetdelights.js           # Client-side interactivity (Cart totals, filters, toasts)
│
├── Default.aspx                   # 🏠 Home Page (Hero, Categories, Bestsellers, USPs)
├── Default.aspx.cs
├── Menu.aspx                      # 📋 Full Bakery Menu with live category filters
├── Menu.aspx.cs
├── About.aspx                     # 📖 Our Story, Master Pastry Chefs, Kitchen Standards
├── About.aspx.cs
├── Contact.aspx                   # 💌 Contact Boutique, Custom Cake Inquiry, FAQs
├── Contact.aspx.cs
├── Login.aspx                     # 🔑 Dual Sign-In & Create Account tabs
├── Login.aspx.cs
├── Show_Company.aspx              # 🏪 Partner Bakeries & Brands directory
├── Show_Company.aspx.cs
├── Show_Products.aspx             # 🎂 Product Catalog with Category & Price Filters
├── Show_Products.aspx.cs
├── View_Details.aspx              # 🔍 Product Details, Gallery, Weight Selector, Cake Message
├── View_Details.aspx.cs
├── Add_to_Cart.aspx               # 🛒 Interactive Shopping Cart with Promo 'SWEET15'
├── Add_to_Cart.aspx.cs
├── My_Orders.aspx                 # 📦 Order History & Live Chilled Van Tracking Bar
├── My_Orders.aspx.cs
│
├── Admin_Dashboard.aspx           # 📊 Executive Analytics Dashboard, Revenue Chart, KPIs
├── Admin_Dashboard.aspx.cs
├── Add_Company.aspx               # ➕ Onboard Bakery Partner Form
├── Add_Company.aspx.cs
├── Add_Product.aspx               # ➕ Create New Cake/Dessert Listing Form
├── Add_Product.aspx.cs
├── Admin_Orders.aspx              # 📋 Kitchen Dispatch & Fulfillment Order Table
├── Admin_Orders.aspx.cs
└── Insert.aspx                    # 🪄 Universal Record Insert & Custom Cake Intake
    └── Insert.aspx.cs
```

---

## 🚀 How to Run the Project

### Option 1: Visual Studio (Recommended)
1. Double-click `SweetDelights.sln` to open in **Visual Studio 2019 / 2022**.
2. Right-click `Default.aspx` in the Solution Explorer and select **"Set As Start Page"**.
3. Press **F5** or click **"IIS Express (Google Chrome / Edge)"**.
4. The website will launch with full responsiveness and working navigation.

### Option 2: Visual Studio Code with Live Server / IIS
1. Open the folder `d:\asp.net(pb)` in VS Code.
2. If using IIS or IIS Express in VS Code, execute `iisexpress /path:"d:\asp.net(pb)" /port:8080`.
3. Open `http://localhost:8080/Default.aspx` in your browser.

---

## 🧁 Interactive Demo Features Included
- **Promo Voucher:** In the Shopping Cart (`Add_to_Cart.aspx`), type **`SWEET15`** and click **Apply** to instantly receive 15% discount.
- **Dynamic Cart Calculations:** Increment/decrement item quantities (`+` / `-`) or remove items to see line totals, taxes, and grand totals automatically recalculate.
- **Live Search & Category Filter:** In `Show_Products.aspx` and `Menu.aspx`, click category pills (*Cakes, Cupcakes, Cheesecakes, Brownies, Macarons*) or type keywords in the search bar.
- **Visual Order Tracker:** In `My_Orders.aspx`, observe the multi-stage delivery progress tracker (*Placed -> Baking -> Quality Check -> Out for Delivery -> Delivered*).
- **Admin Management:** Visit `Admin_Dashboard.aspx` to inspect bakery metrics, revenue trend bars, recent orders, and quick product onboarding.
