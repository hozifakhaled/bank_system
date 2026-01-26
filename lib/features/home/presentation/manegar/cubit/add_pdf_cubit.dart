import 'dart:io';
import 'package:bank_system/features/home/data/model/deposit_model.dart';
import 'package:bank_system/features/home/domain/usecases/upload_pdf_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:http_parser/http_parser.dart';

part 'add_pdf_state.dart';

class AddPdfCubit extends Cubit<AddPdfState> {
  final UploadPdfUsecase uploadPdfUsecase;

  AddPdfCubit(this.uploadPdfUsecase) : super(AddPdfInitial());

  Future<void> addPdf(DepositModel deposit) async {
    emit(AddPdfLoading());
    try {
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        status = await Permission.storage.request();
        if (!status.isGranted) {
          emit(const AddPdfError(errMessage: 'Storage permission not granted'));
          return;
        }
      }

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

      final dir = Directory('/storage/emulated/0/Download');
      final filePath = "${dir.path}/deposit_${deposit.depositId}.pdf";
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          filePath,
          filename: filePath.split('/').last,
          contentType: MediaType('application', 'pdf'),
        ),
      });

      final result = await uploadPdfUsecase.call(formData);
      result.fold(
        (failure) => emit(AddPdfError(errMessage: failure.errMessage)),
        (success) => emit(AddPdfSuccess()),
      );

    } catch (e) {
      emit(AddPdfError(errMessage: e.toString()));
    }
  }
}
