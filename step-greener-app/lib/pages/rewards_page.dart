import 'package:flutter/material.dart';
import 'package:step_greener/data/rewards_coupons.dart';
import 'package:step_greener/theme/app_colors.dart';
import 'package:step_greener/widgets/page_template.dart';
import 'package:step_greener/widgets/points_display.dart';

class RewardsPage extends StatelessWidget {
  static const PageType pageType = PageType.rewards;

  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCouponSection('Unlocked', RewardsCoupons.unlockedCoupons),
            SizedBox(height: 20,),
            _buildCouponSection('Unlock Now!', RewardsCoupons.unlockNowCoupons, 
                                  subtitle: "Spend your points! You earned them!"),
            SizedBox(height: 20,),
            _buildCouponSection('Redeemed', RewardsCoupons.redeemedCoupons),
            SizedBox(height: 20,),
            _buildCouponSection('Expired', RewardsCoupons.expiredCoupons),
          ],
        ),
      ),
    );
  }

  Widget _buildCouponSection(String title, List<Map<String, String>> coupons, { String subtitle = "" }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25),
            child: Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primaryText),
            ),
          ),
          // Section Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ( subtitle == "" ) ? SizedBox.shrink() : Text( subtitle, style: TextStyle( fontSize: 14, fontStyle: FontStyle.italic ), ),
          ),
          // Coupons in this section
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: coupons.length,
            itemBuilder: (context, index) {
              return CouponCard(coupon: coupons[index]);
            },
          ),
        ],
      ),
    );
  }
}

class CouponCard extends StatelessWidget {
  final Map<String, String> coupon;

  const CouponCard({super.key, required this.coupon});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.couponBorder,
                  width: 3, 
                ),
                borderRadius: BorderRadius.circular(3)
              ),
              child: 
                // Image on the left
                Image.asset(
                  coupon['image']!,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          coupon['title']!,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        PointsDisplay(points: int.parse(coupon['points']!), minWidth: 65)
                      ],
                    ),
                    SizedBox( height: 5 ),
                    // Description
                    Text(
                      coupon['description']!,
                      style: TextStyle(color: Colors.black),
                      softWrap: true,
                    ),
                    Text(
                      coupon['details']!,
                      style: TextStyle(color: Colors.grey[700], fontSize: 10),
                    ),
                    SizedBox( height: 5 ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Expires: ${coupon['expiration']}',
                        style: TextStyle(color: Colors.red, fontSize: 10),
                      ),
                    )
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
