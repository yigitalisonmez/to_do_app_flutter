import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todoey_flutter/helpers/theme_constants.dart';
import 'package:todoey_flutter/helpers/widgets/custom_shimmer.dart';
import 'package:todoey_flutter/views/todo_view/todo_view.dart';

class TestView extends StatefulWidget {
  static String path = '/test-view';
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
      //bottomNavigationBar: animatedNavigationBar(context),
      floatingActionButton: FloatingActionButton(
          child: const Icon(CupertinoIcons.add, color: Colors.white),
          onPressed: () {}),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30, bottom: 30.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: CustomShimmer(height: 10, width: 150)),
                SizedBox(height: 10.0),
                CustomShimmer(height: 10, width: 120),
                SizedBox(height: 10.0),
                CustomShimmer(height: 10, width: 100),
                SizedBox(height: 10.0),
                CustomShimmer(height: 10, width: 120),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return _buildTodoShimmer();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodoShimmer() {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 1200),
      baseColor: kShimmerBaseColor,
      highlightColor: kShimmerHighlightColor,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    height: 40,
                    width: 200,
                  ))),
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 20, 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                height: 40,
                width: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }

/*  Widget _buildTodoShimmer() {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: CustomShimmer(height: 40, width: 40))),
        Expanded(
          flex: 15,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: CustomShimmer(height: 40, width: 200),
          ),
        ),
      ],
    );
  }*/
}
/*Scaffold(
        body: ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return _buildTodoShimmer();
      },
    ));*/
