import 'dart:io';
import 'package:bank_system/features/home/data/model/deposit_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ShowDepositAndWithdrawData extends StatelessWidget {
  final DepositModel deposit;

  const ShowDepositAndWithdrawData({super.key, required this.deposit});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMMMMd().add_jm().format(deposit.date);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildItem("Deposit ID:", deposit.depositId.toString()),
                _buildItem("Amount:", "${deposit.amount} EGP"),
                _buildItem("Status:", deposit.status),
                _buildItem("Date:", formattedDate),
                _buildItem("User ID:", deposit.userId.toString()),
                _buildItem("Message:", deposit.message),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () => _downloadAsPDF(context),
                    icon: const Icon(Icons.download),
                    label: const Text("Download as PDF"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _downloadAsPDF(BuildContext context) async {
    // 1. طلب صلاحية
    final status = await Permission.storage.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Storage permission denied')),
      );
      return;
    }

    // 2. أنشئ ملف PDF
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text("Deposit Details", style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 16),
            pw.Text("Deposit ID: ${deposit.depositId}"),
            pw.Text("Amount: ${deposit.amount} EGP"),
            pw.Text("Status: ${deposit.status}"),
            pw.Text("Date: ${DateFormat.yMMMMd().add_jm().format(deposit.date)}"),
            pw.Text("User ID: ${deposit.userId}"),
            pw.Text("Message: ${deposit.message}"),
          ],
        ),
      ),
    );

    // 3. حفظ الملف
    final dir = await getExternalStorageDirectory();
    final file = File("${dir!.path}/deposit_${deposit.depositId}.pdf");
    await file.writeAsBytes(await pdf.save());

    // 4. إشعار المستخدم
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Saved to ${file.path}')),
    );
  }
}
