import 'package:admere/src/timeline/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CONTEST SCHEDULE',
          style: textStyle.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => data[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final data = [
  TimelineTile(
    afterLineStyle: const LineStyle(
      thickness: 2,
    ),
    beforeLineStyle: const LineStyle(
      thickness: 2,
    ),
    isFirst: true,
    indicatorStyle: const IndicatorStyle(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      drawGap: true,
      height: 60,
      width: 60,
      indicator: Indicator(
        title: '6-9',
        subtitle: 'SEPT',
      ),
    ),
    endChild: const EndChild(
      title: 'Round 1',
      subtitle: 'Submissions will start at 4:00pm',
    ),
  ),
  TimelineTile(
    afterLineStyle: const LineStyle(
      thickness: 2,
    ),
    beforeLineStyle: const LineStyle(
      thickness: 2,
    ),
    indicatorStyle: const IndicatorStyle(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      drawGap: true,
      height: 60,
      width: 60,
      indicator: Indicator(
        title: '10',
        subtitle: 'SEPT',
      ),
    ),
    endChild: const EndChild(
      title: 'Results Round 1',
      subtitle: 'Results will be declared at 12 noon',
      gap: 0,
    ),
  ),
  TimelineTile(
    afterLineStyle: const LineStyle(
      thickness: 2,
    ),
    beforeLineStyle: const LineStyle(
      thickness: 2,
    ),
    indicatorStyle: const IndicatorStyle(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      drawGap: true,
      height: 60,
      width: 60,
      indicator: Indicator(
        title: '11-13',
        subtitle: 'SEPT',
      ),
    ),
    endChild: const EndChild(
      title: 'Round 2',
      subtitle: 'Submissions will start at 4:00pm',
    ),
  ),
  TimelineTile(
    afterLineStyle: const LineStyle(
      thickness: 2,
    ),
    beforeLineStyle: const LineStyle(
      thickness: 2,
    ),
    indicatorStyle: const IndicatorStyle(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      drawGap: true,
      height: 80,
      width: 60,
      indicator: Indicator(
        title: '14',
        subtitle: 'SEPT',
      ),
    ),
    endChild: const EndChild(
      title: 'Results Round 2',
      subtitle: 'Results will be declared at 12 noon',
      gap: 0,
    ),
  ),
  TimelineTile(
    afterLineStyle: const LineStyle(
      thickness: 2,
    ),
    beforeLineStyle: const LineStyle(
      thickness: 2,
    ),
    indicatorStyle: const IndicatorStyle(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      drawGap: true,
      height: 60,
      width: 60,
      indicator: Indicator(
        title: '15-17',
        subtitle: 'SEPT',
      ),
    ),
    endChild: const EndChild(
      title: 'Round 3',
      subtitle: 'Submissions will start at 4:00pm',
    ),
  ),
  TimelineTile(
    afterLineStyle: const LineStyle(
      thickness: 2,
    ),
    beforeLineStyle: const LineStyle(
      thickness: 2,
    ),
    isLast: true,
    indicatorStyle: const IndicatorStyle(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      drawGap: true,
      height: 80,
      width: 60,
      indicator: Indicator(
        title: '18',
        subtitle: 'SEPT',
      ),
    ),
    endChild: const EndChild(
      title: 'Results Round 3',
      subtitle: 'Results will be declared at 12 noon',
      gap: 0,
    ),
  ),
];
