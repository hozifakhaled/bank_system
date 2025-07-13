import 'package:bank_system/core/themeing/colors.dart';
import 'package:flutter/material.dart';

class ColumnProfileHome extends StatelessWidget {
  const ColumnProfileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row الترحيب والجرس
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // نص الترحيب
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: maincolor,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "User Khalid Alzahrani",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ],
            ),

            // جرس الإشعارات
            Container(
              decoration: BoxDecoration(
                color: maincolor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.notifications),
                color: maincolor,
                iconSize: 28,
                onPressed: () {
                  // TODO: Navigate to notifications page
                },
              ),
            ),
          ],
        ),

        SizedBox(height: 20),

        // Container لرصيد الحساب الجاري وبيانات البطاقة
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              // أيقونة البطاقة
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: maincolor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text("💳", style: TextStyle(fontSize: 28)),
                ),
              ),

              SizedBox(width: 15),

              // بيانات البطاقة
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "hozifa@gmail.com",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "hoz*****388",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: maincolor,
                      ),
                    ),
                  ],
                ),
              ),

              Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}
