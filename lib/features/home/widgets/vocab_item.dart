import 'package:doanktl/features/home/model/vocabulary.dart';
import 'package:flutter/material.dart';

class VocabItem extends StatelessWidget {
  final Vocabulary vocabulary;

  const VocabItem({
    required this.vocabulary,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(vocabulary.vocabImageUrl),
          Row(
            children: [Text(vocabulary.vocabName), Text('/ˈflʌt̬.ɚ/')],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(vocabulary.vocabMeaning),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(vocabulary.vocabVietnameseName),
          )
        ],
      ),
    );
  }
}
