import 'package:flutter/material.dart';

/// PUBLIC_INTERFACE
class ProductsScreen extends StatelessWidget {
  /// Products listing screen translated from assets/products-754-3763.html/CSS.
  /// It uses exported PNG/SVG assets from /assets (annotated inline) and
  /// approximates layout with absolute-like positioning using Stack + Positioned
  /// to stay faithful to the pixel design.
  const ProductsScreen({super.key});

  // Design tokens from assets/common.css
  static const Color colorFFFFFF = Color(0xFFFFFFFF);
  static const Color color2A4BA0 = Color(0xFF2A4BA0);
  static const Color color1E222B = Color(0xFF1E222B);
  static const Color color616A7D = Color(0xFF616A7D);
  static const Color colorB2BBCE = Color(0xFFB2BBCE);
  static const Color colorF8F9FB = Color(0xFFF8F9FB);
  static const Color colorF9B023 = Color(0xFFF9B023);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 812, // match exported frame height
            width: double.infinity,
            child: Stack(
              children: [
                // Top bar: back circle + title + cart badge + search icon
                Positioned(
                  left: 20,
                  top: 16,
                  width: 335,
                  height: 40,
                  child: Row(
                    children: [
                      // Back circle (products-ellipse-134-754-3766.svg) and chevron (products-fill-4-754-3767.svg)
                      _BackCircle(onTap: () => Navigator.pop(context)),
                      const SizedBox(width: 21),
                      const Text(
                        'Big & Small Fishes',
                        style: TextStyle(
                          fontSize: 16,
                          height: 24 / 16,
                          fontWeight: FontWeight.w400,
                          color: color1E222B,
                        ),
                      ),
                      const Spacer(),
                      // Search icon instance (products-iconly-broken-search-754-3879.svg)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image.asset(
                          'assets/products-iconly-broken-search-754-3879.svg',
                          width: 18,
                          height: 18,
                        ),
                      ),
                      // Bag and badge (products-vector-367-754-3771.svg + 327-754-3772.svg, badge ellipse)
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 5,
                                  top: 5,
                                  child: Image.asset(
                                    'assets/products-vector-367-754-3771.svg',
                                    width: 16,
                                    height: 13,
                                  ),
                                ),
                                Positioned(
                                  left: 9,
                                  top: 0,
                                  child: Image.asset(
                                    'assets/products-vector-327-754-3772.svg',
                                    width: 8,
                                    height: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: -4,
                            top: -7,
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: Stack(
                                children: [
                                  Image.asset(
                                    'assets/products-ellipse-3-754-3774.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                  const Positioned(
                                    left: 7,
                                    top: 2,
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                        fontSize: 12,
                                        height: 16 / 12,
                                        color: colorFFFFFF,
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

                // Filter chips row (Popular - active, Low Price, Small Fishes, Big)
                Positioned(
                  left: 20,
                  top: 78,
                  width: 372,
                  height: 36,
                  child: Row(
                    children: const [
                      _ChipActive(label: 'Popular'),
                      SizedBox(width: 8),
                      _ChipOutline(label: 'Low Price'),
                      SizedBox(width: 8),
                      _ChipOutline(label: 'Small Fishes'),
                      SizedBox(width: 8),
                      _ChipOutline(label: 'Big'),
                    ],
                  ),
                ),

                // Grid of 6 product cards (2 columns)
                // Row 1
                const _ProductCard(
                  // products-image-icon-754-3966.png
                  left: 16,
                  top: 140,
                  title: 'Clown Tang.H03',
                  price: '\$325',
                  imageAsset: 'assets/products-image-icon-754-3966.png',
                ),
                const _ProductCard(
                  // products-image-icon-754-3971.png
                  left: 199,
                  top: 140,
                  title: 'Clownfish.H03',
                  price: '\$89',
                  imageAsset: 'assets/products-image-icon-754-3971.png',
                ),

                // Row 2
                const _ProductCard(
                  // products-image-icon-754-3981.png
                  left: 16,
                  top: 340,
                  title: 'Gold Fish.H03',
                  price: '\$89',
                  imageAsset: 'assets/products-image-icon-754-3981.png',
                ),
                const _ProductCard(
                  // products-image-icon-754-3976.png
                  left: 199,
                  top: 340,
                  title: 'Fish.H03',
                  price: '\$325',
                  imageAsset: 'assets/products-image-icon-754-3976.png',
                ),

                // Row 3
                const _ProductCard(
                  // products-image-icon-754-3986.png
                  left: 16,
                  top: 540,
                  title: 'Clownfish.H03',
                  price: '\$89',
                  imageAsset: 'assets/products-image-icon-754-3986.png',
                ),
                const _ProductCard(
                  // products-image-icon-754-3991.png
                  left: 199,
                  top: 540,
                  title: 'Clown Tang.H03',
                  price: '\$325',
                  imageAsset: 'assets/products-image-icon-754-3991.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BackCircle extends StatelessWidget {
  final VoidCallback onTap;
  const _BackCircle({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      radius: 24,
      child: SizedBox(
        width: 40,
        height: 40,
        child: Stack(
          children: [
            // Asset: products-ellipse-134-754-3766.svg
            Image.asset(
              'assets/products-ellipse-134-754-3766.svg',
              width: 40,
              height: 40,
            ),
            // Asset: products-fill-4-754-3767.svg
            Positioned(
              left: 18,
              top: 15,
              child: Image.asset(
                'assets/products-fill-4-754-3767.svg',
                width: 5,
                height: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChipActive extends StatelessWidget {
  final String label;
  const _ChipActive({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: ProductsScreen.colorF9B023, // style_74 background
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: const DefaultTextStyle(
        style: TextStyle(
          fontSize: 14,
          height: 20 / 14,
          fontWeight: FontWeight.w600,
          color: ProductsScreen.colorFFFFFF,
        ),
        child: Text('Popular'),
      ),
    );
  }
}

class _ChipOutline extends StatelessWidget {
  final String label;
  const _ChipOutline({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: ProductsScreen.colorB2BBCE, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          height: 20 / 14,
          color: ProductsScreen.color616A7D,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final double left;
  final double top;
  final String imageAsset; // PNG
  final String title;
  final String price;

  const _ProductCard({
    required this.left,
    required this.top,
    required this.imageAsset,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/product'),
        child: Container(
          width: 160,
          height: 194,
          decoration: BoxDecoration(
            color: ProductsScreen.colorF8F9FB, // card bg (style_116)
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              // Image frame (68x68) centered top with 20 top margin
              Positioned(
                top: 20,
                left: 46, // (160 - 68) / 2
                child: Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imageAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Price text
              Positioned(
                left: 17,
                top: 134,
                child: Text(
                  price,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 20 / 14,
                    color: ProductsScreen.color1E222B,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // Subtitle
              Positioned(
                left: 17,
                top: 158,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 16 / 12,
                    color: ProductsScreen.color616A7D,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // Plus button (24x24) at approx (119,121)
              Positioned(
                left: 119,
                top: 121,
                child: _PlusButton(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$title added to cart'),
                        duration: const Duration(milliseconds: 700),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlusButton extends StatefulWidget {
  final VoidCallback onTap;
  const _PlusButton({required this.onTap});

  @override
  State<_PlusButton> createState() => _PlusButtonState();
}

class _PlusButtonState extends State<_PlusButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => pressed = true),
      onTapUp: (_) => setState(() => pressed = false),
      onTapCancel: () => setState(() => pressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: pressed
              ? ProductsScreen.color2A4BA0.withValues(alpha: 0.9)
              : ProductsScreen.color2A4BA0,
          borderRadius: BorderRadius.circular(12),
        ),
        // Use exported white plus vectors as a single glyph (from products-vector-754-3803.svg)
        alignment: Alignment.center,
        child: Image.asset(
          'assets/products-vector-754-3803.svg',
          width: 16,
          height: 16,
        ),
      ),
    );
  }
}
