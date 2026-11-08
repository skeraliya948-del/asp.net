/* ==========================================================================
   SweetDelights Bakery & Desserts - Interactive UI Script
   ========================================================================== */

// Immediately clear any legacy mock cart count stored in browser localStorage
try {
    localStorage.removeItem('sd_cart_count');
} catch (e) { }

document.addEventListener('DOMContentLoaded', function () {
    try {
        localStorage.removeItem('sd_cart_count');
    } catch (e) { }
    initQuantityControls();
    initCartCalculations();
    initCategoryFilters();
    initProductSearch();
    initImageGallery();
    initAdminSidebar();
    initToasts();
});

// 1. Quantity Controls (- / + buttons)
function initQuantityControls() {
    document.querySelectorAll('.sd-qty-control').forEach(control => {
        const minusBtn = control.querySelector('.qty-minus');
        const plusBtn = control.querySelector('.qty-plus');
        const input = control.querySelector('.sd-qty-input');

        if (minusBtn && plusBtn && input) {
            minusBtn.addEventListener('click', function (e) {
                e.preventDefault();
                let val = parseInt(input.value) || 1;
                if (val > 1) {
                    input.value = val - 1;
                    input.dispatchEvent(new Event('change'));
                }
            });

            plusBtn.addEventListener('click', function (e) {
                e.preventDefault();
                let val = parseInt(input.value) || 1;
                if (val < 99) {
                    input.value = val + 1;
                    input.dispatchEvent(new Event('change'));
                }
            });
        }
    });
}

// 2. Shopping Cart Price & Subtotal recalculation
function initCartCalculations() {
    const cartTable = document.querySelector('.sd-cart-table');
    if (!cartTable) return;

    function recalculateCart() {
        let subtotal = 0;
        const rows = cartTable.querySelectorAll('tbody tr.cart-item-row');
        
        rows.forEach(row => {
            const priceEl = row.querySelector('.item-price');
            const qtyInput = row.querySelector('.sd-qty-input');
            const totalEl = row.querySelector('.item-total');

            if (priceEl && qtyInput && totalEl) {
                const price = parseFloat(priceEl.getAttribute('data-price')) || 0;
                const qty = parseInt(qtyInput.value) || 0;
                const lineTotal = price * qty;
                totalEl.textContent = '$' + lineTotal.toFixed(2);
                subtotal += lineTotal;
            }
        });

        const subtotalEl = document.getElementById('cartSubtotal');
        const discountEl = document.getElementById('cartDiscount');
        const shippingEl = document.getElementById('cartShipping');
        const grandTotalEl = document.getElementById('cartGrandTotal');

        let shipping = subtotal > 50 || subtotal === 0 ? 0 : 5.99;
        let discount = 0;
        
        if (discountEl && discountEl.getAttribute('data-applied') === 'true') {
            discount = subtotal * 0.15; // 15% promo discount
            discountEl.textContent = '-$' + discount.toFixed(2);
        }

        if (subtotalEl) subtotalEl.textContent = '$' + subtotal.toFixed(2);
        if (shippingEl) shippingEl.textContent = shipping === 0 ? 'FREE' : '$' + shipping.toFixed(2);
        if (grandTotalEl) {
            const grandTotal = Math.max(0, subtotal - discount + shipping);
            grandTotalEl.textContent = '$' + grandTotal.toFixed(2);
        }

        // Empty cart check
        const emptyState = document.getElementById('cartEmptyState');
        const cartContent = document.getElementById('cartContentSection');
        if (rows.length === 0 && emptyState && cartContent) {
            cartContent.classList.add('d-none');
            emptyState.classList.remove('d-none');
        }
    }

    // Attach listeners
    cartTable.querySelectorAll('.sd-qty-input').forEach(input => {
        input.addEventListener('change', recalculateCart);
    });

    // Remove buttons
    cartTable.querySelectorAll('.btn-remove-item').forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.preventDefault();
            const row = this.closest('tr');
            if (row) {
                row.remove();
                recalculateCart();
                showSweetToast('Item removed from shopping cart');
            }
        });
    });

    // Coupon code
    const applyCouponBtn = document.getElementById('btnApplyCoupon');
    const couponInput = document.getElementById('txtCouponCode');
    if (applyCouponBtn && couponInput) {
        applyCouponBtn.addEventListener('click', function (e) {
            e.preventDefault();
            const code = couponInput.value.trim().toUpperCase();
            const discountEl = document.getElementById('cartDiscount');
            if (code === 'SWEET15') {
                if (discountEl) {
                    discountEl.setAttribute('data-applied', 'true');
                    recalculateCart();
                    showSweetToast('Promo code SWEET15 applied! 15% off.');
                }
            } else if (code === '') {
                showSweetToast('Please enter a coupon code (e.g. SWEET15)');
            } else {
                showSweetToast('Invalid coupon code. Try SWEET15');
            }
        });
    }

    recalculateCart();
}

// 3. Category Filter Buttons
function initCategoryFilters() {
    const filterButtons = document.querySelectorAll('.sd-filter-btn');
    const productItems = document.querySelectorAll('.sd-filterable-item');

    if (filterButtons.length && productItems.length) {
        filterButtons.forEach(btn => {
            btn.addEventListener('click', function (e) {
                e.preventDefault();
                filterButtons.forEach(b => b.classList.remove('active', 'btn-sd-primary'));
                filterButtons.forEach(b => b.classList.add('btn-sd-outline'));
                this.classList.add('active', 'btn-sd-primary');
                this.classList.remove('btn-sd-outline');

                const category = this.getAttribute('data-filter');

                productItems.forEach(item => {
                    if (category === 'all' || item.getAttribute('data-category') === category) {
                        item.style.display = 'block';
                    } else {
                        item.style.display = 'none';
                    }
                });
            });
        });
    }
}

// 4. Client Search Filter
function initProductSearch() {
    const searchInputs = document.querySelectorAll('.sd-search-box');
    searchInputs.forEach(input => {
        input.addEventListener('keyup', function () {
            const query = this.value.toLowerCase();
            const cards = document.querySelectorAll('.sd-filterable-item');
            cards.forEach(card => {
                const title = card.querySelector('.sd-product-title, .sd-company-title')?.textContent.toLowerCase() || '';
                const desc = card.querySelector('.sd-product-desc, .sd-company-desc')?.textContent.toLowerCase() || '';
                if (title.includes(query) || desc.includes(query)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    });
}

// 5. Image Gallery for Product Details
function initImageGallery() {
    const mainImg = document.getElementById('mainProductImg');
    const thumbs = document.querySelectorAll('.sd-gallery-thumb');

    if (mainImg && thumbs.length) {
        thumbs.forEach(thumb => {
            thumb.addEventListener('click', function () {
                thumbs.forEach(t => t.classList.remove('active', 'border-primary'));
                this.classList.add('active');
                mainImg.src = this.getAttribute('data-large-img');
            });
        });
    }
}

// 6. Admin Sidebar Toggle
function initAdminSidebar() {
    const toggleBtn = document.getElementById('sidebarToggleBtn');
    const sidebar = document.querySelector('.admin-sidebar');
    if (toggleBtn && sidebar) {
        toggleBtn.addEventListener('click', function (e) {
            e.preventDefault();
            sidebar.classList.toggle('show');
        });
    }
}

// 7. SweetDelights Toast Notifications
function initToasts() {
    // Add toast container to body if not present
    if (!document.getElementById('sd-toast-container')) {
        const container = document.createElement('div');
        container.id = 'sd-toast-container';
        container.style.cssText = 'position: fixed; bottom: 24px; right: 24px; z-index: 9999; display: flex; flex-direction: column; gap: 10px;';
        document.body.appendChild(container);
    }

    // Attach Add to Cart clicks
    document.querySelectorAll('.btn-add-to-cart').forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.preventDefault();
            const productTitle = this.getAttribute('data-product-name') || 'Dessert item';
            showSweetToast(`🍰 Redirecting to product showcase for "${productTitle}"...`);
            setTimeout(() => {
                window.location.href = 'Show_Products.aspx';
            }, 600);
        });
    });
}

function showSweetToast(message) {
    const container = document.getElementById('sd-toast-container');
    if (!container) return;

    const toast = document.createElement('div');
    toast.className = 'sd-toast-msg';
    toast.style.cssText = `
        background: #3E2723;
        color: #FFFFFF;
        padding: 14px 22px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        display: flex;
        align-items: center;
        gap: 12px;
        font-size: 0.92rem;
        border-left: 4px solid #E91E63;
        transform: translateY(20px);
        opacity: 0;
        transition: all 0.3s cubic-bezier(0.25, 1, 0.5, 1);
    `;
    toast.innerHTML = `<i class="bi bi-heart-fill text-danger"></i> <span>${message}</span>`;
    container.appendChild(toast);

    setTimeout(() => {
        toast.style.transform = 'translateY(0)';
        toast.style.opacity = '1';
    }, 10);

    setTimeout(() => {
        toast.style.opacity = '0';
        toast.style.transform = 'translateY(-10px)';
        setTimeout(() => toast.remove(), 300);
    }, 3500);
}

function updateCartBadge() {
    // Keep cart badge synchronized with actual backend cart count (never overwrite with fake mock count)
    try {
        localStorage.removeItem('sd_cart_count');
    } catch (e) { }
}
