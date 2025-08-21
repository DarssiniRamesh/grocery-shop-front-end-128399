import 'package:flutter/material.dart';

/// PUBLIC_INTERFACE
class CheckoutScreen extends StatelessWidget {
  /// Checkout screen translated from assets/checkout-754-4266.html and CSS.
  /// Structure:
  /// - Top bar with back chip, title "Checkout", and cart badge
  /// - Address block with chevron
  /// - Payment method block with chevron
  /// - Order summary (subtotal, delivery, total)
  /// - Place Order button
  ///
  /// Notes:
  /// - SVG assets are referenced in comments; for rendering we use simple
  ///   Flutter shapes to avoid extra dependencies and keep parity with other screens.
  const CheckoutScreen({super.key});

  // Design tokens mapped from assets/common.css
  static const Color colorFFFFFF = Color(0xFFFFFFFF);
  static const Color colorF8F9FB = Color(0xFFF8F9FB);
  static const Color color2A4BA0 = Color(0xFF2A4BA0);
  static const Color color1E222B = Color(0xFF1E222B);
  static const Color color616A7D = Color(0xFF616A7D);
  static const Color colorB2BBCE = Color(0xFFB2BBCE);
  static const Color colorF9B023 = Color(0xFFF9B023);
  static const Color colorFAFBFD = Color(0xFFFAFBFD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            children: [
              // Top bar
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  children: [
                    // Back circle (checkout-ellipse-136-754-4275.svg) + chevron (checkout-vector-754-4278.svg)
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
                        child: const Center(
                          child: Icon(Icons.chevron_left, size: 22, color: color1E222B),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Checkout',
                      style: TextStyle(
                        fontSize: 16,
                        height: 24 / 16,
                        fontWeight: FontWeight.w400,
                        color: color1E222B,
                      ),
                    ),
                    const Spacer(),
                    // Cart bag with badge (checkout-ellipse-134-754-4299.svg and fill-4-754-4300.svg)
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: color1E222B, width: 1.5),
                          ),
                        ),
                        Positioned(
                          right: -6,
                          top: -8,
                          child: _Badge(
                            text: '2',
                            background: colorF9B023,
                            foreground: colorFAFBFD,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Address block
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _SectionCard(
                  title: 'Delivery Address',
                  subtitle: 'Green Way 3000, Sylhet',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Change address')),
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),

              // Payment method block
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _SectionCard(
                  title: 'Payment Method',
                  subtitle: 'Visa •••• 2109',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Change payment method')),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Order summary
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorF8F9FB,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                  child: Column(
                    children: const [
                      _SummaryRow(label: 'Subtotal', value: '\$35.96'),
                      SizedBox(height: 12),
                      _SummaryRow(label: 'Delivery', value: '\$2.00'),
                      SizedBox(height: 12),
                      Divider(height: 1, color: Color(0xFFE9EAF4)),
                      SizedBox(height: 12),
                      _SummaryRow(label: 'Total', value: '\$37.96', bold: true),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Place Order button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color2A4BA0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      elevation: 0,
                    ),
                    onPressed: () {
                      // Navigate to a Track Order screen if/when implemented.
                      // For now, just show confirmation.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Order placed')),
                      );
                    },
                    child: const Text(
                      'Place Order',
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
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        height: 88,
        decoration: BoxDecoration(
          color: CheckoutScreen.colorF8F9FB,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            // Left circle placeholder (would be an icon, e.g., address or card icon)
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: CheckoutScreen.colorFFFFFF,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.location_on_outlined, color: CheckoutScreen.color2A4BA0),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DefaultTextStyle(
                style: const TextStyle(color: CheckoutScreen.color1E222B),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 19 / 14,
                        fontWeight: FontWeight.w600,
                        color: CheckoutScreen.color1E222B,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        height: 16 / 12,
                        color: CheckoutScreen.color616A7D,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.chevron_right, color: CheckoutScreen.colorB2BBCE),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            height: 20 / 14,
            color: CheckoutScreen.color616A7D,
            fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            height: 20 / 14,
            color: CheckoutScreen.color1E222B,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
      ],
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
