part of 'upload_docs_cubit.dart';

@immutable
abstract class UploadDocsState {}

class UploadDocsInitial extends UploadDocsState {}

class UploadDocsLoading extends UploadDocsState {}

class UploadDocsSucceed extends UploadDocsState {}

class UploadDocsFailed extends UploadDocsState {
  final String errorMsg;
  UploadDocsFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UploadDocsFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'UploadDocsFailed(errorMsg: $errorMsg)';
}
