<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SweetDelights.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .contact-info-card {
            background: white;
            border-radius: 18px;
            padding: 28px;
            border: 1px solid #F3D9E2;
            box-shadow: 0 6px 20px rgba(183, 110, 121, 0.08);
            height: 100%;
        }
        .contact-icon-wrap {
            width: 54px;
            height: 54px;
            border-radius: 14px;
            background: #FFF0F5;
            color: #E91E63;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin-bottom: 16px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header Banner -->
    <div class="py-5 text-center" style="background: radial-gradient(circle, #FFF0F5 0%, #FCE4EC 100%); border-bottom: 1px solid #F8BBD0;">
        <div class="container">
            <span class="sd-section-subtitle">We'd Love To Hear From You</span>
            <h1 class="display-4 font-serif text-dark mb-2">Get in Touch with SweetDelights</h1>
            <p class="lead text-muted mx-auto" style="max-width: 650px;">
                Have questions about custom cake orders, event catering, dietary restrictions, or delivery times? Our sweet concierge is here to help!
            </p>
        </div>
    </div>

    <div class="container py-5">
        <!-- Contact Info Cards -->
        <div class="row g-4 mb-5">
            <div class="col-lg-3 col-sm-6">
                <div class="contact-info-card">
                    <div class="contact-icon-wrap">
                        <i class="bi bi-geo-alt-fill"></i>
                    </div>
                    <h5 class="fw-bold mb-2">Our Boutique</h5>
                    <p class="text-muted small mb-0">142 Sugarloaf Avenue, Suite 400<br />Sweet Valley, CA 90210</p>
                </div>
            </div>

            <div class="col-lg-3 col-sm-6">
                <div class="contact-info-card">
                    <div class="contact-icon-wrap">
                        <i class="bi bi-telephone-inbound-fill"></i>
                    </div>
                    <h5 class="fw-bold mb-2">Call Bakery</h5>
                    <p class="text-muted small mb-0">+1 (800) 555-CAKE<br />+1 (555) 789-2253</p>
                </div>
            </div>

            <div class="col-lg-3 col-sm-6">
                <div class="contact-info-card">
                    <div class="contact-icon-wrap">
                        <i class="bi bi-envelope-heart-fill"></i>
                    </div>
                    <h5 class="fw-bold mb-2">Email Inquiries</h5>
                    <p class="text-muted small mb-0">orders@sweetdelights.com<br />concierge@sweetdelights.com</p>
                </div>
            </div>

            <div class="col-lg-3 col-sm-6">
                <div class="contact-info-card">
                    <div class="contact-icon-wrap">
                        <i class="bi bi-clock-fill"></i>
                    </div>
                    <h5 class="fw-bold mb-2">Oven Hours</h5>
                    <p class="text-muted small mb-0">Monday – Sunday<br />8:00 AM – 10:00 PM EST</p>
                </div>
            </div>
        </div>

        <!-- Contact Form & Map/Hours -->
        <div class="row g-5">
            <div class="col-lg-7">
                <div class="sd-form-card">
                    <div class="mb-4">
                        <span class="sd-section-subtitle text-start" style="font-size:1.8rem;">Send a Message</span>
                        <h3 class="font-serif">How Can We Sweeten Your Day?</h3>
                        <p class="text-muted small">Fill out the form below and our pastry consultant will reply within 2 hours.</p>
                    </div>

                    <asp:Label ID="lblSuccessMessage" runat="server" CssClass="alert alert-success d-block mb-4" Visible="false">
                        <i class="bi bi-check-circle-fill me-2"></i> Thank you! Your message has been received. Our team will contact you shortly.
                    </asp:Label>

                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="sd-label">Your Full Name *</label>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="sd-input" placeholder="e.g. Eleanor Vance" required="required"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="sd-label">Email Address *</label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="sd-input" placeholder="name@example.com" required="required"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="sd-label">Phone Number</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="sd-input" placeholder="+1 (555) 000-0000"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label class="sd-label">Inquiry Reason</label>
                            <asp:DropDownList ID="ddlSubject" runat="server" CssClass="sd-input">
                                <asp:ListItem Text="General Cake Inquiry" Value="General" />
                                <asp:ListItem Text="Custom Celebration Cake" Value="CustomCake" />
                                <asp:ListItem Text="Wedding Cake Tasting Consultation" Value="Wedding" />
                                <asp:ListItem Text="Bulk Corporate Gifting" Value="Corporate" />
                                <asp:ListItem Text="Delivery or Order Question" Value="Delivery" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-12">
                            <label class="sd-label">Event Date (Optional)</label>
                            <asp:TextBox ID="txtEventDate" runat="server" TextMode="Date" CssClass="sd-input"></asp:TextBox>
                        </div>
                        <div class="col-12">
                            <label class="sd-label">Message / Cake Details *</label>
                            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4" CssClass="sd-input" placeholder="Tell us about flavors, servings, design ideas, or specific dietary needs..."></asp:TextBox>
                        </div>
                        <div class="col-12 pt-2">
                            <asp:Button ID="btnSubmitContact" runat="server" Text="Send Message" CssClass="btn btn-sd-primary btn-lg w-100" OnClick="btnSubmitContact_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Map Mockup & FAQ -->
            <div class="col-lg-5">
                <div class="card border-0 rounded-4 shadow-sm overflow-hidden mb-4">
                    <img src="https://images.unsplash.com/photo-1555396273-367ea4eb4db5?auto=format&fit=crop&w=700&q=80" alt="Bakery Storefront" style="height: 240px; object-fit: cover;" />
                    <div class="card-body p-4 bg-white">
                        <h5 class="fw-bold text-dark mb-2"><i class="bi bi-geo-alt text-danger me-1"></i> SweetDelights Flagship Boutique</h5>
                        <p class="text-muted small mb-3">Drop in for freshly brewed artisan coffee and daily sample tastings at our dessert bar.</p>
                        <a href="https://maps.google.com" target="_blank" class="btn btn-sm btn-sd-outline">
                            <i class="bi bi-map"></i> Open in Google Maps
                        </a>
                    </div>
                </div>

                <!-- FAQ Accordion -->
                <div class="accordion sd-card p-3" id="faqAccordion">
                    <h5 class="fw-bold mb-3 px-2 pt-2">Frequently Asked Questions</h5>
                    
                    <div class="accordion-item border-0 mb-2">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button collapsed rounded-3 bg-light text-dark fw-semibold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false">
                                How far in advance should I order?
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body text-muted small">
                                For regular cakes, we offer same-day delivery within 2–4 hours. For multi-tier custom celebration and wedding cakes, please place orders at least 48 to 72 hours ahead.
                            </div>
                        </div>
                    </div>

                    <div class="accordion-item border-0 mb-2">
                        <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed rounded-3 bg-light text-dark fw-semibold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false">
                                Do you provide 100% Eggless options?
                            </button>
                        </h2>
                        <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body text-muted small">
                                Yes! More than 80% of our menu items are available in 100% pure vegetarian/eggless variations, prepared with dedicated baking pans and utensils.
                            </div>
                        </div>
                    </div>

                    <div class="accordion-item border-0">
                        <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed rounded-3 bg-light text-dark fw-semibold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false">
                                How is the cake packed during delivery?
                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body text-muted small">
                                All cakes are secured in heavy-duty refrigerated thermal boxes with dry-ice insulation packs to guarantee your frosting remains pristine in any weather.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
