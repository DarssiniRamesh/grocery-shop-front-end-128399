import 'package:flutter/material.dart';

/// PUBLIC_INTERFACE
class ProductDetailsScreen extends StatelessWidget {
  /// Pixel-accurate translation of the "Product details" screen using the
  /// exported assets under /assets and the design tokens mapped from assets/common.css.
  ///
  /// Structure overview (mirrors product-details-754-3996.html):
  /// - Top bar: back circular chip, title "Orange", cart badge
  /// - Decorative lines under hero
  /// - Hero product image
  /// - Pricing row: main price, discount chip, regular price
  /// - Stars + review count
  /// - Details section (title + paragraph)
  /// - Nutritional facts row (collapsed, with chevron and divider)
  /// - Reviews row (collapsed, with chevron and divider)
  /// - Bottom bar actions: "Add To Cart" (outlined), "Buy Now" (primary)
  const ProductDetailsScreen({super.key});

  // Design tokens (from assets/common.css)
  static const Color colorFFFFFF = Color(0xFFFFFFFF);
  static const Color color2A4BA0 = Color(0xFF2A4BA0);
  static const Color colorFAFBFD = Color(0xFFFAFBFD);
  static const Color color1E222B = Color(0xFF1E222B);
  static const Color colorB2BBCE = Color(0xFFB2BBCE);
  static const Color color8891A5 = Color(0xFF8891A5);
  static const Color colorF8F9FB = Color(0xFFF8F9FB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFFFFFF,
      body: SafeArea(
        child: Stack(
          children: [
            // Background panel behind content (rounded)
            Positioned(
              left: 8,
              right: 8,
              top: 306,
              height: 549,
              child: Container(
                decoration: const BoxDecoration(
                  color: colorF8F9FB, // style_27
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
            ),

            // Main scroll content
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 24),
              child: SizedBox(
                height: 860, // ensure enough height for stacked absolute-like elements
                child: Stack(
                  children: [
                    // Hero image (above background)
                    // Asset: assets/product-details-image-754-4050.png
                    Positioned(
                      left: 40,
                      top: 140,
                      width: 295,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/product-details-image-754-4050.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Top bar with back chip, title, cart badge
                    Positioned(
                      left: 16,
                      right: 16,
                      top: 64,
                      height: 40,
                      child: Row(
                        children: [
                          // Back chip with ellipse and chevron
                          // Assets:
                          //  - product-details-ellipse-134-754-4055.svg (circle background)
                          //  - product-details-fill-4-754-4056.svg (chevron)
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: colorF8F9FB,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SizedBox(
                                  width: 5,
                                  height: 8,
                                  child: Image.asset(
                                    'assets/product-details-fill-4-754-4056.svg',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 21),
                          const Text(
                            'Orange',
                            style: TextStyle(
                              fontSize: 16,
                              height: 24 / 16,
                              fontWeight: FontWeight.w400,
                              color: color1E222B,
                            ),
                          ),
                          const Spacer(),
                          // Bag vector + badge (simulated)
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              // Bag composed from vector assets
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 4,
                                      top: 8,
                                      width: 16,
                                      height: 13,
                                      child: Image.asset(
                                        'assets/product-details-vector-367-754-4060.svg',
                                      ),
                                    ),
                                    Positioned(
                                      left: 8,
                                      top: 3,
                                      width: 8,
                                      height: 8,
                                      child: Image.asset(
                                        'assets/product-details-vector-327-754-4061.svg',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Badge circle (yellow) with "3"
                              Positioned(
                                left: -4,
                                top: -8,
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        'assets/product-details-ellipse-3-754-4063.svg',
                                        width: 24,
                                        height: 24,
                                      ),
                                      const Positioned(
                                        left: 7,
                                        top: 2,
                                        child: Text(
                                          '3',
                                          style: TextStyle(
                                            color: colorFAFBFD,
                                            fontSize: 12,
                                            height: 16 / 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Decorative lines below hero (3 lines)
                    Positioned(
                      left: 177,
                      top: 209,
                      child: Image.asset(
                        'assets/product-details-line-1-754-4047.svg',
                        width: 19,
                        height: 4,
                      ),
                    ),
                    Positioned(
                      left: 204,
                      top: 209,
                      child: Image.asset(
                        'assets/product-details-line-2-754-4048.svg',
                        width: 17,
                        height: 4,
                      ),
                    ),
                    Positioned(
                      left: 229,
                      top: 209,
                      child: Image.asset(
                        'assets/product-details-line-3-754-4049.svg',
                        width: 17,
                        height: 4,
                      ),
                    ),

                    // Small thumb camera-like frame near hero (for parity)
                    Positioned(
                      left: 171,
                      top: 229,
                      width: 68,
                      height: 68,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/product-details-image-icon-754-4065.png',
                            width: 68,
                            height: 68,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            left: 6,
                            top: 6,
                            width: 56.6667,
                            height: 56.6667,
                            child: Image.asset(
                              'assets/product-details-vector-754-4067.svg',
                            ),
                          ),
                          Positioned(
                            left: 17,
                            top: 17,
                            width: 14.1667,
                            height: 14.1667,
                            child: Image.asset(
                              'assets/product-details-vector-754-4068.svg',
                            ),
                          ),
                          Positioned(
                            left: 17,
                            top: 34,
                            width: 45.3333,
                            height: 28.4283,
                            child: Image.asset(
                              'assets/product-details-vector-754-4069.svg',
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Product Title
                    const Positioned(
                      left: 17,
                      top: 256,
                      width: 300,
                      child: Text(
                        'Thin Choise Top Orange',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 20,
                          height: 26 / 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    // Pricing Row
                    Positioned(
                      left: 17,
                      top: 322,
                      right: 17,
                      height: 24,
                      child: Row(
                        children: [
                          const Text(
                            '\$34.70/KG',
                            style: TextStyle(
                              fontSize: 16,
                              height: 24 / 16,
                              fontWeight: FontWeight.w700,
                              color: color2A4BA0,
                            ),
                          ),
                          const SizedBox(width: 14),
                          // Discount chip
                          Container(
                            width: 84,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: color2A4BA0,
                              borderRadius: BorderRadius.all(Radius.circular(70)),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              '\$22.04 OFF',
                              style: TextStyle(
                                fontSize: 12,
                                height: 16 / 12,
                                color: colorFAFBFD,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'Reg: \$56.70 USD',
                            style: TextStyle(
                              fontSize: 14,
                              height: 20 / 14,
                              color: colorB2BBCE,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Stars + Review count
                    Positioned(
                      left: 19,
                      top: 370,
                      width: 182,
                      height: 20,
                      child: Row(
                        children: [
                          Image.asset('assets/product-details-star-754-4024.svg', width: 16.93, height: 16.93),
                          const SizedBox(width: 4),
                          Image.asset('assets/product-details-star-754-4027.svg', width: 16.93, height: 16.93),
                          const SizedBox(width: 4),
                          Image.asset('assets/product-details-star-754-4030.svg', width: 16.93, height: 16.93),
                          const SizedBox(width: 4),
                          Image.asset('assets/product-details-star-754-4033.svg', width: 16.93, height: 16.93),
                          const SizedBox(width: 4),
                          Stack(
                            children: [
                              Image.asset('assets/product-details-fill-1-754-4036.svg', width: 16.93, height: 16.93),
                              // right half overlay
                              Positioned(
                                left: 8,
                                child: Image.asset('assets/product-details-fill-4-754-4037.svg', width: 8, height: 16.93),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      left: 196,
                      top: 370,
                      child: Text(
                        '110 Reviews',
                        style: TextStyle(
                          fontSize: 14,
                          height: 20 / 14,
                          color: Color(0xFFA1A1AB),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    // Details block
                    const Positioned(
                      left: 17,
                      top: 406,
                      width: 327,
                      child: Text(
                        'Details',
                        style: TextStyle(
                          fontSize: 16,
                          height: 24 / 16,
                          color: color1E222B,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 17,
                      top: 436,
                      width: 327,
                      child: Text(
                        'Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Nullam quis risus eget urna mollis ornare vel eu leo.',
                        style: TextStyle(
                          fontSize: 16,
                          height: 24 / 16,
                          color: color8891A5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    // Nutritional facts (row with right chevron and divider)
                    Positioned(
                      left: 17,
                      right: 17,
                      top: 540,
                      height: 40,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  'Nutritional facts',
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 24 / 16,
                                    color: color1E222B,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              // Asset: product-details-fill-4-754-4015.svg (chevron)
                              Image.asset(
                                'assets/product-details-fill-4-754-4015.svg',
                                width: 15.22,
                                height: 8.99,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Divider
                          Image.asset(
                            'assets/product-details-line-4-754-4016.svg',
                            width: 327,
                            height: 1,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),

                    // Reviews (row with right chevron and divider)
                    Positioned(
                      left: 17,
                      right: 17,
                      top: 596,
                      height: 40,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  'Reviews',
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 24 / 16,
                                    color: color1E222B,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              // Asset: product-details-fill-4-754-4001.svg (chevron)
                              Image.asset(
                                'assets/product-details-fill-4-754-4001.svg',
                                width: 15.22,
                                height: 8.99,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Image.asset(
                            'assets/product-details-line-4-754-4002.svg',
                            width: 327,
                            height: 1,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),

                    // Bottom bar actions
                    Positioned(
                      left: 17,
                      right: 17,
                      top: 632,
                      height: 56,
                      child: Row(
                        children: [
                          // Add To Cart (outlined)
                          SizedBox(
                            width: 143,
                            height: 56,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: color2A4BA0, width: 1),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                backgroundColor: colorFFFFFF,
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Added to cart')),
                                );
                              },
                              child: const Text(
                                'Add To Cart',
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 20 / 14,
                                  color: color2A4BA0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 11),
                          // Buy Now (primary)
                          Expanded(
                            child: SizedBox(
                              height: 56,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: color2A4BA0,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  // Navigate to checkout (route provided in app routes)
                                  Navigator.pushNamed(context, '/checkout');
                                },
                                child: const Text(
                                  'Buy Now',
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
