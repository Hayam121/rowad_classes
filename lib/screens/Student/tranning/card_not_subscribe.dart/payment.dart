import 'package:flutter/material.dart';
import 'package:rowad_classes/constants/colors.dart';
import 'package:rowad_classes/constants/gradientbackground.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'الدفع',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: ColorRowad,
          ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  'معالجه البيانات',
                  style: TextStyle(fontSize: 24,color: ColorRowad, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                 Container(
                  width: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.transparent, // Transparent background
                      border: Border.all(
                        color: Colors.orange, // Orange border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    child: Center(
                      child: Text(
                        'أ/محمد السعودي', // Replace with teacher's name
                        style: TextStyle(
                          fontSize: 20,
                          color: ColorRowad, // Adjust text color
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40,),

                Table(
                  border: TableBorder.all(
                    color: ColorRowad, // Border color for the table
                    width: 2.0, // Width of the border
                  ),
                  columnWidths: const {
                    0: FlexColumnWidth(2), // Column 1 width ratio
                    1: FlexColumnWidth(1), // Column 2 width ratio
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: ColorRowad // Rowad color for the first row
                      ),
                      children: const[
                         Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'إجمالي سعر الفاتوره النهائي',
                              style: TextStyle(fontSize: 20, color: Colors.white), // White text
                            ),
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'سعر الكورس',
                              style: TextStyle(fontSize: 20, color: Colors.white), // White text
                            ),
                          ),
                        ),
                      ],
                    ),
                    const TableRow(
                      decoration: BoxDecoration(
                        color: Colors.white, // White background for the second row
                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              '450',
                              style: TextStyle(fontSize: 18, color: Colors.black), // Black text
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              '450',
                              style: TextStyle(fontSize: 18, color: Colors.black), // Black text
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),    
                SizedBox(height: 40,),
                Image.asset('assets/images/fawry.png'),
                SizedBox(height: 40,),

                 ElevatedButton(
                        onPressed: () {
                          //  Navigator.push(context, MaterialPageRoute(builder:(context) => SubscribeNow(),));
                        },
                        child: buildDirectionalText(
                           'ادفع الآن لتأكيد طلبك',
                          direction: TextDirection.rtl,
                          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),
                            text: 'ادفع الآن لتأكيد طلبك',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorYellow,
                           shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // Set rounded corners
                          ),
                          // minimumSize: const Size(50, 33),
                        ),
                      ),
      
              
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}