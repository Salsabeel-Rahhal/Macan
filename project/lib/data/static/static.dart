import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project/core/constant/image_asset.dart';
import 'package:project/data/model/onboardingmodel.dart';

import '../model/shops_model.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: "2".tr,
    image: ImageAsset.onBoardingImageOne,
    body: "3".tr,
  ),
  OnBoardingModel(
    title: "4".tr,
    image: ImageAsset.onBoardingImageTwo,
    body: "5".tr,
  ),
  OnBoardingModel(
    title: "6".tr,
    image: ImageAsset.onBoardingImageThree,
    body: "7".tr,
  ),
];

List<Shop> shopImageUrl = [
  Shop(
    image:
        "https://th.bing.com/th/id/OIP.PxmOOLKTDAP9nb-6ryOBVAHaEK?pid=ImgDet&rs=1",
  ),
  Shop(
    image:
        "https://media-cdn.tripadvisor.com/media/photo-s/14/42/7a/3a/photo0jpg.jpg",
  ),
  Shop(
    image:
        "https://th.bing.com/th/id/OIP.wBPn4EPRbTkylFA9NJg28QHaFj?pid=ImgDet&rs=1",
  ),
  Shop(
    image:
        "https://media-cdn.tripadvisor.com/media/photo-s/1a/4b/a7/bd/img-20191211-wa0005-largejpg.jpg",
  ),
  Shop(
    image:
        "https://th.bing.com/th/id/OIP.8PjlvRPx42JEGcNa0245HwAAAA?pid=ImgDet&rs=1",
  ),
  Shop(
    image:
        "https://th.bing.com/th/id/OIP.B0Y426PaPqJj7HwNlI5s3QHaE8?pid=ImgDet&rs=1",
  ),
  Shop(
    image:
        "https://i.pinimg.com/originals/ef/18/ee/ef18ee9860c9896eb56517faad0a90d0.jpg",
  ),
  Shop(
    image:
        "https://media-cdn.tripadvisor.com/media/photo-s/15/c3/72/d8/vivid-the-boulevard.jpg",
  ),
  Shop(
    image:
        "https://th.bing.com/th/id/R.987e00991ef876ae276fd7fc23cfece1?rik=EHyz8X89JB93QQ&pid=ImgRaw&r=0",
  ),
  Shop(
    image:
        "https://th.bing.com/th/id/OIP.ovDg68XVkZ33L_iRdPajyAHaHZ?pid=ImgDet&rs=1",
  ),
  Shop(
    image:
        "https://th.bing.com/th/id/OIP.x6rLU7iG9ju254PFdFx6RQAAAA?pid=ImgDet&rs=1",
  ),
  Shop(
    image:
        "https://th.bing.com/th/id/OIP.wERNN6Ucaku6RYyHVzsjCQHaE8?pid=ImgDet&rs=1",
  ),
  Shop(
    image:
        "https://th.bing.com/th/id/R.3cd32a6ab6dea8a98cafcabac4ae256a?rik=K3eBrEZa5q58hg&riu=http%3a%2f%2fwww.twirltheglobe.com%2fwp-content%2fuploads%2f2016%2f05%2fBeit-Sitti-640x427.jpg&ehk=8clMdSS8qJ5fCbX67OPgOKfWGEjpMZc2gB8NqASBaHc%3d&risl=&pid=ImgRaw&r=0",
  ),
  Shop(
    image:
        "https://th.bing.com/th/id/OIP.gnyFKCo1d6MZdKlRIzMdgAHaHa?pid=ImgDet&rs=1",
  ),
  Shop(
    image:
        "https://media-cdn.tripadvisor.com/media/photo-s/13/58/9f/65/a-presentation-of-the.jpg",
  ),
  Shop(
    image:
        "https://media-cdn.tripadvisor.com/media/photo-s/03/ca/9b/16/caffe-strada.jpg",
  ),
  Shop(
    image:
        "https://stepintojordan.com/wp-content/uploads/2019/09/Abu-Jbara-Amman-Restaurant-Amman--768x576.jpg",
  ),
  Shop(
    image:
        "https://media-cdn.tripadvisor.com/media/photo-s/15/5c/0d/3e/grilled-lamb-skewers.jpg",
  ),
  Shop(
    image:
        "https://th.bing.com/th/id/R.3621a94bda65312cbfaaf4231165d8ad?rik=YZxge2Q%2bnKlGHA&riu=http%3a%2f%2fwww.nogarlicnoonions.com%2fwp-content%2fuploads%2f2012%2f11%2fKababji_Amman_Lebanese_Restaurant_Jordan37.jpg&ehk=5c5gbmFWc%2foDqwPhEJV71OidpfOTEW2F%2b7R0QvsTBcE%3d&risl=&pid=ImgRaw&r=0",
  ),
  Shop(
    image:
        "https://th.bing.com/th?id=AsrVusO%2bDlXU7%2bg480x360&w=200&h=160&c=7&rs=1&qlt=80&o=6&cdv=1&dpr=1.3&pid=Local",
  ),
  Shop(
    image:
        "https://th.bing.com/th?id=ODL.54ee71751d80799d89866fb196b56015&w=256&h=182&c=12&rs=1&qlt=90&o=6&dpr=1.3&pid=13.1",
  ),
  Shop(
    image:
        "https://th.bing.com/th/id/OIP.vnHsebWTN_6gUtQZlPPzwgHaGD?pid=ImgDet&rs=1",
  ),
  Shop(
    image:
        "https://th.bing.com/th/id/OIP.S_MwO-sBLULG9tqkDuYMaAHaE8?w=272&h=181&c=7&r=0&o=5&dpr=1.3&pid=1.7",
  ),
  Shop(
    image:
        "https://www.bing.com/th?id=AixQNkkPduTjoAw480x360&w=205&h=180&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
  ),
  Shop(
    image:
        "https://cheetay-prod-media.s3.amazonaws.com/production/media/images/partners/2020/05/The_Coffee_Bean__Tea_Leaf_Beverages_bgN5GcJ.jpg",
  ),
  Shop(
    image:
        "https://media-cdn.tripadvisor.com/media/photo-p/14/2f/c2/fa/cantina-32.jpg",
  ),
  Shop(
    image:
        "https://th.bing.com/th?id=AlWOcd6L3D%2f1JXw480x360&w=186&h=140&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
  ),
  Shop(
    image:
        "https://fastly.4sqi.net/img/general/1398x536/494568572_9vSXGzkQrp4iNMfLtR2dBmoCcO0WTtij3cZ6dTlHbqQ.jpg",
  ),
  Shop(
    image:
        "https://www.bing.com/th?id=Aj%2bkGht9qg3vqPw480x360&w=205&h=180&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
  ),
  Shop(
    image:
        "https://th.bing.com/th?id=AYIesNKIDqB5FhQ480x360&w=186&h=140&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
  ),
  Shop(
    image:
        "https://th.bing.com/th?id=AHNtCesQgSgRN5Q480x360&w=186&h=140&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
  ),
  Shop(
    image:
        "https://th.bing.com/th/id/OIP.6Z9TEjQKuS_VaOCYBom4kAHaE6?w=202&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
  ),
  Shop(
    image:
        "https://media-cdn.tripadvisor.com/media/photo-s/10/82/eb/34/the-new-look-of-la-maison.jpg",
  ),
  Shop(
    image:
        "https://9968c6ef49dc043599a5-e151928c3d69a5a4a2d07a8bf3efa90a.ssl.cf2.rackcdn.com/7_71_158_c.jpg",
  ),
];

// switch (_selectedValue) {
//   case SwitchValue.case1:
//     // Do something for case 1
//     break;
//   case SwitchValue.case2:
//     // Do something for case 2
//     break;
//   case SwitchValue.case3:
//     // Do something for case 3
//     break;
// }
