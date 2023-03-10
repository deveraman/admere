import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> with SingleTickerProviderStateMixin {
  // TODO: implement animation
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

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
                itemBuilder: (context, index) => AnimatedSlide(
                  offset: Offset(0.0, _animationController.value),
                  duration: const Duration(milliseconds: 500),
                  child: data[index],
                ),
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

class Indicator extends StatelessWidget {
  const Indicator({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          title,
          style: textStyle.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.indigoAccent,
          ),
        ),
        Text(
          subtitle,
          style: textStyle.titleSmall!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.indigoAccent,
          ),
        ),
      ],
    );
  }
}

class EndChild extends StatelessWidget {
  const EndChild({
    required this.title,
    required this.subtitle,
    this.gap = 36.0,
    super.key,
  });

  final String title;
  final String subtitle;
  final double gap;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: gap,
        bottom: 36.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        constraints: const BoxConstraints(
          minHeight: 120,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: textStyle.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigoAccent,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                subtitle,
                style: textStyle.bodyLarge!.copyWith(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
