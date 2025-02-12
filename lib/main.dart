import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _controller = TextEditingController();

  void _onSendPress() {
    String text = _controller.text.trim();
    if (text.isNotEmpty) {
      print("on send press _controller.text: " + _controller.text.trim());
      _controller.clear();
    }

  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter--;
    });
  }

  @override
  void dispose() {
    // 释放资源
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
      gapPadding: 0,
      borderSide: BorderSide.none,
    );
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 改为 spaceBetween 使内容分布在顶部和底部
          children: <Widget>[
            Column(  // 将计数器相关的 Widget 组合在一起
              children: [
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                // color: Colors.green[100],
                                child: Column(
                                  children: [DropdownButton<int>(
                                    value: 1, // 默认值为1
                                    items: List.generate(10, (index) {
                                      return DropdownMenuItem<int>(
                                        value: index + 1,
                                        child: Text("${index + 1}"),
                                      );
                                    }),
                                    onChanged: (int? newValue) {
                                      // 在这里添加选择后的处理逻辑
                                    },
                                  ),
                                ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.yellow[100],
                                child: Column(
                                  children: [],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    onPressed: _onSendPress,
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 18.0),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(8))
                                      ),
                                    ),
                                    child: Transform.rotate(
                                      alignment: Alignment.center,
                                      angle: - math.pi / 4, 
                                      child: const Icon(Icons.send),
                                    ),
                                  ),
                                )],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: TextFormField(
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: '请输入...',
                            fillColor: Colors.grey[100],
                            filled: true,
                            isCollapsed: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                            border: _outlineInputBorder,
                            focusedBorder: _outlineInputBorder,
                            enabledBorder: _outlineInputBorder,
                            disabledBorder: _outlineInputBorder,
                            focusedErrorBorder: _outlineInputBorder,
                            errorBorder: _outlineInputBorder,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop, // 设置浮动作按钮的位置
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0), // 右边的 padding
              child: FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0), // 左边的 padding
              child: FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class TextFieldMinHeightExample extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  TextFieldMinHeightExample({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 100, // 设置最小高度
        ),
        child: TextField(
          controller: _controller,
          maxLines: null, // 设置为 null 表示无限制的行数
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter your text here',
          ),
        ),
      ),
    );
  }
}
