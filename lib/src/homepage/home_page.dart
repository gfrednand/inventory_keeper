import 'package:flutter/material.dart';

///
class HomePage extends StatelessWidget {
  ///
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: const CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 100,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.all(8),
              title: Text(
                'Home',
                style: TextStyle(),
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
      ),
    );
  }
}
