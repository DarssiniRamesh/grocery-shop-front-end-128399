import 'package:flutter/material.dart';

/// PUBLIC_INTERFACE
class ShoppingCartOfferScreen extends StatelessWidget {
  /// Pixel-faithful translation of the "Shopping Cart _Offer" screen using
  /// exported assets under /assets and mapped design tokens from assets/common.css.
  /// This page shows:
  /// - Top promotional banner with 25% OFF copy over yellow background
  /// - Back circular button
  /// - Three cart items with mini 31x31 icon-frames and quantity controls
  /// - Summary card with Subtotal, Delivery and Total
  /// - Proceed To checkout button
  const ShoppingCartOfferScreen({super.key});

  // Design tokens mapped from assets/common.css
  static const Color colorFFFFFF = Color(0xFFFFFFFF);
  static const Color color2A4BA0 = Color(0xFF2A4BA0);
  static const Color colorFFC83A = Color(0xFFFFC83A);
  static const Color colorF8F9FB = Color(0xFFF8F9FB);
  static const Color color1E222B = Color(0xFF1E222B);
  static const Color color616A7D = Color(0xFF616A7D);
  static const Color colorFAFBFD = Color(0xFFFAFBFD);
  static const Color colorE9EAF4 = Color(0xFFE9EAF4);
  static const Color colorF9B023 = Color(0xFFF9B023);
  static const Color colorB2BBCE = Color(0xFFB2BBCE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFFFFFF,
      body: SafeArea(
        child: Stack(
          children: [
            // Top banner background image and yellow overlay
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 291,
              child: Stack(
                children: [
                  // Banner image
                  Positioned.fill(
                    child: Image.asset(
                      'assets/shopping-cart-offer-banner-754-4126.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Yellow top rectangle to ensure token color presence as per HTML/CSS
                  Positioned.fill(
                    child: Container(
                      color: colorFFC83A.withValues(alpha: 1.0),
                    ),
                  ),
                ],
              ),
            ),

            // Main Scroll
            Positioned.fill(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 40),
                child: SizedBox(
                  height: 850, // gives enough space for positioned content below
                  child: Stack(
                    children: [
                      // Back button circle (40x40) and chevron
                      Positioned(
                        left: 24,
                        top: 108,
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Stack(
                            children: [
                              // Background circle token f8f9fb
                              Positioned.fill(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: colorF8F9FB,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              // Chevron
                              Positioned(
                                left: 18,
                                top: 16,
                                child: SizedBox(
                                  width: 5,
                                  height: 8,
                                  child: Image.asset(
                                    'assets/shopping-cart-offer-fill-4-754-4136.svg',
                                    package: null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Screen Title
                      const Positioned(
                        left: 61,
                        top: 112,
                        child: SizedBox(
                          width: 240,
                          child: Text(
                            'Shopping Cart (5)',
                            style: TextStyle(
                              fontSize: 16,
                              height: 24 / 16,
                              fontWeight: FontWeight.w400,
                              color: color1E222B,
                            ),
                          ),
                        ),
                      ),

                      // Decorative banner vector and OFF text and big 25%
                      Positioned(
                        left: 249,
                        top: 49,
                        child: SizedBox(
                          width: 86,
                          height: 50,
                          child: Image.asset(
                            'assets/shopping-cart-offer-vector-368-754-4129.svg',
                            package: null,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 299,
                        top: 111,
                        child: SizedBox(
                          width: 60,
                          child: Text(
                            'OFF!!',
                            style: TextStyle(
                              fontSize: 11,
                              height: 15 / 11,
                              fontWeight: FontWeight.w800,
                              color: colorFAFBFD,
                              letterSpacing: 0.22,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 82,
                        top: 104,
                        child: SizedBox(
                          width: 231,
                          height: 138,
                          child: Text(
                            '25%',
                            style: TextStyle(
                              fontSize: 110,
                              height: 137.61 / 110,
                              fontWeight: FontWeight.w800,
                              color: colorFAFBFD,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 32,
                        top: 254,
                        child: SizedBox(
                          width: 286,
                          child: Text(
                            'Use code #HalalFood at Checkouut',
                            style: TextStyle(
                              // token: --typo-title-16-poppins-500-1e222b
                              fontSize: 16,
                              height: 24 / 16,
                              fontWeight: FontWeight.w500,
                              color: color1E222B,
                            ),
                          ),
                        ),
                      ),

                      // Three small icon frames (31x31) with vector layers (simulated with PNGs/SVGs)
                      Positioned(
                        left: 24,
                        top: 328,
                        child: _IconFrame(
                          all: 'assets/shopping-cart-offer-vector-754-4206.svg',
                          dot: 'assets/shopping-cart-offer-vector-754-4207.svg',
                          base: 'assets/shopping-cart-offer-vector-754-4208.svg',
                        ),
                      ),
                      Positioned(
                        left: 24,
                        top: 406,
                        child: _IconFrame(
                          all: 'assets/shopping-cart-offer-vector-754-4211.svg',
                          dot: 'assets/shopping-cart-offer-vector-754-4212.svg',
                          base: 'assets/shopping-cart-offer-vector-754-4213.svg',
                        ),
                      ),
                      Positioned(
                        left: 24,
                        top: 484,
                        child: _IconFrame(
                          all: 'assets/shopping-cart-offer-vector-754-4216.svg',
                          dot: 'assets/shopping-cart-offer-vector-754-4217.svg',
                          base: 'assets/shopping-cart-offer-vector-754-4218.svg',
                        ),
                      ),

                      // Divider lines
                      Positioned(
                        left: 24,
                        top: 383,
                        child: _Hr(width: 327),
                      ),
                      Positioned(
                        left: 24,
                        top: 461,
                        child: _Hr(width: 327),
                      ),
                      Positioned(
                        left: 24,
                        top: 538,
                        child: _Hr(width: 327),
                      ),

                      // Cart Items
                      Positioned(
                        left: 62,
                        top: 325,
                        child: _CartRow(
                          title: 'Bananas',
                          price: '\$7.90',
                          count: 2,
                        ),
                      ),
                      Positioned(
                        left: 62,
                        top: 402,
                        child: _CartRow(
                          title: 'Package 01',
                          price: '\$7.90',
                          count: 2,
                        ),
                      ),
                      Positioned(
                        left: 62,
                        top: 479,
                        child: _CartRow(
                          title: 'Package 02',
                          price: '\$7.90',
                          count: 2,
                        ),
                      ),

                      // "+ 3 More" and "Edit"
                      const Positioned(
                        left: 24,
                        top: 560,
                        child: SizedBox(
                          width: 325,
                          child: _MoreEditRow(),
                        ),
                      ),

                      // Summary card background
                      Positioned(
                        left: 8,
                        top: 584,
                        child: Container(
                          width: 359,
                          height: 266,
                          decoration: const BoxDecoration(
                            color: colorF8F9FB,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),

                      // Summary rows text
                      const Positioned(
                        left: 44,
                        top: 601,
                        child: Text(
                          'Subtotal',
                          style: TextStyle(
                            fontSize: 14,
                            height: 20 / 14,
                            color: color616A7D,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 285,
                        top: 601,
                        child: SizedBox(
                          width: 60,
                          child: Text(
                            '\$35.96',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 14,
                              height: 20 / 14,
                              fontWeight: FontWeight.w600,
                              color: color1E222B,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 44,
                        top: 634,
                        child: Text(
                          'Delivery',
                          style: TextStyle(
                            fontSize: 14,
                            height: 20 / 14,
                            color: color616A7D,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 293,
                        top: 635,
                        child: SizedBox(
                          width: 50,
                          child: Text(
                            '\$2.00',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 14,
                              height: 20 / 14,
                              fontWeight: FontWeight.w500,
                              color: color1E222B,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 44,
                        top: 670,
                        child: Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 14,
                            height: 20 / 14,
                            color: color616A7D,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 284,
                        top: 671,
                        child: SizedBox(
                          width: 60,
                          child: Text(
                            '\$38.98',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 14,
                              height: 20 / 14,
                              fontWeight: FontWeight.w600,
                              color: color1E222B,
                            ),
                          ),
                        ),
                      ),

                      // Proceed button
                      Positioned(
                        left: 24,
                        top: 725,
                        child: SizedBox(
                          width: 327,
                          height: 56,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: color2A4BA0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 0,
                            ),
                            onPressed: () {
                              // Navigate to checkout placeholder route (must be provided by app routes)
                              Navigator.pushNamed(context, '/checkout');
                            },
                            child: const Text(
                              'Proceed  To checkout',
                              style: TextStyle(
                                fontSize: 14,
                                height: 20 / 14,
                                color: colorFFFFFF,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom yellow strip from banner (for layering parity) – optional visual
            Positioned(
              left: 0,
              right: 0,
              top: 242,
              height: 49,
              child: Container(color: colorF9B023),
            ),
          ],
        ),
      ),
    );
  }
}

class _IconFrame extends StatelessWidget {
  final String all;
  final String dot;
  final String base;

  const _IconFrame({
    required this.all,
    required this.dot,
    required this.base,
  });

  @override
  Widget build(BuildContext context) {
    // 31x31 background with 0.6 white simulated via Colors.white60
    return SizedBox(
      width: 31,
      height: 31,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          // Use positioned images as per CSS sizes (approx in Flutter)
          Positioned(
            left: 2.6,
            top: 2.6,
            width: 25.8,
            height: 25.8,
            child: Image.asset(all),
          ),
          Positioned(
            left: 7.8,
            top: 7.8,
            width: 6.46,
            height: 6.46,
            child: Image.asset(dot),
          ),
          Positioned(
            left: 7.8,
            top: 15.0,
            width: 20.7,
            height: 12.96,
            child: Image.asset(base),
          ),
        ],
      ),
    );
  }
}

class _Hr extends StatelessWidget {
  final double width;
  const _Hr({required this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 1,
      color: ShoppingCartOfferScreen.colorE9EAF4,
    );
  }
}

class _CartRow extends StatelessWidget {
  final String title;
  final String price;
  final int count;
  const _CartRow({
    required this.title,
    required this.price,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 269,
      height: 48,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                height: 19 / 14,
                fontWeight: FontWeight.w500,
                color: ShoppingCartOfferScreen.color1E222B,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 22,
            child: Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                height: 24 / 16,
                color: ShoppingCartOfferScreen.color1E222B,
              ),
            ),
          ),
          // Quantity control cluster (two circular buttons and count)
          Positioned(
            right: -3,
            top: 2,
            child: SizedBox(
              width: 110,
              height: 40,
              child: Stack(
                children: [
                  // Count
                  Positioned(
                    left: 51,
                    top: 11,
                    child: Text(
                      '$count',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 19 / 14,
                        fontWeight: FontWeight.w500,
                        color: ShoppingCartOfferScreen.color1E222B,
                      ),
                    ),
                  ),
                  // Minus ellipse (simulate with plain circle and a "-" vector)
                  Positioned(
                    left: 0,
                    top: 0,
                    child: _CircleIcon(
                      child: Center(
                        child: Container(
                          width: 12,
                          height: 2,
                          color: ShoppingCartOfferScreen.color1E222B,
                        ),
                      ),
                    ),
                  ),
                  // Plus ellipse (simulate with plus made with two rectangles)
                  Positioned(
                    left: 70,
                    top: 0,
                    child: _CircleIcon(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 12,
                            height: 2,
                            color: ShoppingCartOfferScreen.color1E222B,
                          ),
                          Container(
                            width: 2,
                            height: 12,
                            color: ShoppingCartOfferScreen.color1E222B,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleIcon extends StatelessWidget {
  final Widget child;
  const _CircleIcon({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: ShoppingCartOfferScreen.colorF8F9FB,
        shape: BoxShape.circle,
      ),
      child: child,
    );
    }
}

class _MoreEditRow extends StatelessWidget {
  const _MoreEditRow();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325,
      height: 16,
      child: Row(
        children: const [
          Expanded(
            child: Text(
              '+ 3 More ',
              style: TextStyle(
                fontSize: 12,
                height: 16 / 12,
                letterSpacing: 0.24,
                fontWeight: FontWeight.w500,
                color: ShoppingCartOfferScreen.color2A4BA0,
              ),
            ),
          ),
          Text(
            'Edit',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12,
              height: 16 / 12,
              letterSpacing: 0.24,
              fontWeight: FontWeight.w500,
              color: ShoppingCartOfferScreen.color2A4BA0,
            ),
          ),
        ],
      ),
    );
  }
}
