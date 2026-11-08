<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SweetDelights.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .hero-banner-art {
            max-height: 480px;
            object-fit: cover;
            width: 100%;
            border-radius: 20px;
        }
        .sd-usp-box {
            background: #FFFFFF;
            border-radius: 16px;
            padding: 30px 20px;
            text-align: center;
            border: 1px solid #F3D9E2;
            transition: all 0.3s ease;
        }
        .sd-usp-box:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 35px rgba(233, 30, 99, 0.12);
            border-color: #F8BBD0;
        }
        .sd-usp-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: #FFF0F5;
            color: #E91E63;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            margin: 0 auto 18px;
            transition: all 0.3s ease;
        }
        .sd-usp-box:hover .sd-usp-icon {
            background: #E91E63;
            color: #FFFFFF;
            transform: scale(1.1);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Hero Section -->
    <section class="sd-hero">
        <div class="container">
            <div class="row align-items-center g-5">
                <div class="col-lg-6">
                    <div class="sd-hero-badge">
                        <i class="fa-solid fa-sparkles text-danger"></i>
                        <span>Artisan Bakery & Patisserie</span>
                    </div>
                    <h1>
                        Baked with <span class="font-script" style="font-size:3.8rem; color:#E91E63;">Passion</span>,<br />
                        Crafted for Pure <span style="color:#B76E79;">Delight</span>.
                    </h1>
                    <p class="lead text-muted mb-4">
                        Indulge in handcrafted cakes, French macarons, fudgy brownies, and decadent cheesecakes made with pure Belgian chocolate, Madagascar vanilla, and organic farm-fresh berries.
                    </p>
                    <div class="d-flex flex-wrap gap-3 mb-5">
                        <a href="Show_Products.aspx" class="btn btn-sd-primary btn-lg">
                            <i class="bi bi-bag-heart"></i> Order Cakes Now
                        </a>
                        <a href="Menu.aspx" class="btn btn-sd-secondary btn-lg">
                            <i class="bi bi-book"></i> View Full Menu
                        </a>
                    </div>
                    <div class="row g-3 pt-3 border-top border-pink">
                        <div class="col-4">
                            <h3 class="mb-0 text-danger fw-bold">100%</h3>
                            <small class="text-muted">Fresh & Eggless Options</small>
                        </div>
                        <div class="col-4">
                            <h3 class="mb-0 text-danger fw-bold">50k+</h3>
                            <small class="text-muted">Happy Sweet Cravings</small>
                        </div>
                        <div class="col-4">
                            <h3 class="mb-0 text-danger fw-bold">4.9 ★</h3>
                            <small class="text-muted">Customer Rating</small>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="sd-hero-img-wrap">
                        <img src="https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=800&q=80" alt="Delicious Berry Cake" class="hero-banner-art" />
                        
                        <!-- Floating Card 1 -->
                        <div class="sd-hero-float-card sd-hero-float-1">
                            <div class="p-2 bg-pink-light rounded-circle text-danger fs-4">
                                <i class="fa-solid fa-crown"></i>
                            </div>
                            <div>
                                <div class="fw-bold text-dark" style="font-size:0.9rem;">Chef's Special</div>
                                <small class="text-muted">Belgian Truffle Cake</small>
                            </div>
                        </div>

                        <!-- Floating Card 2 -->
                        <div class="sd-hero-float-card sd-hero-float-2">
                            <div class="p-2 bg-success-subtle rounded-circle text-success fs-4">
                                <i class="bi bi-truck"></i>
                            </div>
                            <div>
                                <div class="fw-bold text-dark" style="font-size:0.9rem;">Same Day Delivery</div>
                                <small class="text-muted">Within 2 Hours in Valley</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Popular Categories -->
    <section class="py-5">
        <div class="container">
            <div class="sd-section-header">
                <span class="sd-section-subtitle">Sweet Selections</span>
                <h2 class="sd-section-title">Explore by Category</h2>
                <div class="sd-section-divider">
                    <span></span>
                    <i class="fa-solid fa-cake-candles"></i>
                    <span></span>
                </div>
            </div>

            <div class="row g-4 justify-content-center">
                <div class="col-6 col-md-4 col-lg-2">
                    <a href="Show_Products.aspx?cat=cakes" class="sd-cat-card d-block text-decoration-none">
                        <div class="sd-cat-icon">
                            <i class="fa-solid fa-cake-candles"></i>
                        </div>
                        <h6 class="fw-bold mb-1">Cakes</h6>
                        <small class="text-muted">45+ Varieties</small>
                    </a>
                </div>

                <div class="col-6 col-md-4 col-lg-2">
                    <a href="Show_Products.aspx?cat=cupcakes" class="sd-cat-card d-block text-decoration-none">
                        <div class="sd-cat-icon">
                            <i class="fa-solid fa-cookie"></i>
                        </div>
                        <h6 class="fw-bold mb-1">Cupcakes</h6>
                        <small class="text-muted">20+ Flavors</small>
                    </a>
                </div>

                <div class="col-6 col-md-4 col-lg-2">
                    <a href="Show_Products.aspx?cat=brownies" class="sd-cat-card d-block text-decoration-none">
                        <div class="sd-cat-icon">
                            <i class="fa-solid fa-square"></i>
                        </div>
                        <h6 class="fw-bold mb-1">Brownies</h6>
                        <small class="text-muted">Fudge & Walnut</small>
                    </a>
                </div>

                <div class="col-6 col-md-4 col-lg-2">
                    <a href="Show_Products.aspx?cat=cheesecake" class="sd-cat-card d-block text-decoration-none">
                        <div class="sd-cat-icon">
                            <i class="fa-solid fa-cheese"></i>
                        </div>
                        <h6 class="fw-bold mb-1">Cheesecake</h6>
                        <small class="text-muted">New York Style</small>
                    </a>
                </div>

                <div class="col-6 col-md-4 col-lg-2">
                    <a href="Show_Products.aspx?cat=macarons" class="sd-cat-card d-block text-decoration-none">
                        <div class="sd-cat-icon">
                            <i class="fa-solid fa-circle-dot"></i>
                        </div>
                        <h6 class="fw-bold mb-1">Macarons</h6>
                        <small class="text-muted">French Box</small>
                    </a>
                </div>

                <div class="col-6 col-md-4 col-lg-2">
                    <a href="Insert.aspx" class="sd-cat-card d-block text-decoration-none">
                        <div class="sd-cat-icon">
                            <i class="fa-solid fa-wand-magic-sparkles"></i>
                        </div>
                        <h6 class="fw-bold mb-1">Custom Cake</h6>
                        <small class="text-muted">Design Your Own</small>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Featured Bestsellers -->
    <section class="py-5" style="background-color: #FFF6F8;">
        <div class="container">
            <div class="d-flex flex-wrap justify-content-between align-items-end mb-4">
                <div>
                    <span class="sd-section-subtitle text-start">Fresh From The Oven</span>
                    <h2 class="sd-section-title text-start mb-0">Our Signature Bestsellers</h2>
                </div>
                <a href="Show_Products.aspx" class="btn btn-sd-outline mt-3 mt-md-0">
                    View All Cakes <i class="bi bi-arrow-right"></i>
                </a>
            </div>

            <div class="row g-4">
                <!-- Product 1 -->
                <div class="col-lg-3 col-md-6">
                    <div class="sd-product-card">
                        <span class="sd-badge-pill">Bestseller</span>
                        <span class="sd-badge-eggless"><i class="bi bi-circle-fill" style="font-size:0.5rem;"></i> Eggless</span>
                        <div class="sd-product-img-wrap">
                            <img src="https://images.unsplash.com/photo-1588195538326-c5b1e9f80a1b?auto=format&fit=crop&w=600&q=80" alt="Belgian Dark Chocolate Cake" />
                        </div>
                        <div class="sd-product-body">
                            <div class="sd-product-cat">Artisan Cakes</div>
                            <h5 class="sd-product-title">Belgian Chocolate Truffle</h5>
                            <div class="sd-rating">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <span class="sd-rating-count">(142)</span>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mt-auto pt-3 border-top">
                                <div>
                                    <span class="sd-product-price"><i class="fa-solid fa-indian-rupee-sign me-1"></i>349.00</span>
                                    <span class="sd-price-old"><i class="fa-solid fa-indian-rupee-sign me-1"></i>399.00</span>
                                </div>
                                <a href="Show_Products.aspx" class="btn btn-sm btn-sd-primary">
                                    <i class="bi bi-cart-plus"></i> Order
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product 2 -->
                <div class="col-lg-3 col-md-6">
                    <div class="sd-product-card">
                        <span class="sd-badge-pill" style="background:#E91E63;">Popular</span>
                        <div class="sd-product-img-wrap">
                            <img src="https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?auto=format&fit=crop&w=600&q=80" alt="Red Velvet Romance" />
                        </div>
                        <div class="sd-product-body">
                            <div class="sd-product-cat">Celebration Cakes</div>
                            <h5 class="sd-product-title">Red Velvet Cream Cheese</h5>
                            <div class="sd-rating">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-half"></i>
                                <span class="sd-rating-count">(98)</span>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mt-auto pt-3 border-top">
                                <div>
                                    <span class="sd-product-price"><i class="fa-solid fa-indian-rupee-sign me-1"></i>385.00</span>
                                </div>
                                <a href="Show_Products.aspx" class="btn btn-sm btn-sd-primary">
                                    <i class="bi bi-cart-plus"></i> Order
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product 3 -->
                <div class="col-lg-3 col-md-6">
                    <div class="sd-product-card">
                        <span class="sd-badge-eggless"><i class="bi bi-circle-fill" style="font-size:0.5rem;"></i> Eggless</span>
                        <div class="sd-product-img-wrap">
                            <img src="https://images.unsplash.com/photo-1535141192574-5d4897c13136?auto=format&fit=crop&w=600&q=80" alt="New York Cheesecake" />
                        </div>
                        <div class="sd-product-body">
                            <div class="sd-product-cat">Cheesecakes</div>
                            <h5 class="sd-product-title">Wild Blueberry Cheesecake</h5>
                            <div class="sd-rating">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <span class="sd-rating-count">(215)</span>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mt-auto pt-3 border-top">
                                <div>
                                    <span class="sd-product-price"><i class="fa-solid fa-indian-rupee-sign me-1"></i>420.00</span>
                                    <span class="sd-price-old"><i class="fa-solid fa-indian-rupee-sign me-1"></i>460.00</span>
                                </div>
                                <a href="Show_Products.aspx" class="btn btn-sm btn-sd-primary">
                                    <i class="bi bi-cart-plus"></i> Order
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product 4 -->
                <div class="col-lg-3 col-md-6">
                    <div class="sd-product-card">
                        <span class="sd-badge-pill" style="background:#5D4037;">Box of 6</span>
                        <div class="sd-product-img-wrap">
                            <img src="https://images.unsplash.com/photo-1576618148400-f54bed99fcfd?auto=format&fit=crop&w=600&q=80" alt="Assorted Blossom Cupcakes" />
                        </div>
                        <div class="sd-product-body">
                            <div class="sd-product-cat">Cupcakes</div>
                            <h5 class="sd-product-title">Blossom Cupcakes Box</h5>
                            <div class="sd-rating">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <span class="sd-rating-count">(88)</span>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mt-auto pt-3 border-top">
                                <div>
                                    <span class="sd-product-price"><i class="fa-solid fa-indian-rupee-sign me-1"></i>220.00</span>
                                </div>
                                <a href="Show_Products.aspx" class="btn btn-sm btn-sd-primary">
                                    <i class="bi bi-cart-plus"></i> Order
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Why Choose SweetDelights (USPs) -->
    <section class="py-5">
        <div class="container">
            <div class="sd-section-header">
                <span class="sd-section-subtitle">Our Promise</span>
                <h2 class="sd-section-title">Why SweetDelights?</h2>
                <div class="sd-section-divider">
                    <span></span>
                    <i class="fa-solid fa-heart"></i>
                    <span></span>
                </div>
            </div>

            <div class="row g-4">
                <div class="col-md-6 col-lg-3">
                    <div class="sd-usp-box">
                        <div class="sd-usp-icon">
                            <i class="fa-solid fa-clock-rotate-left"></i>
                        </div>
                        <h5 class="fw-bold mb-2">Baked Fresh Daily</h5>
                        <p class="text-muted small mb-0">Every dessert is baked the morning of delivery, ensuring peak freshness, aroma, and soft texture.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3">
                    <div class="sd-usp-box">
                        <div class="sd-usp-icon">
                            <i class="fa-solid fa-seedling"></i>
                        </div>
                        <h5 class="fw-bold mb-2">100% Organic Butter</h5>
                        <p class="text-muted small mb-0">No artificial preservatives or trans fats. Only pure butter, Belgian cocoa, and farm eggs.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3">
                    <div class="sd-usp-box">
                        <div class="sd-usp-icon">
                            <i class="fa-solid fa-cake-candles"></i>
                        </div>
                        <h5 class="fw-bold mb-2">Custom Designs</h5>
                        <p class="text-muted small mb-0">From dreamy tiered wedding cakes to playful birthday themes, our master decorators craft your dream cake.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3">
                    <div class="sd-usp-box">
                        <div class="sd-usp-icon">
                            <i class="fa-solid fa-van-shuttle"></i>
                        </div>
                        <h5 class="fw-bold mb-2">Express Temperature Care</h5>
                        <p class="text-muted small mb-0">Delivered in temperature-controlled refrigerated vehicles so your icing stays immaculate.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Special Cake of the Month Banner -->
    <section class="py-5" style="background: linear-gradient(135deg, #3E2723 0%, #251612 100%); color: white;">
        <div class="container">
            <div class="row align-items-center g-4">
                <div class="col-lg-5 text-center">
                    <img src="https://images.unsplash.com/photo-1542826438-bd32f43d626f?auto=format&fit=crop&w=650&q=80" alt="Rose Petal Pistachio Tart" class="img-fluid rounded-4 shadow-lg border border-2 border-danger" style="max-height: 380px; object-fit: cover;" />
                </div>
                <div class="col-lg-7">
                    <span class="badge bg-danger px-3 py-2 rounded-pill mb-3">CAKE OF THE MONTH</span>
                    <h2 class="display-6 font-serif text-white mb-3">Persian Rose & Pistachio Velvet Cake</h2>
                    <p class="text-light-50 mb-4" style="color: #E0D0CC;">
                        Infused with real rosewater, crushed Iranian pistachios, and silky mascarpone frosting decorated with edible 24k gold leaf and candied rose petals. Handcrafted in limited batches daily.
                    </p>
                    <div class="d-flex align-items-baseline gap-3 mb-4">
                        <span class="fs-1 fw-bold text-white">$45.00</span>
                        <span class="text-decoration-line-through text-muted fs-4">$55.00</span>
                        <span class="badge bg-success">Save $10</span>
                    </div>
                    <div class="d-flex gap-3">
                        <a href="View_Details.aspx?id=101" class="btn btn-sd-primary btn-lg">
                            <i class="bi bi-cart3"></i> Order Limited Edition
                        </a>
                        <a href="Show_Company.aspx" class="btn btn-outline-light btn-lg rounded-pill px-4">
                            Explore Bakeries
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials -->
    <section class="py-5">
        <div class="container">
            <div class="sd-section-header">
                <span class="sd-section-subtitle">Customer Love</span>
                <h2 class="sd-section-title">What Our Guests Say</h2>
                <div class="sd-section-divider">
                    <span></span>
                    <i class="fa-solid fa-quote-right"></i>
                    <span></span>
                </div>
            </div>

            <div class="row g-4">
                <div class="col-md-4">
                    <div class="sd-card p-4 h-100">
                        <div class="d-flex align-items-center gap-1 text-warning mb-3">
                            <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                        </div>
                        <p class="text-muted italic mb-4">
                            "The Belgian Truffle Cake was the centerpiece of my daughter's 18th birthday! Super moist, rich chocolate, and the doorstep delivery was right on the dot!"
                        </p>
                        <div class="d-flex align-items-center gap-3 mt-auto">
                            <img src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=100&q=80" alt="Sophia M." class="rounded-circle" style="width: 50px; height: 50px; object-fit: cover;" />
                            <div>
                                <h6 class="mb-0 fw-bold">Sophia Miller</h6>
                                <small class="text-muted">Verified Customer</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="sd-card p-4 h-100">
                        <div class="d-flex align-items-center gap-1 text-warning mb-3">
                            <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                        </div>
                        <p class="text-muted italic mb-4">
                            "Best eggless desserts in town hands down. Their blueberry cheesecake is creamy without being overly sweet. SweetDelights has earned a lifetime customer!"
                        </p>
                        <div class="d-flex align-items-center gap-3 mt-auto">
                            <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=100&q=80" alt="David R." class="rounded-circle" style="width: 50px; height: 50px; object-fit: cover;" />
                            <div>
                                <h6 class="mb-0 fw-bold">David Reynolds</h6>
                                <small class="text-muted">Food Blogger</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="sd-card p-4 h-100">
                        <div class="d-flex align-items-center gap-1 text-warning mb-3">
                            <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                        </div>
                        <p class="text-muted italic mb-4">
                            "Ordered custom cupcakes for our corporate anniversary event. The brand colors were matched perfectly, and everyone raved about the raspberry buttercream!"
                        </p>
                        <div class="d-flex align-items-center gap-3 mt-auto">
                            <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=100&q=80" alt="Jessica T." class="rounded-circle" style="width: 50px; height: 50px; object-fit: cover;" />
                            <div>
                                <h6 class="mb-0 fw-bold">Jessica Taylor</h6>
                                <small class="text-muted">Event Planner</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
