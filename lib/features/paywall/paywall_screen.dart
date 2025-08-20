import 'package:flutter/material.dart';
import '../../theme/tokens.dart';
import '../../widgets/primary_button.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formly Pro')),
      body: Padding(
        padding: const EdgeInsets.all(Tokens.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Unlock Formly Pro', style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: Tokens.s16),
            const _PriceTile(title: 'Monthly', price: '\$7.99', subtitle: 'Cancel anytime'),
            const SizedBox(height: Tokens.s8),
            const _PriceTile(title: 'Annual', price: '\$59.99', subtitle: '2 months free', highlight: true),
            const SizedBox(height: Tokens.s8),
            const _PriceTile(title: 'Lifetime (early bird)', price: '\$129.99', subtitle: 'Limited time'),
            const Spacer(),
            PrimaryButton(label: 'Subscribe', onPressed: () {}),
            const SizedBox(height: Tokens.s8),
            Center(
              child: Text('Restore purchases',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Tokens.text500)),
            ),
            const SizedBox(height: Tokens.s16),
          ],
        ),
      ),
    );
  }
}

class _PriceTile extends StatelessWidget {
  final String title;
  final String price;
  final String subtitle;
  final bool highlight;

  const _PriceTile({
    required this.title,
    required this.price,
    required this.subtitle,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Tokens.s16),
      decoration: BoxDecoration(
        color: highlight ? Tokens.brand500.withOpacity(.15) : Tokens.bg800,
        borderRadius: BorderRadius.circular(Tokens.r16),
        border: Border.all(color: highlight ? Tokens.brand500 : Tokens.bg800),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Tokens.text500)),
        ]),
        Text(price, style: Theme.of(context).textTheme.titleMedium),
      ]),
    );
  }
}
