import 'package:flutter/material.dart';
import 'package:interface_example1/data_models/overview_data.dart';

import 'info_card.dart';

class OverviewCardsMedium extends StatelessWidget {
  const OverviewCardsMedium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
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
          ],
        ),
        SizedBox(
          height: _width / 64,
        ),
        Row(
          children: [
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
        ),
      ],
    );
  }
}
