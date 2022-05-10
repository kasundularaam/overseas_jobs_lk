import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../data/files/files_service.dart';
import '../../../../logic/cubit/upload_docs_cubit/upload_docs_cubit.dart';

class DocumentCard extends StatelessWidget {
  const DocumentCard({Key? key}) : super(key: key);

  Future uploadDoc(BuildContext context) async {
    TextEditingController controller = TextEditingController();
    final formKey = GlobalKey<FormState>();
    String file = await FilesService.getDocs();
    showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: const Text("Document name"),
            content: Form(
              key: formKey,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.w),
                  ),
                  prefixIcon: const Icon(
                    Icons.file_open_rounded,
                  ),
                  labelText: 'File name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'File name is empty!';
                  }
                  return null;
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<UploadDocsCubit>(context)
                        .uploadDoc(doc: file, name: controller.text);
                    Navigator.pop(dialogContext);
                  }
                },
                child: const Text("Upload"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "CV and Certificates",
            style: AppTextStyles.h3Dark,
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Upload Files",
                style: AppTextStyles.p2Dark,
              ),
              BlocConsumer<UploadDocsCubit, UploadDocsState>(
                listener: (context, state) {
                  if (state is UploadDocsSucceed) {
                    SnackBar snackBar =
                        const SnackBar(content: Text("File uploaded!"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  if (state is UploadDocsFailed) {
                    SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                builder: (context, state) {
                  if (state is UploadDocsLoading) {
                    return const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    );
                  }
                  return ElevatedButton(
                    onPressed: () => uploadDoc(context),
                    child: Text("Upload", style: AppTextStyles.p2Light),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
