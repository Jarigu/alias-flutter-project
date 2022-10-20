import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AliasCard extends StatelessWidget {
  const AliasCard({
    Key? key,
    required this.originalUrl,
    required this.shortUrl,
  }) : super(key: key);

  final String shortUrl;
  final String originalUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
            ),
        border: Border.all(
          width: 2.0,
          color: Colors.blue,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TextClipboard(
            url: shortUrl,
            typeUrl: 'Short url',
          ),
          const SizedBox(
            height: 5.0,
          ),
          _TextClipboard(
            url: originalUrl,
            typeUrl: 'Original url',
          ),
        ],
      ),
    );
  }
}

class _TextClipboard extends StatelessWidget {
  const _TextClipboard({
    Key? key,
    required this.url,
    required this.typeUrl,
  }) : super(key: key);
  final String url;
  final String typeUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Clipboard.setData(
          ClipboardData(text: url),
        );

        const snackBar = SnackBar(
          content: Text('The url has been copied'),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 14.0, color: Colors.black87),
          children: <TextSpan>[
            TextSpan(
              text: '$typeUrl ',
              style: const TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: url,
            ),
          ],
        ),
      ),
    );
  }
}
