# promilo

Modern 

## Getting Started

Login credentials 

Email : test@stanch.io
password : Test@123

Hardly found way to implement the Share feature,
```
void shareIt(BuildContext context, Path) async {
  final ByteData bytes = await rootBundle.load('assets/d1.jpg');
  final Uint8List list = bytes.buffer.asUint8List();
  final tempDir = await getTemporaryDirectory();
  final file = await File('${tempDir.path}/d1.jpg').create();
  file.writeAsBytesSync(list);
  Share.shareFiles([file.path], text: 'Great picture');
}
```
