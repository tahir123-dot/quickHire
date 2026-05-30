import 'package:flutter/material.dart';

class BookingCardR extends StatelessWidget {
  final String url;
  final String name;
  final String location;
  final String dateAndday;
  final String time;
  final String duration;
  final int price;
  final int totalServices;
  final List<String> services;
  final String teamUrl;
  final String teamName;
  final String status;

  const BookingCardR({
    super.key,
    required this.url,
    required this.name,
    required this.location,
    required this.dateAndday,
    required this.time,
    required this.duration,
    required this.price,
    required this.totalServices,
    required this.services,
    required this.teamUrl,
    required this.teamName,
    required this.status,
  });

  // Status badge config
  Color get _statusColor => switch (status.toLowerCase()) {
    'confirmed' => const Color(0xFF3B6D11),
    'pending' => const Color(0xFF854F0B),
    'cancelled' => const Color(0xFFA32D2D),
    _ => Colors.grey,
  };

  Color get _statusBg => switch (status.toLowerCase()) {
    'confirmed' => const Color(0xFFEAF3DE),
    'pending' => const Color(0xFFFAEEDA),
    'cancelled' => const Color(0xFFFCEBEB),
    _ => Colors.grey.shade100,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.15),
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          // ── Top: Avatar + Name + Location + Status ──
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                // Avatar
                CircleAvatar(
                  radius: 24,
                  backgroundImage: url.isNotEmpty ? NetworkImage(url) : null,
                  backgroundColor: const Color(0xFFEEEDFE),
                  child: url.isEmpty
                      ? Text(
                          name[0],
                          style: const TextStyle(
                            color: Color(0xFF534AB7),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        )
                      : null,
                ),

                const SizedBox(width: 10),

                // Name + location
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 13,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            location,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Status badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: _statusBg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: _statusColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Divider ──
          Divider(height: 1, color: Colors.grey.withValues(alpha: 0.15)),

          // ── Tarikh | Waqt | Total ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  // Tarikh
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tarikh',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          dateAndday.split(' ').take(4).join(' '), // date line
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        Text(
                          dateAndday.split(' ').last, // day
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  VerticalDivider(
                    color: Colors.grey.withValues(alpha: 0.2),
                    width: 24,
                  ),

                  // Waqt
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Waqt',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          time,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        Text(
                          duration,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  VerticalDivider(
                    color: Colors.grey.withValues(alpha: 0.2),
                    width: 24,
                  ),

                  // Total
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Rs $price',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF534AB7),
                          ),
                        ),
                        Text(
                          '$totalServices service',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Divider ──
          Divider(height: 1, color: Colors.grey.withValues(alpha: 0.15)),

          // ── Services chips + Team member ──
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                // Services chips
                Row(
                  children: [
                    const Icon(Icons.content_cut, size: 16, color: Colors.grey),
                    const SizedBox(width: 8),
                    Wrap(
                      spacing: 6,
                      children: services
                          .map(
                            (s) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.withValues(alpha: 0.3),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                s,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF1A1A1A),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Team member
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundImage: teamUrl.isNotEmpty
                            ? NetworkImage(teamUrl)
                            : null,
                        backgroundColor: const Color(0xFFEEEDFE),
                        child: teamUrl.isEmpty
                            ? Text(
                                teamName[0],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF534AB7),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Team member',
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                          Text(
                            teamName,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.manage_accounts_outlined,
                        color: Color(0xFF534AB7),
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ── Divider ──
          Divider(height: 1, color: Colors.grey.withValues(alpha: 0.15)),

          // ── Buttons ──
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Cancel
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFF09595)),
                      foregroundColor: const Color(0xFFA32D2D),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                // Done Mark karo
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF534AB7),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Done Mark karo',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
