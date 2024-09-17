// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_containers/the_containers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TheContainers Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

enum TabType {
  separatedRow,
  separatedColumn,
  containerRow,
  containerColumn,
  animatedContainerRow,
  animatedContainerColumn;

  String get tabName => name[0].toUpperCase() + name.substring(1);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _itemCount = 3;

  late final Timer _timer;

  double _padding = 16;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _padding = _padding > 16 ? 4 : 32;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = TabType.values.map((e) => Tab(text: e.tabName)).toList();
    final children = TabType.values.map(_getTabView).toList();

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TheContainers Demo'),
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: children,
        ),
      ),
    );
  }

  Widget _getTabContainer({
    required Axis scrollDirection,
    required Widget child,
  }) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: scrollDirection,
        child: child,
      ),
    );
  }

  Widget _getTabView(TabType tabType) {
    final children = List.generate(
      _itemCount,
      (index) => Container(
        color: Colors.deepPurple[100 * (index + 1)],
        height: 100,
        width: 100,
        child: Center(
          child: Text(
            'Item $index',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );

    return switch (tabType) {
      TabType.separatedRow => _getTabContainer(
          scrollDirection: Axis.horizontal,
          child: SeparatedRow(
            separatorSize: 16,
            children: children,
          ),
        ),
      TabType.separatedColumn => _getTabContainer(
          scrollDirection: Axis.vertical,
          child: SeparatedColumn(
            separatorSize: 16,
            children: children,
          ),
        ),
      TabType.containerRow => _getTabContainer(
          scrollDirection: Axis.horizontal,
          child: ContainerRow(
            separatorSize: 16,
            color: Colors.green[300],
            padding: EdgeInsets.all(_padding),
            children: children,
          ),
        ),
      TabType.containerColumn => _getTabContainer(
          scrollDirection: Axis.vertical,
          child: ContainerColumn(
            separatorSize: 16,
            color: Colors.green[300],
            padding: EdgeInsets.all(_padding),
            children: children,
          ),
        ),
      TabType.animatedContainerRow => _getTabContainer(
          scrollDirection: Axis.horizontal,
          child: AnimatedContainerRow(
            duration: const Duration(milliseconds: 300),
            separatorSize: 16,
            color: Colors.green[300],
            padding: EdgeInsets.all(_padding),
            children: children,
          ),
        ),
      TabType.animatedContainerColumn => _getTabContainer(
          scrollDirection: Axis.vertical,
          child: AnimatedContainerColumn(
            duration: const Duration(milliseconds: 300),
            separatorSize: 16,
            color: Colors.green[300],
            padding: EdgeInsets.all(_padding),
            children: children,
          ),
        ),
    };
  }
}
