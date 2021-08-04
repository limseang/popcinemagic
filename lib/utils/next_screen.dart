import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cinemagic22/config/wp_config.dart';
import 'package:cinemagic22/models/article.dart';
import 'package:cinemagic22/pages/article_details.dart';
import 'package:cinemagic22/pages/video_article_details.dart';

void nextScreen (context, page){
  Navigator.push(context, MaterialPageRoute(
    builder: (context) => page));
}


void nextScreeniOS (context, page){
  Navigator.push(context, CupertinoPageRoute(
    builder: (context) => page));
}


void nextScreenCloseOthers (context, page){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => page), (route) => false);
}

void nextScreenReplace (context, page){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}


void nextScreenPopup (context, page){
  Navigator.push(context, MaterialPageRoute(
    fullscreenDialog: true,
    builder: (context) => page),
  );
}


void navigateToDetailsScreen (context, Article article, String? heroTag){
  if(article.tags == null || !article.tags!.contains(WpConfig.videoTagId)){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => ArticleDetails(articleData: article, tag: heroTag,)),
    );
  }else{
     Navigator.push(context, MaterialPageRoute(
      builder: (context) => VideoArticleDeatils(article: article)),
    );
  }
}

void navigateToDetailsScreenByReplace (context, Article article, String? heroTag){
  if(article.tags == null || !article.tags!.contains(WpConfig.videoTagId)){
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => ArticleDetails(articleData: article, tag: heroTag,)),
    );
  }else{
     Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => VideoArticleDeatils(article: article)),
    );
  }
}