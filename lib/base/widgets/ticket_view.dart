import 'package:flutter/material.dart';
import 'package:flutter_app/base/res/styles/app_styles.dart';
import 'package:flutter_app/base/widgets/app_coloum_text_layout.dart';
import 'package:flutter_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:flutter_app/base/widgets/big_circle.dart';
import 'package:flutter_app/base/widgets/big_dot.dart';
import 'package:flutter_app/base/widgets/text_style_fourth.dart';
import 'package:flutter_app/base/widgets/text_style_third.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic>? ticket;
  final bool wholeScreen;
  const TicketView({super.key, required this.ticket, this.wholeScreen = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    var ticket2 = ticket;
    return SizedBox(
      width: size.width * 0.85,
      height: 189,
      child: Container(
        margin: EdgeInsets.only(right: wholeScreen == true ? 0 : 16),
        child: Column(
          children: [
            // blue part of the ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppStyles.ticketBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(21),
                  topRight: Radius.circular(21),
                ),
              ),
              child: Column(
                children: [
                  //show depature and destination with icon first line
                  Row(
                    children: [
                      TextStyleThird(text: ticket!["from"]["code"]),
                      Expanded(child: Container()),
                      const BigDot(),
                      Expanded(
                        child: Stack(
                          children: [
                            const SizedBox(
                              height: 24,
                              child: AppLayoutBuilderWidget(randomDivider: 6),
                            ),
                            Center(
                              child: Transform.rotate(
                                angle: 1.5,
                                child: const Icon(
                                  Icons.local_airport_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const BigDot(),
                      Expanded(child: Container()),
                      TextStyleThird(text: ticket!["to"]["code"]),
                    ],
                  ),
                  const SizedBox(height: 3),
                  //show depature and destination name with time
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(text: ticket!["from"]["name"]),
                      ),
                      Expanded(child: Container()),
                      TextStyleFourth(text: ticket!["flying_time"]),
                      Expanded(child: Container()),
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(
                          text: ticket!["to"]["name"],
                          align: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //circles and dots
            Container(
              color: AppStyles.ticketOrange,
              child: const Row(
                children: [
                  BigCircle(isRight: false),
                  Expanded(
                    child: AppLayoutBuilderWidget(randomDivider: 16, width: 6),
                  ),
                  BigCircle(isRight: true),
                ],
              ),
            ),
            //orange part of the ticket
            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: AppStyles.ticketOrange,

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(21),

                  bottomRight: Radius.circular(21),
                ),
              ),

              child: Column(
                children: [
                  //show depature and destination with icon first line
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColoumTextLayout(
                        topText: ticket!["date"],
                        bottomText: "Date",
                        alignment: CrossAxisAlignment.start,
                      ),
                      AppColoumTextLayout(
                        topText: ticket!["departure_time"],
                        bottomText: "Departure time",
                        alignment: CrossAxisAlignment.center,
                      ),
                      AppColoumTextLayout(
                        topText: ticket2!["number"].toString(),
                        bottomText: "Number",
                        alignment: CrossAxisAlignment.end,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
