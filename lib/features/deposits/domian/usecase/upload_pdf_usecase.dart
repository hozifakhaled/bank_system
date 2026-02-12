import 'package:bank_system/core/errors/failure.dart';
import 'package:bank_system/features/home/domain/repositres/home_repositrey.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UploadPdfUsecase {
  final HomeRepository homeRepositrey;
  UploadPdfUsecase(this.homeRepositrey);

  Future<Either<Failure, String>> call(FormData formData) => homeRepositrey.sendPdf(formData);
}