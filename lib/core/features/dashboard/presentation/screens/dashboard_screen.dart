import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:think_forge_assesment/app/routes/app_routes.dart';
import 'package:think_forge_assesment/core/widgets/custom_app_bar.dart';
import 'package:think_forge_assesment/core/widgets/marquee_screen.dart';
import 'package:think_forge_assesment/core/theme/app_colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MarqueeScreen(),
            const SizedBox(height: 24),
            _buildBalanceCard(),
            const SizedBox(height: 24),
            _buildPromoBanner(),
            const SizedBox(height: 24),
            _buildTransactionsOverview(),
            const SizedBox(height: 24),
            _buildProfitLossSection(context),
            const SizedBox(height: 24),
            _buildTradingTipsSection(),
            const SizedBox(height: 24),
            _buildLearnTradingSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Balance',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '\$5,231.89',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.account_balance_wallet),
                label: const Text('Deposit'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_upward),
                label: const Text('Withdraw'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(color: Colors.grey.shade800),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPromoBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Image.asset(
            'assets/images/frame.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 120,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Ring in the New Year with amazing savings!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'From multi-swaps to top picks, everything you love is now at year-end prices.',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Icon(
                  Icons.close,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSelector() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTimeButton('W', false),
          _buildTimeButton('M', false),
          _buildTimeButton('Y', false),
        ],
      ),
    );
  }

  Widget _buildTimeButton(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTransactionsOverview() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade800, // border color
          width: 1,             // border width
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Transactions Overview',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTimeSelector(),
                  const SizedBox(height: 24),
                  const Text('Transactions (1M)', style: TextStyle(color: Colors.white70, fontSize: 12)),
                  const SizedBox(height: 8),
                  const Text(
                    '\$556.89',
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: 120,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      barTouchData: BarTouchData(enabled: false),
                      barGroups: [
                        _makeGroupData(0, 5),
                        _makeGroupData(1, 9),
                        _makeGroupData(2, 6.5),
                        _makeGroupData(3, 4),
                        _makeGroupData(4, 8),
                        _makeGroupData(5, 7.5, isTouched: true),
                        _makeGroupData(6, 9.5, color: Colors.purple.shade300),
                      ],
                      titlesData: FlTitlesData(
                        leftTitles: const AxisTitles(),
                        rightTitles: const AxisTitles(),
                        topTitles: const AxisTitles(),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 32,
                            getTitlesWidget: (value, meta) {
                              const style = TextStyle(color: Colors.white70, fontSize: 12);
                              String text;
                              switch (value.toInt()) {
                                case 3:
                                  text = 'Jun';
                                  break;
                                case 4:
                                  text = 'July';
                                  break;
                                case 5:
                                  text = 'Aug';
                                  break;
                                case 6:
                                  text = 'Sep';
                                  break;
                                default:
                                  text = '';
                                  break;
                              }
                              return SideTitleWidget(
                                axisSide: meta.axisSide,
                                space: 4,
                                child: Text(text, style: style),
                              );
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      gridData: const FlGridData(show: false),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildTransactionSummaryItem(
                  'Referred',
                  '+\$105.89',
                  Icons.card_giftcard,
                  Colors.purple,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTransactionSummaryItem(
                  'Bonus',
                  '+\$56.89',
                  Icons.star,
                  Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  BarChartGroupData _makeGroupData(int x, double y, {bool isTouched = false, Color? color}) {
    final barColor = color ?? (isTouched ? Colors.green : Colors.white);
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: barColor,
          width: 22,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }

  Widget _buildTransactionSummaryItem(String title, String amount, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade800,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                amount,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfitLossSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade800,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overall P/L',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MT51192',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text('MT5 ID', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    '+\$200.00',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text('Floating pnl', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    '22',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text('Open position', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildProfitLossItem(
            'Buy',
            'USDXAU',
            'SL: \$14.00 TP: +\$44.00',
            '+\$244.00',
            '\$10.00 x 2.47 lots',
            true,
          ),
          const SizedBox(height: 16),
          _buildProfitLossItem(
            'Sell',
            'USDXAU',
            'SL: \$14.00 TP: +\$44.00',
            '-\$244.00',
            '\$10.00 x 2.47 lots',
            false,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.overallPl);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('View All'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProfitLossItem(
      String type, String pair, String slTp, String amount, String details, bool isProfit) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2632),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF2D3748),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              type,
              style: TextStyle(
                color: isProfit ? Colors.greenAccent : Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pair,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(slTp, style: const TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  color: isProfit ? Colors.greenAccent : Colors.redAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(details, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTradingTipsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF171717),
            Color(0xFF1DFFAA),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: const Color(0xFF404040)),
      ),
      child: Column(
        children: [
          const Text(
            'Always use a stop-loss. It protects your capital and prevents small losses from turning into account blowouts — discipline beats guessing every time.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Trading Tips',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 8, height: 8, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.3))),
              const SizedBox(width: 8),
              Container(width: 8, height: 8, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white)),
              const SizedBox(width: 8),
              Container(width: 8, height: 8, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.3))),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildLearnTradingSection() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/trading.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
