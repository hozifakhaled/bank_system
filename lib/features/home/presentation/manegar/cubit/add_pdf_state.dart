part of 'add_pdf_cubit.dart';

sealed class AddPdfState extends Equatable {
  const AddPdfState();

  @override
  List<Object> get props => [];
}

final class AddPdfInitial extends AddPdfState {}

final class AddPdfLoading extends AddPdfState {}

final class AddPdfSuccess extends AddPdfState {}

final class AddPdfError extends AddPdfState {
  final String errMessage;
  const AddPdfError({required this.errMessage});
}
