import 'dart:typed_data';
import 'package:invoicegenerator/global.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> pdfGeneratore() async {
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      margin: pw.EdgeInsets.zero,
      pageFormat: PdfPageFormat(300, 500),
      build: (Context) => pw.Padding(
        padding: pw.EdgeInsets.all(8),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Align(
              alignment: pw.Alignment.center,
              child: pw.Text(
                'Tax Invoice',
                style:
                    pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold),
              ),
            ),
            pw.Divider(endIndent: 50, indent: 50),
            pw.Text('Coustomer Name : ${txtName.text}'),
            pw.SizedBox(height: 5),
            pw.Text('Contact Number : ${txtMobileNum.text}'),
            pw.SizedBox(height: 5),
            pw.Text('Email : ${txtEmail.text}'),
            pw.SizedBox(height: 5),
            pw.Text('Address : ${txtAddress.text}'),
            pw.Divider(),
            pw.Text(
              'Prodcut Detail',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14),
            ),
            ...List.generate(
              addItems.length,
              (index) => pw.Row(children: [
                pw.Text(addItems[index].name),
                pw.Spacer(),
                pw.Text('\$${addItems[index].price}/-'),
              ]),
            ),
            pw.Divider(),
            pw.Row(
              children: [
                pw.Text('GST : 18%'),
                pw.Spacer(),
                pw.Text('Total : \$${payment()}/-')
              ],
            )
          ],
        ),
      ),
    ),
  );
  return pdf.save();
}
