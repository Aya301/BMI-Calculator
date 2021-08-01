import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      home: Bmi(),
    );
  }
}

class Bmi extends StatefulWidget {
  @override
  _BmiState createState () => _BmiState();
}

class _BmiState extends State<Bmi>{
  double result=0;
  String text='';
  // bool selected= true;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text('BMI Calculator',
          style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            SizedBox(height: 30,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: heightController,
                onSaved: (value){
                  heightController.text=value;
                },
                style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Hight',
                  hintStyle: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                  suffixIcon: Icon(Icons.height,color: Colors.white,),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: Colors.grey.shade900
                    ),),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: Colors.grey.shade900
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: weightController,
                onSaved: (value){
                  weightController.text=value;
                },
                style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Weight',
                  hintStyle: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                  suffixIcon: Icon(Icons.line_weight_sharp,color: Colors.white,),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: Colors.grey.shade900
                    ),),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: Colors.grey.shade900
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(onPressed: (){
              double h= double.parse(heightController.text);
              double w= double.parse(weightController.text);
              setState(() {
                result = w/(h*h);
                (result>25)? text='You are over weight':
                (result<25 && result>18.5)? text='You are normal weight':
                text='You are under weight';
              });
            },
              style: ElevatedButton.styleFrom(primary: Colors.grey.shade900,),
              child:Text('Calculate',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                    color: Colors.white),),),
            SizedBox(height: 30),
            // Stack(
            //   children: [
            //     AnimatedPositioned(
            //       width: selected?200.0:50.0,
            //         height: selected?50.0:200.0,
            //         top: selected?50.0:150.0,
            //       duration: const Duration(seconds: 1),
            //         curve: Curves.fastOutSlowIn,
            //         child: GestureDetector(
            //           onTap: (){
            //             setState(() {
            //               selected=!selected;
            //             });
            //           },
            //           child:
            Container(
              height: 170,
              width:250,
              decoration: BoxDecoration(color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(10),
                boxShadow:[
                  BoxShadow(
                      spreadRadius:1,
                      color: Colors.grey.shade900
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(result.toStringAsFixed(2),style:
                  TextStyle(fontSize: 20,color: Colors.white),
                  ),
                  SizedBox(height: 20,),
                  Text('$text',style:
                  TextStyle(fontSize: 20,color: Colors.white),
                  ),
                ],
              ),
              // ),
              // ),
              // ),
              // ],
            )
          ],
        ),
      ),
    );
  }
}