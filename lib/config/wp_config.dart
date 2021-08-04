import 'package:easy_localization/easy_localization.dart';
class WpConfig {


  // YOUR WEBISTE URL
  static const String websiteUrl = "https://cinemagickh.net/";

  // CREDENTIALS
  static final String websiteAdminName = 'cinemagickh';
  static final String websiteAdminPassword = 'lovelykitty1S';
  

  //Tag Ids - CHANGE THESE
  static final int featuredTagID = 13;
  static final int videoTagId = 18;

  

  // Hometab 4 categories - CHANGE THESE
  // -- 'Serial Number' : [Category Id, 'Category Name'] -- Length should be 4.
  static final Map selectedCategories = {
    '1': [11, "Local".tr(),],
    '2': [12, "HollyWood".tr(),],
    '3': [13, "Korean".tr(),],
    '4': [14, "Chinese".tr(),],
  };


  

  // FEATURE IMGAE -  IF YOUR POSTS DON"T HAVE A FEATURE IMAGE
  static const String randomPostFeatureImage = "https://innov8tiv.com/wp-content/uploads/2017/10/blank-screen-google-play-store-1280x720.png";

  // FEATURE CATEGORY IMGAE -  IF YOU HAVEN'T DEFINE A COVER IMAGE FOR A CATEGORY IN THE LIST BELOW
  static const String randomCategoryThumbnail = "https://images.unsplash.com/photo-1494253109108-2e30c049369b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8cmFuZG9tfGVufDB8MHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60";


  // ENTER CATERGORY ID AND ITS COVERS IMAGE - CHANGE THESE
  static const Map categoryThumbnails = {
    // categoryID : 'category thumbnail url'
    14 : "https://chipskjaa.files.wordpress.com/2021/07/you-are-my-glory-tencent.jpg",
    13 : "https://6.viki.io/image/61a91ed3aa5549e0ba1fe666f7506ed0.jpeg?s=900x600&e=t",
    12 : "https://www.cnet.com/a/img/_V3fRMZkYTROjrP3CwedkAMmpJk=/1200x630/2019/04/25/9277c764-601d-4ab3-85f9-9c39d7f1ac5a/avengers-endgame-promo-crop.jpg",
    8 : "https://lh6.googleusercontent.com/jASI-6jN_hYtCQUQewGYxsXvwuGpPuvxM0gDakRxJbCjS36TX6i0E-kXQ5PgRrbxcMS2l7BreA5vNPfEufhE5Hr9aGZ5atOEZqLZQxDV3uO6u30MFfQll5i0CnBu9LaGGTEKJzEA",
    11 : "https://images.pexels.com/photos/2698475/pexels-photo-2698475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    5 : "https://images.unsplash.com/photo-1496065187959-7f07b8353c55?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8c2NpZW5jZXxlbnwwfDB8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    3 : "https://images.pexels.com/photos/2885940/pexels-photo-2885940.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    6 : "https://images.pexels.com/photos/1036936/pexels-photo-1036936.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    4 : "https://images.pexels.com/photos/3885493/pexels-photo-3885493.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
  };
}