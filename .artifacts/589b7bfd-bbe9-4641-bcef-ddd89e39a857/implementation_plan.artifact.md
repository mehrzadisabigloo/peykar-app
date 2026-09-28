# Implementation Plan - Enhance Checkout UI

Enhance the UI of the checkout page to provide a more premium, modern, and user-friendly experience. The focus will be on visual hierarchy, better information architecture, and polished components.

## Proposed Changes

### [feature_shop_basket]

#### [MODIFY] [screen_checkout.dart](file:///E:/zino/chaharmahalShopFront/lib/features/feature_shop_basket/presentation/screen/screen_checkout.dart)

1.  **Top Progress Indicator**: Add a subtle "Basket -> Checkout -> Payment" step indicator below the AppBar.
2.  **Order Summary Card**: Add a summary card at the top showing the total items and number of shops involved.
3.  **Refined Shop Group Cards**:
    *   Improve the "Verified" badge styling.
    *   Enhance product list visualization with better border radius and subtle shadows.
    *   Update Payment Method selection with icons and animated transitions.
    *   Integrate the Discount Code field more seamlessly into the payment section.
4.  **Premium Footer**: Redesign the per-shop footer to show a clear breakdown (Subtotal, Discount, Shipping, Total) before the "Confirm" button.
5.  **Interactive Elements**: Add micro-interactions (e.g., scale animations on button press, hover effects for selection).
6.  **Address Selection**: Improve the address tile to show recipient name and a snippet of the map icon.

## Verification Plan

### Manual Verification
- Verify the new top summary card displays correct totals.
- Test the address selection sheet for visual consistency.
- Test payment method selection animations.
- Verify the price breakdown in the shop group footer.
- Check the overall responsiveness on different screen sizes (using `ScreenUtil`).
