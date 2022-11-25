import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: home(),));
}

class home extends StatelessWidget {
  ValueNotifier<int> sum = ValueNotifier(0);
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextField(controller: t1,),
            TextField(controller: t2,),
            ValueListenableBuilder(
              valueListenable: sum, builder: (context, s, child) {
              return Text("${s}");
            },),
            ElevatedButton(onPressed: () {
              try {
                String a = t1.text;
                String b = t2.text;
                sum.value = int.parse(a) + int.parse(b);
                t1.clear();
                t2.clear();
              } on Exception catch (e) {
                print(e);
              }
            }, child: Text("sum"))
          ],
        ),
      ),
    );
  }
}
