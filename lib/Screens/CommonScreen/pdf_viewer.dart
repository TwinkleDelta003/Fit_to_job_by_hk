import 'dart:io';

import 'package:fit_to_job/Screens/Widgets/hepler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:power_file_view/power_file_view.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../Constant/Colorpath.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
// import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

class PDFViewerScreen extends StatefulWidget {
  const PDFViewerScreen({Key key}) : super(key: key);

  @override
  _PDFViewerScreenState createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  var bundleData = Get.arguments;
  final sampleUrl = 'http://www.africau.edu/images/default/sample.pdf';
  // final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  Future openFile({String url, String fileName}) async {
    final file = await downloadFile(url, fileName);
    if (file == null) return;
    print("Path:" + file.path);
    OpenFile.open(file.path);
  }

  Future<File> downloadFile(String url, String fileName) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$fileName');
    try {
      final response = await Dio().get(url,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              receiveTimeout: 0));

      final raf = file.openSync(
        mode: FileMode.write,
      );
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    } catch (e) {
      Helper().customSnackbar(
        bgColor: Colors.red,
        msgColor: Colors.white,
        title: e,
        message: e,
        icon: Icon(Icons.info),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: splashBGColor,
        appBar: AppBar(
          backgroundColor: splashBGColor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xff018F89),
              ),
              onPressed: () => Get.back()),
          title: const Padding(
            padding: EdgeInsets.only(right: 120.0),
            child: Text(
              "PDF View",
              style: TextStyle(
                  color: Color(0xff1AA19A),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: PDF().fromUrl(
        //  bundleData[0]
        sampleUrl
            )
        // // PdfView(path: sampleUrl),
        // PDFViewerScaffold(

        // path: bundleData[0])
        // PDFView(
        //   filePath: bundleData[0]
        // )
        //  SfPdfViewer.network(
        //   bundleData[0],
        //   key: _pdfViewerKey,
        // ),
        );
  }
}
