import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
class FilePickerWidget extends StatefulWidget {
  final String subtext;
  final Function(String) onFilePicked; 

  const FilePickerWidget({
    super.key,
    required this.subtext,
    required this.onFilePicked,
  });

  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  String? fileName;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String name = result.files.single.name;
      String? path = result.files.single.path;

      setState(() {
        fileName = name;
      });

      debugPrint("Picked file: $fileName");

      if (path != null) {
        widget.onFilePicked(path); 
      }
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
          color: const Color.fromRGBO(0, 0, 0, 0.45),
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
                  backgroundColor: Colors.transparent,
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
