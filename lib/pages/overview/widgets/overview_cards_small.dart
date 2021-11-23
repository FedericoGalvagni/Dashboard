import 'package:flutter/material.dart';
import 'package:interface_example1/data_models/overview_data.dart';
import 'package:interface_example1/pages/overview/widgets/info_card.dart';

class OverviewCardsSmall extends StatelessWidget {
  const OverviewCardsSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return SizedBox(
        height: 400,
        child: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: produzioneTotale,
                builder: (context, value, widget) {
                  return InfoCard(
                    title: "Total Production",
                    value: produzioneTotale.value.toString(),
                    onTap: () {},
                  );
                }),
            SizedBox(
              width: _width / 64,
            ),
            ValueListenableBuilder(
                valueListenable: produzioneUltime24h,
                builder: (context, value, widget) {
                  return InfoCard(
                    title: "Production 24H",
                    value: produzioneUltime24h.value.toString(),
                    onTap: () {},
                  );
                }),
            SizedBox(
              width: _width / 64,
            ),
            ValueListenableBuilder(
                valueListenable: produzioneMediaGiornaliera,
                builder: (context, value, widget) {
                  return InfoCard(
                    title: "Time",
                    value: produzioneMediaGiornaliera.value.toString(),
                    onTap: () {},
                  );
                }),
            SizedBox(
              width: _width / 64,
            ),
            ValueListenableBuilder(
                valueListenable: produzioneMediaOraria,
                builder: (context, value, widget) {
                  return InfoCard(
                    title: "Downtime",
                    value: produzioneMediaOraria.value.toString(),
                    onTap: () {},
                  );
                }),
          ],
        ));
  }
}
