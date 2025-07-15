import 'dart:io';
import 'package:bank_system/features/home/data/model/deposit_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

class ShowDepositAndWithdrawData extends StatefulWidget {
  final DepositModel deposit;

  const ShowDepositAndWithdrawData({super.key, required this.deposit});

  @override
  State<ShowDepositAndWithdrawData> createState() => _ShowDepositAndWithdrawDataState();
}

class _ShowDepositAndWithdrawDataState extends State<ShowDepositAndWithdrawData> {
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    formattedDate = DateFormat.yMMMMd().add_jm().format(widget.deposit.date);
    
    // ✅ اطلب الصلاحية بعد بناء أول Frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _requestPermission();
    });
  }

  /// 📝 طلب صلاحية التخزين
  Future<void> _requestPermission() async {
    var currentStatus = await Permission.storage.status;
    print("🔍 [Permission Check] Current storage permission status: $currentStatus");

    final status = await Permission.storage.request();

    print("🔍 [Permission Request] New storage permission status: $status");

    if (status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Storage permission granted')),
      );
    } else if (status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Storage permission denied')),
      );
    } else if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Storage permission permanently denied. Please enable it in settings.'),
          action: SnackBarAction(
            label: 'Settings',
            onPressed: () => openAppSettings(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                _buildItem("Deposit ID:", widget.deposit.depositId.toString()),
                _buildItem("Amount:", "${widget.deposit.amount} EGP"),
                _buildItem("Status:", widget.deposit.status),
                _buildItem("Date:", formattedDate),
                _buildItem("User ID:", widget.deposit.userId.toString()),
                _buildItem("Message:", widget.deposit.message),
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

  /// 📝 إنشاء ملف PDF وحفظه في Downloads
  Future<void> _downloadAsPDF(BuildContext context) async {
    final status = await Permission.storage.status;

    if (status.isGranted) {
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) => pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text("Deposit Details", style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 16),
              pw.Text("Deposit ID: ${widget.deposit.depositId}"),
              pw.Text("Amount: ${widget.deposit.amount} EGP"),
              pw.Text("Status: ${widget.deposit.status}"),
              pw.Text("Date: ${DateFormat.yMMMMd().add_jm().format(widget.deposit.date)}"),
              pw.Text("User ID: ${widget.deposit.userId}"),
              pw.Text("Message: ${widget.deposit.message}"),
            ],
          ),
        ),
      );

      // ✅ حفظ الملف في Downloads
      final dir = Directory('/storage/emulated/0/Download');
      final file = File("${dir.path}/deposit_${widget.deposit.depositId}.pdf");
      await file.writeAsBytes(await pdf.save());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF saved to Downloads folder')),
      );

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Storage permission not granted')),
      );
    }
  }
}
