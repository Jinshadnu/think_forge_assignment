import 'package:flutter/material.dart';
import 'package:think_forge_assesment/core/theme/app_colors.dart';
import 'package:think_forge_assesment/core/widgets/custom_app_bar.dart';

class OverallPlScreen extends StatelessWidget {
  const OverallPlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildOverallPlCard(),
            const SizedBox(height: 24),
            _buildSearchInvestments(),
            const SizedBox(height: 16),
            _buildInvestmentList(),
          ],
        ),
      ),
    );
  }

  Widget _buildOverallPlCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade800, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF2D3748),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('MT51192', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
          ),
          const SizedBox(height: 24),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoColumn('Floating pnl', '+\$200.00', Colors.green),
                      const SizedBox(height: 16),
                      _buildInfoColumn('Margin', '\$20.00', Colors.white),
                    ],
                  ),
                ),
                const VerticalDivider(color: Colors.white24, thickness: 1, width: 20),
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoColumn('Net realized pnl', '-\$200.00', Colors.red),
                      const SizedBox(height: 16),
                      _buildInfoColumn('Free margin', '\$20.00', Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Text('Open positions: ', style: TextStyle(color: Colors.white70, fontSize: 14)),
              Text('10', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.white70, fontSize: 14)),
        const SizedBox(height: 8),
        Text(value, style: TextStyle(color: valueColor, fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildSearchInvestments() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Investments',
              hintStyle: TextStyle(color: Colors.grey.shade400),
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
              filled: true,
              fillColor: AppColors.cardColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.filter_list, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildInvestmentListHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Symbol', style: TextStyle(color: Colors.white70, fontSize: 12)),
          Text('Units', style: TextStyle(color: Colors.white70, fontSize: 12)),
          Text('Current Price', style: TextStyle(color: Colors.white70, fontSize: 12)),
          Text('Floating P/L', style: TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildInvestmentList() {
    return Column(
      children: [
        _buildInvestmentListHeader(),
        const SizedBox(height: 8),
        const InvestmentItem(
          symbol: 'USDXAUS',
          type: 'BUY',
          units: '100',
          currentPrice: '100.00',
          floatingPL: '+\$22.00',
          plColor: Colors.green,
          openPrice: '122.00',
          stopLoss: '10',
          takeProfit: '40',
          swap: '+20',
        ),
        const SizedBox(height: 16),
        const InvestmentItem(
          symbol: 'USDXEUR',
          type: 'SELL',
          units: '150',
          currentPrice: '150.00',
          floatingPL: '-\$12.00',
          plColor: Colors.red,
          openPrice: '122.00',
          stopLoss: '10',
          takeProfit: '40',
          swap: '+20',
        ),
        const SizedBox(height: 16),
        const InvestmentItem(
          symbol: 'USDXJPY',
          type: 'BUY',
          units: '200',
          currentPrice: '200.00',
          floatingPL: '+\$45.00',
          plColor: Colors.green,
          openPrice: '122.00',
          stopLoss: '10',
          takeProfit: '40',
          swap: '+20',
        ),
      ],
    );
  }
}

class InvestmentItem extends StatefulWidget {
  final String symbol, type, units, currentPrice, floatingPL;
  final Color plColor;
  final String? openPrice, stopLoss, takeProfit, swap;

  const InvestmentItem({
    Key? key,
    required this.symbol,
    required this.type,
    required this.units,
    required this.currentPrice,
    required this.floatingPL,
    required this.plColor,
    this.openPrice,
    this.stopLoss,
    this.takeProfit,
    this.swap,
  }) : super(key: key);

  @override
  _InvestmentItemState createState() => _InvestmentItemState();
}

class _InvestmentItemState extends State<InvestmentItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.openPrice != null) {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade800, width: 1),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.symbol, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(widget.type, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                ),
                Text(widget.units, style: const TextStyle(color: Colors.white)),
                Text(widget.currentPrice, style: const TextStyle(color: Colors.white)),
                Row(
                  children: [
                    Text(widget.floatingPL, style: TextStyle(color: widget.plColor, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    Icon(
                      _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            AnimatedCrossFade(
              firstChild: Container(),
              secondChild: _buildExpandedView(),
              crossFadeState: _isExpanded && widget.openPrice != null
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedView() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          _buildExpandedRow('Open Price', widget.openPrice ?? ''),
          const SizedBox(height: 8),
          _buildExpandedRow('Stop Loss', widget.stopLoss ?? ''),
          const SizedBox(height: 8),
          _buildExpandedRow('Take Profit', widget.takeProfit ?? ''),
          const SizedBox(height: 8),
          _buildExpandedRow('Swap', widget.swap ?? ''),
        ],
      ),
    );
  }

  Widget _buildExpandedRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white70)),
          Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
