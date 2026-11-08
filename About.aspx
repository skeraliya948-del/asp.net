<%@ Page Title="Our Story" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SweetDelights.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .about-chef-card {
            background: white;
            border-radius: 18px;
            overflow: hidden;
            border: 1px solid #F3D9E2;
            box-shadow: 0 8px 24px rgba(183, 110, 121, 0.08);
            transition: all 0.3s ease;
            text-align: center;
        }
        .about-chef-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 16px 36px rgba(183, 110, 121, 0.18);
            border-color: #E91E63;
        }
        .about-chef-img {
            width: 100%;
            height: 280px;
            object-fit: cover;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header Banner -->
    <div class="py-5 text-center" style="background: radial-gradient(circle, #FFF0F5 0%, #FCE4EC 100%); border-bottom: 1px solid #F8BBD0;">
        <div class="container">
            <span class="sd-section-subtitle">Since 2018</span>
            <h1 class="display-4 font-serif text-dark mb-3">The SweetDelights Story</h1>
            <p class="lead text-muted mx-auto" style="max-width: 680px;">
                Where old-world European patisserie techniques meet heartwarming celebration designs.
            </p>
        </div>
    </div>

    <!-- Story Content Section -->
    <section class="py-5">
        <div class="container">
            <div class="row align-items-center g-5">
                <div class="col-lg-6">
                    <img src="https://images.unsplash.com/photo-1556910103-1c02745aae4d?auto=format&fit=crop&w=800&q=80" alt="Baking in Kitchen" class="img-fluid rounded-4 shadow-lg border border-3 border-white" />
                </div>
                <div class="col-lg-6">
                    <span class="badge bg-pink-light text-danger px-3 py-2 rounded-pill mb-2">OUR PHILOSOPHY</span>
                    <h2 class="font-serif mb-3">Pure Butter, Real Berries & Infinite Passion</h2>
                    <p class="text-muted">
                        SweetDelights began with a small kitchen mixer and an unwavering belief: that desserts shouldn't just look breathtaking on an Instagram feed — they must melt on your tongue with rich, unforgettable flavour.
                    </p>
                    <p class="text-muted">
                        We refuse to use artificial cake mixes or chemical shortening. Every sponge is whipped from scratch at dawn using unbleached wheat flour, cultured European butter, real bourbon vanilla pods from Madagascar, and single-origin Belgian chocolate.
                    </p>
                    <div class="row g-3 mt-4 pt-3 border-top">
                        <div class="col-sm-6">
                            <div class="d-flex align-items-center gap-3">
                                <i class="bi bi-award-fill text-danger fs-1"></i>
                                <div>
                                    <h5 class="mb-0 fw-bold">Bakery of the Year</h5>
                                    <small class="text-muted">Valley Culinary Guild 2024</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="d-flex align-items-center gap-3">
                                <i class="bi bi-shield-check text-success fs-1"></i>
                                <div>
                                    <h5 class="mb-0 fw-bold">100% Certified</h5>
                                    <small class="text-muted">Hygiene & Safety Gold Star</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Master Chefs -->
    <section class="py-5" style="background-color: #FFF9F7;">
        <div class="container">
            <div class="sd-section-header">
                <span class="sd-section-subtitle">Crafted with Skill</span>
                <h2 class="sd-section-title">Meet Our Master Pastry Chefs</h2>
                <div class="sd-section-divider">
                    <span></span>
                    <i class="fa-solid fa-cake-candles"></i>
                    <span></span>
                </div>
            </div>

            <div class="row g-4">
                <div class="col-lg-4 col-md-6">
                    <div class="about-chef-card">
                        <img src="https://images.unsplash.com/photo-1577219491135-ce391730fb2c?auto=format&fit=crop&w=500&q=80" alt="Chef Monique" class="about-chef-img" />
                        <div class="p-4">
                            <h4 class="fw-bold mb-1">Chef Monique Laurent</h4>
                            <span class="text-danger fw-semibold d-block mb-3">Head Chocolatier & Founder</span>
                            <p class="text-muted small">Trained at Le Cordon Bleu in Paris with 15+ years of chocolate tempering and wedding cake artistry experience.</p>
                            <div class="d-flex justify-content-center gap-2">
                                <a href="#" class="sd-social-btn" style="background:#5D4037;"><i class="bi bi-instagram"></i></a>
                                <a href="#" class="sd-social-btn" style="background:#5D4037;"><i class="bi bi-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="about-chef-card">
                        <img src="https://images.unsplash.com/photo-1583394838336-acd977736f90?auto=format&fit=crop&w=500&q=80" alt="Chef Alex Vance" class="about-chef-img" />
                        <div class="p-4">
                            <h4 class="fw-bold mb-1">Chef Alex Vance</h4>
                            <span class="text-danger fw-semibold d-block mb-3">Master Sculptor & Sugar Artist</span>
                            <p class="text-muted small">Pioneer of gravity-defying fondant structures and exquisite hand-piped sugar flowers for celebration cakes.</p>
                            <div class="d-flex justify-content-center gap-2">
                                <a href="#" class="sd-social-btn" style="background:#5D4037;"><i class="bi bi-instagram"></i></a>
                                <a href="#" class="sd-social-btn" style="background:#5D4037;"><i class="bi bi-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="about-chef-card">
                        <img src="https://images.unsplash.com/photo-1581299894007-aaa50297cf16?auto=format&fit=crop&w=500&q=80" alt="Chef Elena Rostova" class="about-chef-img" />
                        <div class="p-4">
                            <h4 class="fw-bold mb-1">Chef Elena Rostova</h4>
                            <span class="text-danger fw-semibold d-block mb-3">Specialist in Eggless & Vegan Patisserie</span>
                            <p class="text-muted small">Passionate about formulating plant-based and eggless recipes that rival traditional European classics in tenderness.</p>
                            <div class="d-flex justify-content-center gap-2">
                                <a href="#" class="sd-social-btn" style="background:#5D4037;"><i class="bi bi-instagram"></i></a>
                                <a href="#" class="sd-social-btn" style="background:#5D4037;"><i class="bi bi-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
