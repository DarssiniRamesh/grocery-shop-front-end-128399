import 'package:flutter/material.dart';

void main() {
  runApp(const GroceryApp());
}

/// PUBLIC_INTERFACE
class GroceryApp extends StatelessWidget {
  /// This is the root widget for the Grocery mobile app. It sets up the app
  /// theme and routes, and launches the GroceryHomeScreen as the initial route.
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors and tokens translated from assets/common.css design tokens.
    const Color colorFFFFFF = Color(0xFFFFFFFF);
    const Color color2A4BA0 = Color(0xFF2A4BA0);
    const Color color1E222B = Color(0xFF1E222B);
    const Color colorF9B023 = Color(0xFFF9B023);
    const Color color616A7D = Color(0xFF616A7D);

    final theme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: colorFFFFFF,
      colorScheme: ColorScheme.fromSeed(
        seedColor: color2A4BA0,
        primary: color2A4BA0,
        secondary: colorF9B023,
        surface: colorFFFFFF,
        onSurface: color1E222B,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 30,
          height: 38 / 30,
          fontWeight: FontWeight.w400,
          color: color1E222B,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          height: 24 / 16,
          color: color616A7D,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 20 / 14,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          height: 16 / 12,
        ),
      ),
    );

    return MaterialApp(
      title: 'Grocery App',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const GroceryHomeScreen(),
      routes: {
        // PUBLIC_INTERFACE
        // Placeholder routes for bottom navigation and interactions.
        '/favourites': (_) => const PlaceholderScreen(title: 'Favourites'),
        '/categories': (_) => const PlaceholderScreen(title: 'Categories'),
        '/more': (_) => const PlaceholderScreen(title: 'More'),
        '/cart': (_) => const PlaceholderScreen(title: 'Cart'),
        '/search': (_) => const PlaceholderScreen(title: 'Search'),
        '/product': (_) => const PlaceholderScreen(title: 'Product Details'),
      },
    );
  }
}

/// PUBLIC_INTERFACE
class GroceryHomeScreen extends StatefulWidget {
  /// The Grocery Home screen that replicates the provided Figma/HTML layout:
  /// - AppBar greeting and cart button with badge
  /// - Search bar
  /// - Address + ETA row with chevrons
  /// - Promotional banner cards
  /// - Recommended section header
  /// - Horizontal product cards with price badge and add buttons
  /// - Category chips row
  /// - Bottom navigation
  const GroceryHomeScreen({super.key});

  @override
  State<GroceryHomeScreen> createState() => _GroceryHomeScreenState();
}

class _GroceryHomeScreenState extends State<GroceryHomeScreen> {
  int cartCount = 3; // dummy badge count

  @override
  Widget build(BuildContext context) {
    // Local constants for spacing/radius from tokens
    const double radius12 = 12;
    const double radius16 = 16;
    const double radius28 = 28;

    const Color colorFFFFFF = Color(0xFFFFFFFF);
    const Color color2A4BA0 = Color(0xFF2A4BA0);
    const Color colorB2BBCE = Color(0xFFB2BBCE);
    const Color colorF9B023 = Color(0xFFF9B023);
    const Color colorFFBC6E = Color(0xFFFFBC6E);
    const Color colorE0E2EE = Color(0xFFE0E2EE);
    const Color color616A7D = Color(0xFF616A7D);
    const Color color1E222B = Color(0xFF1E222B);
    const Color color3F3F3F = Color(0xFF3F3F3F);
    const Color colorF8F5EE = Color(0xFFF8F5EE);

    final size = MediaQuery.of(context).size;
    final double horizontalPadding = 20;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      // Custom bottom navigation to match design
      bottomNavigationBar: SafeArea(
        top: false,
        child: _BottomNav(
          onHome: () {},
          onFavourites: () => Navigator.pushNamed(context, '/favourites'),
          onCategories: () => Navigator.pushNamed(context, '/categories'),
          onMore: () => Navigator.pushNamed(context, '/more'),
        ),
      ),
      body: Stack(
        children: [
          // Top background area
          Positioned.fill(
            child: Column(
              children: [
                // Blue top area per design: fixed height similar to Figma (approx 252)
                Container(
                  height: 252,
                  width: double.infinity,
                  color: color2A4BA0,
                ),
                // remaining area stays white
                Expanded(
                  child: Container(color: colorFFFFFF),
                ),
              ],
            ),
          ),
          // Foreground scrollable content
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 140),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // AppBar-like row
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        horizontalPadding,
                        20, // approx top gap (SafeArea already applied)
                        horizontalPadding,
                        0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Greeting text: "Hey, Halal"
                          // Using explicit color constant local to this build scope.
                          const Text(
                            'Hey, Halal',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFF8F9FB), // colorF8F9FB
                              height: 1.0,
                            ),
                          ),
                          // Cart button with badge
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/cart'),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                // Asset: icon-cart-bag-754-3557.svg (used as image)
                                // In Flutter, we have it as an asset image (SVG simplified as PNG-like usage). The provided asset is SVG, but Image.asset can display SVG only via plugins.
                                // For this mock UI, we display the SVG as a normal asset by using it as a raw picture via an Image widget alternative approach is to use a placeholder Container simulating the cart outline.
                                // However, to keep dependencies minimal, we will embed it as raster by using the asset path; Flutter can't render SVG natively without flutter_svg, so we recreate a simple cart icon via Container decoration.
                                // To honor the asset mapping, we still annotate the asset usage here:
                                // Asset reference: assets/icon-cart-bag-754-3557.svg
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: colorFFFFFF, width: 1.5),
                                  ),
                                ),
                                Positioned(
                                  right: -6,
                                  top: -8,
                                  child: _Badge(
                                    text: '$cartCount',
                                    background: colorF9B023,
                                    foreground: colorFFFFFF,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Search bar
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        horizontalPadding,
                        20,
                        horizontalPadding,
                        0,
                      ),
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          color: const Color(0xFF153075), // slightly darker per HTML
                          borderRadius: BorderRadius.circular(radius28),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            // Asset: icon-search-754-3551.svg
                            _CircleIconDot(
                              size: 18,
                              color: const Color(0xFFF8F9FB), // colorF8F9FB
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextField(
                                onTap: () => Navigator.pushNamed(context, '/search'),
                                readOnly: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Search Products or store',
                                  hintStyle: const TextStyle(
                                    color: Color(0xFF8891A5), // color8891A5
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(
                                  color: Color(0xFFF8F9FB), // colorF8F9FB
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Address + Within row
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        horizontalPadding,
                        20,
                        horizontalPadding,
                        0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _LabelValueChevron(
                            // Asset: icon-chevron-754-3543.svg
                            label: 'Delivery to',
                            value: 'Green Way 3000, Sylhet',
                            chevronColor: colorB2BBCE,
                          ),
                          _LabelValueChevron(
                            // Asset: icon-chevron-754-3548.svg
                            label: 'Within',
                            value: '1 Hour',
                            chevronColor: colorB2BBCE,
                          ),
                        ],
                      ),
                    ),

                    // Banner cards
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        horizontalPadding,
                        20,
                        0,
                        0,
                      ),
                      child: SizedBox(
                        height: 123,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _BannerCard(
                              // Asset: banner-emblem-754-3591.png
                              background: colorF9B023,
                              emblemAsset: 'assets/banner-emblem-754-3591.png',
                              radius: radius16,
                            ),
                            const SizedBox(width: 12),
                            _BannerCard(
                              // Asset: banner-emblem-754-3596.png
                              background: colorFFBC6E,
                              emblemAsset: 'assets/banner-emblem-754-3596.png',
                              radius: radius16,
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                      ),
                    ),

                    // Section title: Recommended
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        horizontalPadding,
                        20,
                        horizontalPadding,
                        0,
                      ),
                      child: Text(
                        'Recommended',
                        style: textTheme.headlineMedium?.copyWith(
                          color: color1E222B,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    // Product cards horizontal scroll
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        horizontalPadding,
                        12,
                        0,
                        0,
                      ),
                      child: SizedBox(
                        height: 194,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _ProductCard(
                              // Asset: product-thumb-754-3601.png
                              thumbAsset: 'assets/product-thumb-754-3601.png',
                              title: 'Fresh Lemon',
                              subtitle: 'Organic',
                              unitText: 'Unit',
                              priceText: '\$12',
                              onAdd: () => _onAdd(context, 'Fresh Lemon'),
                              dividerColor: colorE0E2EE,
                              bgColor: const Color(0xFFF8F9FB), // colorF8F9FB
                              priceBg: colorFFFFFF,
                              priceColor: color3F3F3F,
                              subtitleColor: color616A7D,
                              titleColor: color1E222B,
                              radius: radius12,
                            ),
                            const SizedBox(width: 20),
                            _ProductCard(
                              // Asset: product-thumb-754-3611.png
                              thumbAsset: 'assets/product-thumb-754-3611.png',
                              title: 'Fresh Lemon',
                              subtitle: 'Organic',
                              unitText: 'Unit',
                              priceText: '\$12',
                              onAdd: () => _onAdd(context, 'Fresh Lemon (Alt)'),
                              dividerColor: colorE0E2EE,
                              bgColor: const Color(0xFFF8F9FB), // replaced undefined colorF8F9FB
                              priceBg: colorFFFFFF,
                              priceColor: color3F3F3F,
                              subtitleColor: color616A7D,
                              titleColor: color1E222B,
                              radius: radius12,
                              addColor: const Color(0xFFF55A00),
                            ),
                            const SizedBox(width: 20),
                            _ProductCard(
                              // Asset: product-thumb-754-3606.png
                              thumbAsset: 'assets/product-thumb-754-3606.png',
                              title: 'Green Tea',
                              subtitle: 'Organic',
                              unitText: 'Unit',
                              priceText: '\$06',
                              onAdd: () => _onAdd(context, 'Green Tea'),
                              dividerColor: colorE0E2EE,
                              bgColor: const Color(0xFFF8F9FB),
                              priceBg: colorFFFFFF,
                              priceColor: color3F3F3F,
                              subtitleColor: color616A7D,
                              titleColor: color1E222B,
                              radius: radius12,
                            ),
                            const SizedBox(width: 12),
                          ],
                        ),
                      ),
                    ),

                    // Categories chips
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        horizontalPadding - 12, // slight negative from HTML (8 px)
                        20,
                        0,
                        0,
                      ),
                      child: SizedBox(
                        height: 90,
                        width: size.width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            _CategoryChip(label: 'Juices', bg: colorF8F5EE),
                            SizedBox(width: 10),
                            _CategoryChip(label: 'Juice', bg: colorF8F5EE),
                            SizedBox(width: 10),
                            _CategoryChip(label: 'Fruits', bg: colorF8F5EE),
                            SizedBox(width: 10),
                            _CategoryChip(label: 'Meats', bg: colorF8F5EE),
                            SizedBox(width: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onAdd(BuildContext context, String product) {
    setState(() => cartCount += 1);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$product added to cart'),
        duration: const Duration(milliseconds: 600),
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
      decoration: BoxDecoration(
        color: background,
        shape: BoxShape.circle,
      ),
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

class _CircleIconDot extends StatelessWidget {
  final double size;
  final Color color;

  const _CircleIconDot({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    // A minimal circular dot to hint a magnifier icon spot without SVG dependency.
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.7),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _LabelValueChevron extends StatelessWidget {
  final String label;
  final String value;
  final Color chevronColor;

  const _LabelValueChevron({
    required this.label,
    required this.value,
    required this.chevronColor,
  });

  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          // label-12 style translation
          // "Delivery to" / "Within"
          '',
          style: TextStyle(fontSize: 0),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            height: 15 / 11,
            color: Color(0xFFFAFBFD), // colorFAFBFD
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                height: 20 / 14,
                color: Color(0xFFFAFBFD), // colorFAFBFD
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            // Asset: icon-chevron-754-354x.svg (down)
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 16,
              color: chevronColor,
            ),
          ],
        ),
      ],
    );
  }
}

class _BannerCard extends StatelessWidget {
  final Color background;
  final String emblemAsset; // PNG emblem asset
  final double radius;

  const _BannerCard({
    required this.background,
    required this.emblemAsset,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    const Color color130F26 = Color(0xFF130F26);

    return Container(
      width: 269,
      height: 123,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Stack(
        children: [
          // Emblem square at left
          Positioned(
            left: 18,
            top: 27,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                emblemAsset,
                width: 68,
                height: 68,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Copy
          Positioned.fill(
            left: 86, // spacing to the right of emblem
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Align(
                alignment: Alignment.centerLeft,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    color: color130F26,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Get',
                        style: TextStyle(
                          fontSize: 12,
                          height: 16 / 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '50%  OFF',
                        style: TextStyle(
                          fontSize: 26,
                          height: 32 / 26,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'On first 03 order',
                        style: TextStyle(
                          fontSize: 12,
                          height: 16 / 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String thumbAsset; // PNG thumb
  final String title;
  final String subtitle;
  final String unitText;
  final String priceText;
  final VoidCallback onAdd;
  final double radius;
  final Color dividerColor;
  final Color bgColor;
  final Color priceBg;
  final Color priceColor;
  final Color subtitleColor;
  final Color titleColor;
  final Color? addColor;

  const _ProductCard({
    required this.thumbAsset,
    required this.title,
    required this.subtitle,
    required this.unitText,
    required this.priceText,
    required this.onAdd,
    required this.radius,
    required this.dividerColor,
    required this.bgColor,
    required this.priceBg,
    required this.priceColor,
    required this.subtitleColor,
    required this.titleColor,
    this.addColor,
  });

  @override
  Widget build(BuildContext context) {
    const Color color2A4BA0 = Color(0xFF2A4BA0);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/product'),
      child: Container(
        width: 128,
        height: 194,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 2),
              color: Color(0x0F000000), // rgba(0,0,0,0.06) approx
            )
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Thumb
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      thumbAsset,
                      width: 68,
                      height: 68,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                // Title
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    height: 20 / 14,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    height: 16 / 12,
                    color: subtitleColor,
                  ),
                ),
              ],
            ),
            // Divider line
            Positioned(
              left: 12,
              right: 12,
              top: 112,
              child: Container(
                height: 0.5,
                color: dividerColor,
              ),
            ),
            // Price + add button
            Positioned(
              left: 8,
              right: 8,
              bottom: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _PriceBadge(
                    unitText: unitText,
                    priceText: priceText,
                    bg: priceBg,
                    priceColor: priceColor,
                  ),
                  _AddButton(
                    color: addColor ?? color2A4BA0,
                    onTap: onAdd,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceBadge extends StatelessWidget {
  final String unitText;
  final String priceText;
  final Color bg;
  final Color priceColor;

  const _PriceBadge({
    required this.unitText,
    required this.priceText,
    required this.bg,
    required this.priceColor,
  });

  @override
  Widget build(BuildContext context) {


    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            offset: Offset(0, 2),
            color: Color(0x0F000000),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            unitText,
            style: const TextStyle(
              fontSize: 11,
              height: 15 / 11,
              color: Color(0xFF8891A5), // color8891A5
            ),
          ),
          const SizedBox(width: 6),
          Text(
            priceText,
            style: TextStyle(
              fontSize: 14,
              height: 19 / 14,
              color: priceColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatefulWidget {
  final Color color;
  final VoidCallback onTap;

  const _AddButton({required this.color, required this.onTap});

  @override
  State<_AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<_AddButton> {
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
          color: pressed ? widget.color.withValues(alpha: 0.85) : widget.color,
          borderRadius: BorderRadius.circular(12),
        ),
        // Simple plus icon using two rectangles like the HTML/CSS version
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 12, height: 2, color: Colors.white),
            Container(width: 2, height: 12, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final Color bg;

  const _CategoryChip({required this.label, required this.bg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 86,
      height: 90,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          height: 19 / 14,
          color: Color(0xFF777784),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onFavourites;
  final VoidCallback onCategories;
  final VoidCallback onMore;

  const _BottomNav({
    required this.onHome,
    required this.onFavourites,
    required this.onCategories,
    required this.onMore,
  });

  @override
  Widget build(BuildContext context) {
    const Color colorF8F9FB = Color(0xFFF8F9FB);


    return SizedBox(
      height: 103,
      child: Stack(
        children: [
          // Background rounded top
          Positioned.fill(
            top: 14,
            child: Container(
              decoration: const BoxDecoration(
                color: colorF8F9FB,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  // approximate shadow from CSS
                  BoxShadow(
                    color: Color(0xFFD0DAC9),
                    blurRadius: 17,
                    offset: Offset(0, -11),
                  ),
                ],
              ),
            ),
          ),
          // "Home" notch decorative circle (from Figma). We simulate by placing a faint circle over the home button area.
          Positioned(
            left: 22,
            bottom: 70,
            child: Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                color: Color(0xFFC4C4C4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Buttons row
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Home
                  _NavHome(onPressed: onHome),
                  const SizedBox(width: 32),
                  // Favourite
                  _NavItem(
                    // Asset: icon-heart-754-3575.svg
                    label: 'Favourite',
                    onPressed: onFavourites,
                    iconBuilder: (ctx, color) => Icon(Icons.favorite_border, size: 24, color: color),
                  ),
                  const SizedBox(width: 24),
                  // Categories
                  _NavItem(
                    // Asset: icon-category-754-3578.svg
                    label: 'Categories',
                    onPressed: onCategories,
                    iconBuilder: (ctx, color) => Icon(Icons.grid_view, size: 24, color: color),
                  ),
                  const Spacer(),
                  // More
                  _NavItem(
                    // Asset: icon-more-vertical-754-3572.svg
                    label: 'More',
                    onPressed: onMore,
                    iconBuilder: (ctx, color) => Icon(Icons.more_vert, size: 24, color: color),
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

class _NavHome extends StatelessWidget {
  final VoidCallback onPressed;

  const _NavHome({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // Asset: home-diamond-754-3567.svg
    return SizedBox(
      width: 56,
      height: 56,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Container(
          width: 56,
          height: 56,
          decoration: const BoxDecoration(
            // Simulate filled diamond via a rounded square for placeholder
            color: Color(0xFF1E222B),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Widget Function(BuildContext, Color) iconBuilder;

  const _NavItem({
    required this.label,
    required this.onPressed,
    required this.iconBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: iconBuilder(context, const Color(0xFF3E4554)),
        ),
        const SizedBox(height: 6),
        const Text(
          '',
          style: TextStyle(fontSize: 0),
        ),
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

/// PUBLIC_INTERFACE
class PlaceholderScreen extends StatelessWidget {
  /// Simple placeholder page used as navigation stubs for Home, Favourites, Categories, More, Cart, Search, and Product Details.
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text('$title screen'),
      ),
    );
  }
}
