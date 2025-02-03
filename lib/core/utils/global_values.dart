

import 'package:flutter/material.dart';

const double kPadding = 20.0;
const double kPaddingS = 10.0;
const double kPaddingXS = 5.0;
const double kPaddingXXS= 2.0;
const double kPaddingM = 15.0;
const double kPaddingL = 25.0;
const double kPaddingXL = 30.0;
const double kPaddingXXL = 40.0;
const double kCornerRadius = 10.0;
const double kCornerRadiusS = 5.0;
const double kCornerRadiusM = 15.0;
const double kCornerRadiusL = 20.0;
const double kCornerRadiusXL = 25.0;
const double kCornerRadiusXXL = 30.0;

const double kSpacing = 10.0;
const double kSpacingS = 5.0;
const double kSpacingM = 15.0;
const double kSpacingL = 20.0;
const double kSpacingXL = 25.0;
const double kSpacingXXL = 30.0;

const double kIconSize = 24.0;
const double kIconSizeXS = 16.0;
const double kIconSizeS = 20.0;
const double kIconSizeM = 30.0;
const double kIconSizeL = 40.0;
const double kIconSizeXL = 50.0;
const double kIconSizeXXL = 60.0;

const double kFontSize = 14.0;
const double kFontSizeS = 12.0;
const double kFontSizeM = 16.0;
const double kFontSizeL = 18.0;
const double kFontSizeXL = 20.0;
const double kFontSizeXXL = 24.0;


const double kElevation = 5.0;
const double kElevationS = 2.0;
const double kElevationM = 10.0;
const double kElevationL = 15.0;
const double kElevationXL = 20.0;
const double kElevationXXL = 25.0;

const double kOpacity = 0.5;
const double kOpacityS = 0.3;
const double kOpacityM = 0.7;
const double kOpacityL = 0.8;
const double kOpacityXL = 0.9;



class ResponsiveMedia {
  BuildContext context;

  ResponsiveMedia(this.context);

  AspectRatioResponsive get aspectRatio {
    if(MediaQuery.of(context).size.aspectRatio >= 3.1){
      return AspectRatioResponsive.thirtyTwoNine;
    }
    if (MediaQuery.of(context).size.aspectRatio >= 2.3) {
      return AspectRatioResponsive.twentyOneNine;
    }
    if (MediaQuery.of(context).size.aspectRatio >= 1.7) {
      return AspectRatioResponsive.sixteenNine;
    }  if (MediaQuery.of(context).size.aspectRatio >= 1.3) {
      return AspectRatioResponsive.fourThree;
    }  if (MediaQuery.of(context).size.aspectRatio >= 0.9) {
      return AspectRatioResponsive.oneOne;
    }
    return AspectRatioResponsive.oneOne;

  }
  bool isLargerThan(AspectRatioResponsive ratio){
    switch(ratio){
      case AspectRatioResponsive.sixteenNine:
        return MediaQuery.of(context).size.aspectRatio >= 1.7;
      case AspectRatioResponsive.fourThree:
        return MediaQuery.of(context).size.aspectRatio >= 1.3;
      case AspectRatioResponsive.oneOne:
        return MediaQuery.of(context).size.aspectRatio >= 0.9;
      case AspectRatioResponsive.twentyOneNine:
        return MediaQuery.of(context).size.aspectRatio >= 2.3;
      case AspectRatioResponsive.thirtyTwoNine:
        return MediaQuery.of(context).size.aspectRatio >= 3.1;
    }
  }

  bool isSmallerThan(AspectRatioResponsive ratio){
    switch(ratio){
      case AspectRatioResponsive.sixteenNine:
        return MediaQuery.of(context).size.aspectRatio <= 1.7;
      case AspectRatioResponsive.fourThree:
        return MediaQuery.of(context).size.aspectRatio <= 1.3;
      case AspectRatioResponsive.oneOne:
        return MediaQuery.of(context).size.aspectRatio <= 0.9;
      case AspectRatioResponsive.twentyOneNine:
        return MediaQuery.of(context).size.aspectRatio <= 2.3;
      case AspectRatioResponsive.thirtyTwoNine:
        return MediaQuery.of(context).size.aspectRatio <= 3.1;
    }
  }


}
enum AspectRatioResponsive{
   sixteenNine,
    fourThree,
    oneOne,
    twentyOneNine,
    thirtyTwoNine,
}
