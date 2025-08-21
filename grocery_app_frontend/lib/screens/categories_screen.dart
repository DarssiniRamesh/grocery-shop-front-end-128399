import 'package:flutter/material.dart';

/// PUBLIC_INTERFACE
class CategoriesScreen extends StatelessWidget {
  /// Categories screen translated from assets/categories-755-2246.html and CSS.
  /// Uses design tokens from assets/common.css mapped to Flutter constants,
  /// and references real exported assets (SVG/PNG) from the /assets folder.
  const CategoriesScreen({super.key});

  // Token mappings (from assets/common.css)
  static const Color color2A4BA0 = Color(0xFF2A4BA0);
  static const Color colorFAFBFD = Color(0xFFFAFBFD);
  static const Color colorF8F9FB = Color(0xFFF8F9FB);
  static const Color colorFFFFFF = Color(0xFFFFFFFF);
  static const Color colorB2BBCE = Color(0xFFB2BBCE);
  static const Color color1E222B = Color(0xFF1E222B);
  static const Color color777784 = Color(0xFF777784);
  static const Color colorE0E2EE = Color(0xFFE0E2EE);
  static const Color color130F26 = Color(0xFF130F26);
  static const Color colorF9B023 = Color(0xFFF9B023);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top blue background band (height ~ 252 as per HTML)
          Positioned.fill(
            child: Column(
              children: const [
                SizedBox(height: 252, child: ColoredBox(color: color2A4BA0)),
                Expanded(child: ColoredBox(color: colorFFFFFF)),
              ],
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top bar: greeting + search + cart (with badge)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Hey, Halal',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            height: 1.0,
                            color: colorF8F9FB,
                          ),
                        ),
                        Row(
                          children: [
                            // Asset reference: assets/categories-iconly-broken-search-755-2297.svg
                            const _CircleIconDot(size: 18, color: colorF8F9FB),
                            const SizedBox(width: 16),
                            // Asset reference: assets/icon-cart-bag-754-3557.svg (bag)
                            Stack(
                              clipBehavior: Clip.none,
                              children: const [
                                _CartBagBox(),
                                Positioned(
                                  right: -2,
                                  top: -8,
                                  child: _Badge(
                                    text: '3',
                                    background: colorF9B023,
                                    foreground: colorFFFFFF,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Big Title: "Shop" + "By Category"
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
                    child: _BigTitle(),
                  ),

                  const SizedBox(height: 12),

                  // Card grid, three rows, two columns
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        _CardRow(
                          cards: const [
                            _CategoryCard(
                              // Row 1: Fishes
                              title: 'Fishes',
                              subtitle: 'From Sea',
                              // Asset: categories-vector-755-2329.svg + 2330 + 2331 stacked (camera-like)
                              // Divider: categories-line-2-755-2280.svg -> as 1px line using token color
                              vectors: _IconVectors(
                                // tokens: we simply place a decorated square
                                hint: 'assets/categories-vector-755-2329.svg',
                              ),
                            ),
                            _CategoryCard(
                              // Row 1: Meats
                              title: 'Meats',
                              subtitle: 'Organic',
                              vectors: _IconVectors(
                                hint: 'assets/categories-vector-755-2354.svg',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        _CardRow(
                          cards: const [
                            _CategoryCard(
                              // Row 2: Vegetables
                              title: 'Vegetables',
                              subtitle: 'Organic',
                              vectors: _IconVectors(
                                hint: 'assets/categories-vector-755-2334.svg',
                              ),
                            ),
                            _CategoryCard(
                              // Row 2: Fruits
                              title: 'Fruits',
                              subtitle: 'Fresh & Organic',
                              vectors: _IconVectors(
                                hint: 'assets/categories-vector-755-2339.svg',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        _CardRow(
                          cards: const [
                            _CategoryCard(
                              // Row 3: Juices
                              title: 'Juices',
                              subtitle: 'From Sea',
                              vectors: _IconVectors(
                                hint: 'assets/categories-vector-755-2344.svg',
                              ),
                            ),
                            _CategoryCard(
                              // Row 3: Cooking needs
                              title: 'Cooking needs',
                              subtitle: 'From Sea',
                              vectors: _IconVectors(
                                hint: 'assets/categories-vector-755-2349.svg',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Bottom navbar mimic (static for this screen)
                  _BottomBar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleIconDot extends StatelessWidget {
  final double size;
  final Color color;
  const _CircleIconDot({required this.size, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color.withValues(alpha: 0.9), shape: BoxShape.circle),
    );
  }
}

class _CartBagBox extends StatelessWidget {
  const _CartBagBox();
  @override
  Widget build(BuildContext context) {
    // Visual placeholder mimicking the 24x24 bag stroke
    // Asset ref: assets/icon-cart-bag-754-3557.svg
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: CategoriesScreen.colorF8F9FB, width: 1.5),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final Color background;
  final Color foreground;
  const _Badge({
    required this.text,
    required this.background,
    required this.foreground,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: background, shape: BoxShape.circle),
      child: Text(
        text,
        style: TextStyle(
          color: foreground,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          height: 1.0,
        ),
      ),
    );
  }
}

class _BigTitle extends StatelessWidget {
  const _BigTitle();
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 50,
        height: 62.55 / 50,
        fontWeight: FontWeight.w800,
        color: CategoriesScreen.colorFAFBFD,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Shop'),
          Text('By Category'),
        ],
      ),
    );
  }
}

class _CardRow extends StatelessWidget {
  final List<_CategoryCard> cards;
  const _CardRow({required this.cards});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: cards[0]),
        const SizedBox(width: 19), // matches HTML grid gap
        Expanded(child: cards[1]),
      ],
    );
  }
}

class _IconVectors {
  // This class is a simple holder to annotate what icon vector set is referenced.
  final String hint;
  const _IconVectors({required this.hint});
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final _IconVectors vectors;
  const _CategoryCard({
    required this.title,
    required this.subtitle,
    required this.vectors,
  });

  @override
  Widget build(BuildContext context) {
    // Card size: 154x164 from HTML; using Expanded width, keep aspect with fixed height
    return Container(
      height: 164,
      decoration: BoxDecoration(
        color: CategoriesScreen.colorF8F9FB,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Image Icon frame (68x68) centered top with soft bg (opacity 0.6 white)
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Align(
              child: Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                // The original uses three vector layers per icon (base/dot/wave) from assets:
                // e.g. assets/categories-vector-755-2329.svg, -2330.svg, -2331.svg
                // Without flutter_svg, we simulate the presence with a subtle inner box.
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFA1ABC0), width: 1.2),
                  ),
                ),
              ),
            ),
          ),
          // Divider line at y ~112
          const Positioned(
            left: 28,
            right: 28,
            top: 112,
            child: _Hairline(),
          ),
          // Titles
          Positioned(
            left: 26,
            top: 126,
            right: 10,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                height: 18 / 13,
                fontWeight: FontWeight.w600,
                color: Colors.black, // dark variant used by some cards
              ),
            ),
          ),
          Positioned(
            left: 26,
            top: 146,
            right: 10,
            child: Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                height: 15 / 11,
                color: CategoriesScreen.color777784,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Hairline extends StatelessWidget {
  const _Hairline();
  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: CategoriesScreen.colorE0E2EE);
  }
}

class _BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This simulates the bottom nav layout elements from the HTML file for this screen.
    return SizedBox(
      height: 103,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            top: 14,
            child: Container(
              decoration: const BoxDecoration(
                color: CategoriesScreen.colorF8F9FB,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(color: Color(0xFFD0DAC9), blurRadius: 17, offset: Offset(0, -11)),
                ],
              ),
            ),
          ),
          // Home notch decorative circle (from assets/categories-ellipse-2-755-2301.svg concept)
          const Positioned(
            left: 22,
            bottom: 70,
            child: SizedBox(
              width: 70,
              height: 70,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Color(0xFFC4C4C4), shape: BoxShape.circle),
              ),
            ),
          ),
          // Action items
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Home "diamond"/circle (asset: categories-polygon-1-755-2303.svg)
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: const BoxDecoration(
                          color: CategoriesScreen.color1E222B,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 56,
                        height: 56,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Categories center circle strokes (asset: categories-stroke-1/3/5/7...svg)
                  _RoundIcon(
                    tooltip: 'Categories',
                    color: const Color(0xFF3E4554),
                    onTap: () {},
                  ),
                  const SizedBox(width: 24),
                  // Favourite (asset: categories-iconly-two-tone-heart-755-2312.svg)
                  _BottomTextIcon(
                    label: 'Favourite',
                    color: const Color(0xFF3E4554),
                    onTap: () {},
                  ),
                  const SizedBox(width: 24),
                  // More (asset: categories-coolicon-755-2309.svg)
                  _BottomTextIcon(
                    label: 'More',
                    color: const Color(0xFF3E4554),
                    onTap: () {},
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

class _RoundIcon extends StatelessWidget {
  final String tooltip;
  final Color color;
  final VoidCallback onTap;
  const _RoundIcon({required this.tooltip, required this.color, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkResponse(
        onTap: onTap,
        radius: 24,
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: color, width: 2)),
        ),
      ),
    );
  }
}

class _BottomTextIcon extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;
  const _BottomTextIcon({required this.label, required this.color, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(onPressed: onTap, icon: Icon(Icons.circle_outlined, color: color, size: 24)),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            height: 16 / 12,
            color: Color(0xFF8891A5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
