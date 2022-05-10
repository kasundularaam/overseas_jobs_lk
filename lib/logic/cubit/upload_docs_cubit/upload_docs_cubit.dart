import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repositories/repository.dart';
import '../../../data/shared/shared_service.dart';

part 'upload_docs_state.dart';

class UploadDocsCubit extends Cubit<UploadDocsState> {
  UploadDocsCubit() : super(UploadDocsInitial());

  Future uploadDoc({required String doc, required String name}) async {
    try {
      emit(UploadDocsLoading());
      final String nic = await SharedServices.getNic();
      bool succeed =
          await Repository.uploadDocs(nic: nic, document: doc, name: name);

      if (succeed) {
        emit(UploadDocsSucceed());
      } else {
        emit(UploadDocsFailed(errorMsg: "Unable to upload document!"));
      }
    } catch (e) {
      emit(UploadDocsFailed(errorMsg: e.toString()));
    }
  }
}
