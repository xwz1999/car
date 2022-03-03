/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';

class $AssetsDataGen {
  const $AssetsDataGen();

  String get china => 'assets/data/china.json';
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  AssetGenImage get back => const AssetGenImage('assets/icons/back.png');
  AssetGenImage get barBubbleGray =>
      const AssetGenImage('assets/icons/bar_bubble_gray.png');
  AssetGenImage get barToTop =>
      const AssetGenImage('assets/icons/bar_toTop.png');
  AssetGenImage get carAgent =>
      const AssetGenImage('assets/icons/car_agent.png');
  AssetGenImage get carMaintain =>
      const AssetGenImage('assets/icons/car_maintain.png');
  AssetGenImage get carManager =>
      const AssetGenImage('assets/icons/car_manager.png');
  AssetGenImage get carMortgage =>
      const AssetGenImage('assets/icons/car_mortgage.png');
  AssetGenImage get carPush => const AssetGenImage('assets/icons/car_push.png');
  AssetGenImage get carRecovery =>
      const AssetGenImage('assets/icons/car_recovery.png');
  AssetGenImage get carValuation =>
      const AssetGenImage('assets/icons/car_valuation.png');
  AssetGenImage get customerCare =>
      const AssetGenImage('assets/icons/customer_care.png');
  AssetGenImage get customerInvite =>
      const AssetGenImage('assets/icons/customer_invite.png');
  AssetGenImage get customerManager =>
      const AssetGenImage('assets/icons/customer_manager.png');
  AssetGenImage get customerMessage =>
      const AssetGenImage('assets/icons/customer_message.png');
  AssetGenImage get customerPay =>
      const AssetGenImage('assets/icons/customer_pay.png');
  AssetGenImage get customerTrack =>
      const AssetGenImage('assets/icons/customer_track.png');
  AssetGenImage get homeShare =>
      const AssetGenImage('assets/icons/home_share.png');
  AssetGenImage get icFavorite1 =>
      const AssetGenImage('assets/icons/ic_favorite1.png');
  AssetGenImage get icLocation =>
      const AssetGenImage('assets/icons/ic_location.png');
  AssetGenImage get mainMenu =>
      const AssetGenImage('assets/icons/main_menu.png');
  AssetGenImage get mainSearch =>
      const AssetGenImage('assets/icons/main_search.png');
  AssetGenImage get tabCar => const AssetGenImage('assets/icons/tab_car.png');
  AssetGenImage get tabCarChoose =>
      const AssetGenImage('assets/icons/tab_car_choose.png');
  AssetGenImage get tabHome => const AssetGenImage('assets/icons/tab_home.png');
  AssetGenImage get tabHomeChoose =>
      const AssetGenImage('assets/icons/tab_home_choose.png');
  AssetGenImage get tabMy => const AssetGenImage('assets/icons/tab_my.png');
  AssetGenImage get tabMyChoose =>
      const AssetGenImage('assets/icons/tab_my_choose.png');
  AssetGenImage get tabNotice =>
      const AssetGenImage('assets/icons/tab_notice.png');
  AssetGenImage get tabNoticeChoose =>
      const AssetGenImage('assets/icons/tab_notice_choose.png');
  AssetGenImage get warning => const AssetGenImage('assets/icons/warning.png');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  AssetGenImage get bannerBg =>
      const AssetGenImage('assets/images/banner_bg.png');
  AssetGenImage get homeBg => const AssetGenImage('assets/images/home_bg.png');
  AssetGenImage get loginBg =>
      const AssetGenImage('assets/images/login_bg.png');
}

class Assets {
  Assets._();

  static const $AssetsDataGen data = $AssetsDataGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
