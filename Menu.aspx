<%@ Page Title="Bakery Menu" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="SweetDelights.Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .menu-hero {
            background: linear-gradient(rgba(62, 39, 35, 0.7), rgba(62, 39, 35, 0.7)), url('https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=1600&q=80') center/cover no-repeat;
            padding: 70px 0;
            color: white;
            text-align: center;
            border-bottom: 3px solid #E91E63;
        }
        .menu-item-row {
            background: white;
            border-radius: 16px;
            border: 1px solid #F3D9E2;
            padding: 16px 20px;
            margin-bottom: 16px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(183, 110, 121, 0.06);
        }
        .menu-item-row:hover {
            transform: translateX(6px);
            border-color: #E91E63;
            box-shadow: 0 8px 25px rgba(233, 30, 99, 0.12);
        }
        .menu-item-img {
            width: 90px;
            height: 90px;
            object-fit: cover;
            border-radius: 12px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Menu Hero -->
    <div class="menu-hero">
        <div class="container">
            <span class="sd-section-subtitle" style="color: #F8BBD0;">Handcrafted Confections</span>
            <h1 class="display-5 text-white font-serif mb-2">Our Artisanal Bakery Menu</h1>
            <p class="lead text-light mb-0 mx-auto" style="max-width: 650px;">
                Explore our full line of scratch-baked desserts, gourmet chocolates, seasonal fruit tarts, and celebration showstoppers.
            </p>
        </div>
    </div>

    <!-- Filter & Search Toolbar -->
    <div class="container my-5">
        <div class="card p-3 p-md-4 rounded-4 border-pink shadow-sm mb-4">
            <div class="row g-3 align-items-center">
                <div class="col-lg-4 col-md-6">
                    <div class="input-group">
                        <span class="input-group-text bg-white border-end-0 text-danger"><i class="bi bi-search"></i></span>
                        <input type="text" class="form-control border-start-0 sd-search-box" placeholder="Search menu items (e.g. chocolate, cheesecake)..." />
                    </div>
                </div>
                <div class="col-lg-8 col-md-6">
                    <div class="d-flex flex-wrap gap-2 justify-content-md-end">
                        <button type="button" class="btn btn-sd-primary sd-filter-btn active" data-filter="all">All Items</button>
                        <button type="button" class="btn btn-sd-outline sd-filter-btn" data-filter="cakes">Cakes</button>
                        <button type="button" class="btn btn-sd-outline sd-filter-btn" data-filter="cupcakes">Cupcakes</button>
                        <button type="button" class="btn btn-sd-outline sd-filter-btn" data-filter="cheesecake">Cheesecakes</button>
                        <button type="button" class="btn btn-sd-outline sd-filter-btn" data-filter="brownies">Brownies</button>
                        <button type="button" class="btn btn-sd-outline sd-filter-btn" data-filter="macarons">Macarons</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Menu Items List -->
        <div class="row g-3">
            <!-- Item 1 -->
            <div class="col-lg-6 sd-filterable-item" data-category="cakes">
                <div class="menu-item-row d-flex align-items-center gap-3">
                    <img src="https://images.unsplash.com/photo-1588195538326-c5b1e9f80a1b?auto=format&fit=crop&w=200&q=80" alt="Belgian Truffle" class="menu-item-img" />
                    <div class="flex-grow-1">
                        <div class="d-flex justify-content-between align-items-start">
                            <h5 class="sd-product-title mb-1">Belgian Chocolate Truffle</h5>
                            <span class="sd-product-price text-danger fs-5"><i class="fa-solid fa-indian-rupee-sign me-1"></i>349.00</span>
                        </div>
                        <p class="text-muted small mb-2 sd-product-desc">Triple layered dark Belgian sponge with 70% cocoa ganache glaze.</p>
                        <div class="d-flex align-items-center justify-content-between">
                            <span class="badge bg-success-subtle text-success border border-success-subtle"><i class="bi bi-circle-fill" style="font-size:0.4rem;"></i> 100% Eggless</span>
                            <a href="Show_Products.aspx" class="btn btn-sm btn-sd-primary">
                                <i class="bi bi-cart-plus"></i> Order Now
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Item 2 -->
            <div class="col-lg-6 sd-filterable-item" data-category="cakes">
                <div class="menu-item-row d-flex align-items-center gap-3">
                    <img src="https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?auto=format&fit=crop&w=200&q=80" alt="Red Velvet" class="menu-item-img" />
                    <div class="flex-grow-1">
                        <div class="d-flex justify-content-between align-items-start">
                            <h5 class="sd-product-title mb-1">Red Velvet Supreme</h5>
                            <span class="sd-product-price text-danger fs-5"><i class="fa-solid fa-indian-rupee-sign me-1"></i>385.00</span>
                        </div>
                        <p class="text-muted small mb-2 sd-product-desc">Velvety ruby sponge with signature Philadelphia cream cheese frosting.</p>
                        <div class="d-flex align-items-center justify-content-between">
                            <span class="badge bg-danger-subtle text-danger border border-danger-subtle">Chef Signature</span>
                            <a href="Show_Products.aspx" class="btn btn-sm btn-sd-primary">
                                <i class="bi bi-cart-plus"></i> Order Now
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Item 3 -->
            <div class="col-lg-6 sd-filterable-item" data-category="cupcakes">
                <div class="menu-item-row d-flex align-items-center gap-3">
                    <img src="https://images.unsplash.com/photo-1576618148400-f54bed99fcfd?auto=format&fit=crop&w=200&q=80" alt="Pink Blossom Cupcakes" class="menu-item-img" />
                    <div class="flex-grow-1">
                        <div class="d-flex justify-content-between align-items-start">
                            <h5 class="sd-product-title mb-1">Pink Blossom Cupcakes (Set of 6)</h5>
                            <span class="sd-product-price text-danger fs-5"><i class="fa-solid fa-indian-rupee-sign me-1"></i>220.00</span>
                        </div>
                        <p class="text-muted small mb-2 sd-product-desc">Fluffy Madagascar vanilla crumb piped with blush strawberry swirl buttercream.</p>
                        <div class="d-flex align-items-center justify-content-between">
                            <span class="badge bg-pink-light text-danger">Fresh Strawberries</span>
                            <a href="Show_Products.aspx" class="btn btn-sm btn-sd-primary">
                                <i class="bi bi-cart-plus"></i> Order Now
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Item 4 -->
            <div class="col-lg-6 sd-filterable-item" data-category="cheesecake">
                <div class="menu-item-row d-flex align-items-center gap-3">
                    <img src="https://images.unsplash.com/photo-1535141192574-5d4897c13136?auto=format&fit=crop&w=200&q=80" alt="Blueberry Cheesecake" class="menu-item-img" />
                    <div class="flex-grow-1">
                        <div class="d-flex justify-content-between align-items-start">
                            <h5 class="sd-product-title mb-1">Wild Blueberry Cheesecake</h5>
                            <span class="sd-product-price text-danger fs-5"><i class="fa-solid fa-indian-rupee-sign me-1"></i>420.00</span>
                        </div>
                        <p class="text-muted small mb-2 sd-product-desc">Slow-baked New York style cheesecake with buttery graham cracker crust.</p>
                        <div class="d-flex align-items-center justify-content-between">
                            <span class="badge bg-success-subtle text-success border border-success-subtle"><i class="bi bi-circle-fill" style="font-size:0.4rem;"></i> 100% Eggless</span>
                            <a href="Show_Products.aspx" class="btn btn-sm btn-sd-primary">
                                <i class="bi bi-cart-plus"></i> Order Now
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Item 5 -->
            <div class="col-lg-6 sd-filterable-item" data-category="brownies">
                <div class="menu-item-row d-flex align-items-center gap-3">
                    <img src="https://images.unsplash.com/photo-1606313564200-e75d5e30476c?auto=format&fit=crop&w=200&q=80" alt="Fudge Brownies" class="menu-item-img" />
                    <div class="flex-grow-1">
                        <div class="d-flex justify-content-between align-items-start">
                            <h5 class="sd-product-title mb-1">Gourmet Walnut Fudge Brownies (Pack of 4)</h5>
                            <span class="sd-product-price text-danger fs-5"><i class="fa-solid fa-indian-rupee-sign me-1"></i>180.00</span>
                        </div>
                        <p class="text-muted small mb-2 sd-product-desc">Ultra-fudgy, crackly crusted dark chocolate squares loaded with toasted California walnuts.</p>
                        <div class="d-flex align-items-center justify-content-between">
                            <span class="badge bg-warning-subtle text-dark">Warm Served</span>
                            <button type="button" class="btn btn-sm btn-sd-primary btn-add-to-cart" data-product-name="Gourmet Walnut Fudge Brownies">
                                <i class="bi bi-cart-plus"></i> Add to Cart
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Item 6 -->
            <div class="col-lg-6 sd-filterable-item" data-category="macarons">
                <div class="menu-item-row d-flex align-items-center gap-3">
                    <img src="https://images.unsplash.com/photo-1569864358642-9d1684040f43?auto=format&fit=crop&w=200&q=80" alt="Parisian Macaron Gift Box" class="menu-item-img" />
                    <div class="flex-grow-1">
                        <div class="d-flex justify-content-between align-items-start">
                            <h5 class="sd-product-title mb-1">Parisian Macaron Gift Box (12 Pcs)</h5>
                            <span class="sd-product-price text-danger fs-5"><i class="fa-solid fa-indian-rupee-sign me-1"></i>285.00</span>
                        </div>
                        <p class="text-muted small mb-2 sd-product-desc">Assorted French almond meringue shells filled with chocolate, pistachio, raspberry & salted caramel.</p>
                        <div class="d-flex align-items-center justify-content-between">
                            <span class="badge bg-info-subtle text-dark">Gluten Free</span>
                            <button type="button" class="btn btn-sm btn-sd-primary btn-add-to-cart" data-product-name="Parisian Macaron Gift Box">
                                <i class="bi bi-cart-plus"></i> Add to Cart
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
