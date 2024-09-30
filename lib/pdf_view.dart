import 'package:flutter/material.dart';
import 'package:invoicegenerator/pdf_generator.dart';
import 'package:printing/printing.dart';

class PdfView extends StatefulWidget {
  const PdfView({super.key});

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => pdfGeneratore(),
      ),
    );
  }
}