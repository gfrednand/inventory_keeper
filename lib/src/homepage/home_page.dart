import 'package:flutter/material.dart';

///
class HomePage extends StatelessWidget {
  ///
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 100,
          stretch: true,
          backgroundColor: Theme.of(context).canvasColor,
          flexibleSpace: const FlexibleSpaceBar(
            titlePadding: EdgeInsets.all(8),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.black, fontSize: 28),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 1000,
            child: Center(
              child: Text('Main content here'),
            ),
          ),
        ),
      ],
    );
  }
}
