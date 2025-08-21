import 'package:flutter/material.dart';

/// PUBLIC_INTERFACE
class TrackOrderScreen extends StatelessWidget {
  /// Track Order screen translated from Figma using exported assets and tokens.
  /// Sections:
  /// - Top bar: back chip, title "Track Order", cart badge
  /// - Order status timeline (Placed -> Packed -> On the way -> Delivered)
  /// - Map/vehicle illustration area
  /// - ETA card with address info and "Need Help?" action
  /// - Bottom action: "Back to Home"
  ///
  /// Notes on assets:
  /// For each icon/image we annotate the corresponding exported asset that would
  /// be used for high fidelity. As flutter_svg is not added, we simulate some
  /// shapes with Material widgets, while keeping asset references for wiring.
  const TrackOrderScreen({super.key});

  // Figma-based design tokens mapped from assets/common.css used across app
  static const Color colorFFFFFF = Color(0xFFFFFFFF);
  static const Color colorF8F9FB = Color(0xFFF8F9FB);
  static const Color colorFAFBFD = Color(0xFFFAFBFD);
  static const Color color2A4BA0 = Color(0xFF2A4BA0);
  static const Color color1E222B = Color(0xFF1E222B);
  static const Color color616A7D = Color(0xFF616A7D);
  static const Color colorB2BBCE = Color(0xFFB2BBCE);
  static const Color colorF9B023 = Color(0xFFF9B023);
  static const Color colorE9EAF4 = Color(0xFFE9EAF4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFFFFFF,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            children: [
              // Top bar: Back chip, Title, Cart badge
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  children: [
                    // Back circle (asset: e.g., track-ellipse-back.svg + track-chevron-left.svg)
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
                        // Asset ref: use 'assets/checkout-vector-754-4278.svg' chevron
                        child: const Center(
                          child: Icon(Icons.chevron_left, size: 22, color: color1E222B),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Track Order',
                      style: TextStyle(
                        fontSize: 16,
                        height: 24 / 16,
                        fontWeight: FontWeight.w400,
                        color: color1E222B,
                      ),
                    ),
                    const Spacer(),
                    // Cart bag + badge (asset: icon-cart-bag-754-3557.svg)
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

              const SizedBox(height: 16),

              // Order status timeline
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorF8F9FB,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
                  child: Column(
                    children: const [
                      _StatusRow(
                        // Asset: track-placed.svg
                        label: 'Order Placed',
                        timestamp: '10:02 AM',
                        active: true,
                        done: true,
                      ),
                      _TimelineConnector(),
                      _StatusRow(
                        // Asset: track-packed.svg
                        label: 'Packed',
                        timestamp: '10:35 AM',
                        active: true,
                        done: true,
                      ),
                      _TimelineConnector(),
                      _StatusRow(
                        // Asset: track-on-the-way.svg (vehicle icon)
                        label: 'On the way',
                        timestamp: '11:10 AM',
                        active: true,
                        done: false,
                      ),
                      _TimelineConnector(past: false),
                      _StatusRow(
                        // Asset: track-delivered.svg
                        label: 'Delivered',
                        timestamp: '—',
                        active: false,
                        done: false,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Map/Vehicle Illustration
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 180,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF3FD),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      // Asset: An illustration like grocery-home-mask-group-754-3527.png
                      // We use a known exported banner/mask image to simulate a map snapshot area.
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/grocery-home-mask-group-754-3527.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Asset: track-vehicle.svg (simulate with an icon on path)
                      Positioned(
                        left: 28,
                        top: 48,
                        child: _VehicleMarker(),
                      ),
                      // Asset: track-pin-destination.svg (simulate destination pin)
                      Positioned(
                        right: 24,
                        bottom: 24,
                        child: _DestinationPin(),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ETA + Address card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorF8F9FB,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          // Asset: clock icon (use material icon)
                          Icon(Icons.access_time, color: color2A4BA0, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Estimated delivery time',
                            style: TextStyle(
                              fontSize: 14,
                              height: 20 / 14,
                              color: color616A7D,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '12:05 PM',
                            style: TextStyle(
                              fontSize: 14,
                              height: 20 / 14,
                              color: color1E222B,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Divider(height: 1, color: colorE9EAF4),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          // Asset: location pin
                          Icon(Icons.location_on_outlined, color: color2A4BA0),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Green Way 3000, Sylhet, Bangladesh',
                              style: TextStyle(
                                fontSize: 14,
                                height: 20 / 14,
                                color: color1E222B,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Need Help?',
                            style: TextStyle(
                              fontSize: 14,
                              height: 20 / 14,
                              color: color2A4BA0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Bottom action
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
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
                      Navigator.popUntil(context, (r) => r.isFirst);
                    },
                    child: const Text(
                      'Back to Home',
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

class _StatusRow extends StatelessWidget {
  final String label;
  final String timestamp;
  final bool active;
  final bool done;

  const _StatusRow({
    required this.label,
    required this.timestamp,
    required this.active,
    required this.done,
  });

  @override
  Widget build(BuildContext context) {
    const Color activeColor = TrackOrderScreen.color2A4BA0;
    const Color doneColor = TrackOrderScreen.colorF9B023;
    const Color idleColor = TrackOrderScreen.colorB2BBCE;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline dot
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: done
                ? doneColor
                : (active ? activeColor : idleColor.withValues(alpha: 0.6)),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  height: 20 / 14,
                  color: active ? TrackOrderScreen.color1E222B : TrackOrderScreen.color616A7D,
                  fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                timestamp,
                style: const TextStyle(
                  fontSize: 12,
                  height: 16 / 12,
                  color: TrackOrderScreen.color616A7D,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TimelineConnector extends StatelessWidget {
  final bool past;
  const _TimelineConnector({this.past = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(9, 4, 9, 8),
      child: Container(
        width: 2,
        height: 24,
        color: past
            ? TrackOrderScreen.colorF9B023
            : TrackOrderScreen.colorB2BBCE.withValues(alpha: 0.5),
      ),
    );
  }
}

class _VehicleMarker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Asset: track-vehicle.svg
    return Column(
      children: [
        // Vehicle body
        Container(
          width: 28,
          height: 18,
          decoration: BoxDecoration(
            color: TrackOrderScreen.color2A4BA0,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 2),
        // Wheels
        Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: TrackOrderScreen.color1E222B,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: TrackOrderScreen.color1E222B,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DestinationPin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Asset: track-pin-destination.svg
    return Column(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: const BoxDecoration(
            color: TrackOrderScreen.colorF9B023,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 2,
          height: 18,
          color: TrackOrderScreen.colorF9B023,
        ),
      ],
    );
  }
}
