import 'package:flutter/material.dart';
import 'package:untitled12/data/models/productsModels.dart';

import '../../constants/my_colors/my_colors.dart';

class CharacterItem extends StatelessWidget {
  final ProductsModel model;

  const CharacterItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        // onTap: () => Navigator.pushNamed(context, characterDetailsScreen,
        //     arguments: character),
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${model.title}',
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          child: Hero(
            tag: 2,
            child: Container(
              color: MyColors.myGrey,

              /// ال FadeInImage.assetNetwork بستخدمها عشان لو نا عاوز عبال مالصوره تيجي يديني صوره تانيه
              /// زي مثلا هنا لو مش فاضيه هيديني حاجه ولو مجتش هيديني صوره تانيه
              child: model.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'assets/images/loading.gif',
                      image: model.image,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/placeholder.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
