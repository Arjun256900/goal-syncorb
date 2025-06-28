import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerWidget extends StatefulWidget {
  final String subtext;
  const FilePickerWidget({super.key, required this.subtext});

  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  String? fileName;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
      });
      // You can also get the path: result.files.single.path;
      debugPrint("Picked file: $fileName");
    } else {
      debugPrint("No file selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickFile,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: Radius.circular(8),
          strokeWidth: 1.5,
          dashPattern: [6, 6],
          color: Color.fromRGBO(0, 0, 0, 0.45),
        ),
        child: Container(
          height: 105,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                  child: Icon(
                    fileName != null ? Icons.done : Icons.upload,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  fileName ?? widget.subtext,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
