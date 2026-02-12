import 'package:bank_system/features/deposits/data/models/deposit_model.dart';
import 'package:bank_system/features/home/presentation/manegar/cubit/add_pdf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class ShowDepositAndWithdrawData extends StatefulWidget {
  final DepositModel deposit;

  const ShowDepositAndWithdrawData({super.key, required this.deposit});

  @override
  State<ShowDepositAndWithdrawData> createState() =>
      _ShowDepositAndWithdrawDataState();
}

class _ShowDepositAndWithdrawDataState
    extends State<ShowDepositAndWithdrawData> {
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

  Future<void> _requestPermission() async {
    
    final status = await Permission.storage.request();

    if (!status.isGranted && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Storage permission not granted')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddPdfCubit, AddPdfState>(
      listener: (context, state) {
        if (state is AddPdfLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Generating and uploading PDF...')),
          );
        } else if (state is AddPdfSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('PDF generated and uploaded successfully!'),
            ),
          );
        } else if (state is AddPdfError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.errMessage}')),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Deposit Details')),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildItem(
                    "Deposit ID:",
                    widget.deposit.depositId.toString(),
                  ),
                  _buildItem("Amount:", "${widget.deposit.amount} EGP"),
                  _buildItem("Status:", widget.deposit.status),
                  _buildItem("Date:", formattedDate),
                  _buildItem("User ID:", widget.deposit.userId.toString()),
                  _buildItem("Message:", widget.deposit.message),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () =>
                          context.read<AddPdfCubit>().addPdf(widget.deposit),
                      icon: const Icon(Icons.download),
                      label: const Text("Download as PDF"),
                    ),
                  ),
                ],
              ),
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
          Expanded(child: Text(value, textAlign: TextAlign.end)),
        ],
      ),
    );
  }
}
