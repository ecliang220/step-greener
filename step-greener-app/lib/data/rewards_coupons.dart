// For later use to label data objects
enum CouponStatus {
  unlocked,
  locked,
  redeemed,
  expired
}

class RewardsCoupons {
  static final List<Map<String, String>> unlockedCoupons = [
    {
      'image': 'assets/images/neomonde_logo.jpg',
      'title': 'Neomonde',
      'description': 'Enjoy \$1 off your next order!',
      'details': 'Minimum order of \$12 required.',
      'expiration': '2025-04-01',
      'points': '20',
      'status': 'unlocked'
    },
    {
      'image': 'assets/images/chipotle_logo.png',
      'title': 'Chipotle',
      'description': 'Enjoy \$2 off your next order!',
      'details': 'Minimum order of \$15 required.',
      'expiration': '2025-04-01',
      'points': '40',
      'status': 'unlocked'
    },
  ];

  static final List<Map<String, String>> unlockNowCoupons = [
    {
      'image': 'assets/images/cava_logo.jpg',
      'title': 'CAVA',
      'description': 'Free order of classic pita chips',
      'details': 'with the purchase of a bowl.',
      'expiration': '2025-05-01',
      'points': '60',
      'status': 'locked'
    },
    {
      'image': 'assets/images/cava_logo.jpg',
      'title': 'CAVA',
      'description': 'Enjoy \$2 off your next order!',
      'details': 'Minimum order of \$15 required.',
      'expiration': '2025-05-01',
      'points': '40',
      'status': 'locked'
    },
    {
      'image': 'assets/images/bulbox_logo.png',
      'title': 'Bul Box',
      'description': '10% off your next bowl!',
      'details': 'Restrictions apply.',
      'expiration': '2025-05-01',
      'points': '30',
      'status': 'locked'
    },
    {
      'image': 'assets/images/neomonde_logo.jpg',
      'title': 'Neomonde',
      'description': 'Enjoy \$1 off your next order!',
      'details': 'Minimum order of \$12 required.',
      'expiration': '2025-05-01',
      'points': '20',
      'status': 'locked'
    },
    {
      'image': 'assets/images/neomonde_logo.jpg',
      'title': 'Neomonde',
      'description': '10% off your next bowl!',
      'details': 'Restrictions apply.',
      'expiration': '2025-05-01',
      'points': '30',
      'status': 'locked'
    },
    {
      'image': 'assets/images/sweetgreen_logo.png',
      'title': 'Sweetgreen',
      'description': '\$5 off your next order!',
      'details': 'Minimum order of \$20 required.',
      'expiration': '2025-05-01',
      'points': '100',
      'status': 'locked'
    },
  ];

  static final List<Map<String, String>> redeemedCoupons = [
    {
      'image': 'assets/images/cava_logo.jpg',
      'title': 'CAVA',
      'description': 'Free order of classic pita chips',
      'details': 'with the purchase of a bowl.',
      'expiration': '2025-02-01',
      'points': '60',
      'status': 'redeemed'
    },
    {
      'image': 'assets/images/raleighraw_logo.png',
      'title': 'Raleigh Raw',
      'description': 'Free add-on!',
      'details': 'Valid on regular-sized smoothies or bowls',
      'expiration': '2025-02-15',
      'points': '50',
      'status': 'redeemed'
    },
  ];

  static final List<Map<String, String>> expiredCoupons = [
    {
      'image': 'assets/images/chipotle_logo.png',
      'title': 'Chipotle',
      'description': '10% off your next order!',
      'details': 'Minimum order of \$20 required.',
      'expiration': '2025-01-01',
      'points': '50',
      'status': 'expired'
    },
    {
      'image': 'assets/images/sweetgreen_logo.png',
      'title': 'Sweetgreen',
      'description': '\$5 off your next order!',
      'details': 'Minimum order of \$20 required.',
      'expiration': '2025-01-01',
      'points': '100',
      'status': 'expired'
    },
  ];
}