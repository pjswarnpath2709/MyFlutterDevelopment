import 'package:delimeals_self/models/ordered_items_modal.dart';

import '../models/shop_item_model.dart';
import '../models/category_item_model.dart';

const DUMMY_CATEGORY = [
  CategoryItem(
    cat_Id: 'men',
    category: 'MEN',
    discription: 'Fantastic Clothing options for men',
  ),
  CategoryItem(
    cat_Id: 'women',
    category: 'WOMEN',
    discription: 'Gorgeous and new collections of clothes for women',
  ),
  CategoryItem(
    cat_Id: 'teenboy',
    category: 'Teen Boys',
    discription:
        'Trendy and comfiratble clothes for the younger generation boys looking for cool looks',
  ),
  CategoryItem(
    cat_Id: 'teengirl',
    category: 'TEEN GIRLS',
    discription:
        'Astonishing  Clothes for the teen girls goes with both fashion and comfirt',
  ),
  CategoryItem(
    cat_Id: 'boy',
    category: 'BOYS',
    discription:
        'have some cool looks,little champs, lets dig into funky boy styles ',
  ),
  CategoryItem(
    cat_Id: 'girl',
    category: 'GIRLS',
    discription:
        'Rock on girls with your cuteness , cute designs are waiting for you!',
  )
];

const DUMMY_ITEMS = [
  //FOR THE MEN CATEGORY
  //pants-1
  ShopItem(
    catId: 'men',
    title: 'Green Jogger Pants',
    imageUrl:
        "https://cdn.shopify.com/s/files/1/0752/6435/products/PASTOGREENTROUSER_16.jpg?v=1645439760",
    price: 1000.00,
    type: 'pants',
    ratings: 3,
  ),
  //pants -2
  ShopItem(
    catId: 'men',
    title: "Classic Grey",
    imageUrl:
        "https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/11295348/2020/1/30/e5e1075a-a1ba-4ecf-a714-a79d631cecd31580380185763-Louis-Philippe-Men-Trousers-9811580380183657-1.jpg",
    price: 1050.00,
    type: 'pants',
    ratings: 4,
  ),
  //pants-3
  ShopItem(
    catId: 'men',
    title: "Green Check Pants",
    imageUrl:
        "https://images.meesho.com/images/products/50317403/sb4p1_512.jpg",
    price: 1445.00,
    type: 'pants',
    ratings: 5,
  ),
  //pants-4
  ShopItem(
    catId: 'men',
    title: "Royale Brown",
    imageUrl:
        "https://cdn.shopify.com/s/files/1/1231/6442/products/cottonworld-men-s-pants-men-s-cotton-lycra-brown-slim-fit-pants-15659377492021_1400x.jpg?v=1597075880",
    price: 1860.00,
    type: 'pants',
    ratings: 2,
  ),
  // shirts-1
  ShopItem(
    catId: "men",
    title: "Shaddy Green Check",
    imageUrl:
        "https://assets.ajio.com/medias/sys_master/root/20210703/086x/60df9a82f997ddb3121a5da7/-473Wx593H-462587074-olive-MODEL.jpg",
    price: 1000.00,
    type: "shirts",
    ratings: 4,
  ),
  //shirts-2
  ShopItem(
    catId: "men",
    title: "Whisper Stripes",
    imageUrl:
        "https://assets.ajio.com/medias/sys_master/root/20210403/AcbB/6068b6caf997dd7b64643def/-473Wx593H-462152986-green-MODEL.jpg",
    price: 1700.00,
    type: "shirts",
    ratings: 3,
  ),
  //shirts-3
  ShopItem(
    catId: "men",
    title: "Classico",
    imageUrl:
        "https://i.pinimg.com/originals/ba/00/d5/ba00d55e39e2773d86955b71f6c0b72c.jpg",
    price: 1800.00,
    type: "shirts",
    ratings: 2,
  ),
  //shirts-4
  ShopItem(
    catId: "men",
    title: "Greyish Check",
    imageUrl:
        "https://assets.ajio.com/medias/sys_master/root/hb5/h48/11038093606942/-473Wx593H-460153215-grey-MODEL.jpg",
    price: 1090.00,
    type: "shirts",
    ratings: 1,
  ),
  //shoes-1
  ShopItem(
    catId: "men",
    title: "Black Eagles",
    imageUrl:
        "https://5.imimg.com/data5/CI/DI/GY/SELLER-32493408/00-500x500.jpg",
    price: 2300.00,
    type: "shoes",
    ratings: 4,
  ),
  //shoes-2
  ShopItem(
    catId: "men",
    title: "Woody Musket",
    imageUrl:
        "https://cdn11.bigcommerce.com/s-pkla4xn3/images/stencil/1280x1280/products/20790/183133/Men-shoes-2018-fashion-new-arrivals-warm-winter-shoes-men-High-quality-frosted-suede-shoes-men__70277.1545975473.jpg?c=2?imbypass=on",
    price: 3130.00,
    type: "shoes",
    ratings: 5,
  ),
  //shoes-3
  ShopItem(
    catId: "men",
    title: "Sneakry Black",
    imageUrl:
        "https://5.imimg.com/data5/HM/ZA/IY/SELLER-84868583/men-sneakers-shoes-500x500.jpg",
    price: 2500.00,
    type: "shoes",
    ratings: 3,
  ),
  //shoes-4
  ShopItem(
    catId: "men",
    title: "Scketching Green",
    imageUrl:
        "https://www.skechers.com/dw/image/v2/BDCN_PRD/on/demandware.static/-/Library-Sites-SkechersSharedLibrary/default/dwf1eb6513/images/grid/SKX52942_ShopByStyleGridUpdate_Men_750x664_Casual_Sneakers.jpg",
    price: 34130.00,
    type: "shoes",
    ratings: 5,
  ),

  //FOR THE WOMEN CATEGORY
  //dress -1
  ShopItem(
    catId: "women",
    title: "Candy Purple",
    imageUrl: "https://m.media-amazon.com/images/I/91ElmMEHp5L._UY550_.jpg",
    price: 2000.00,
    type: 'dress',
    ratings: 3,
  ),
  //dress-2
  ShopItem(
    catId: "women",
    title: "Romantic Red",
    imageUrl:
        "https://images-na.ssl-images-amazon.com/images/I/71eKjKYI79L._UY550_.jpg",
    price: 6000.00,
    type: 'dress',
    ratings: 5,
  ),
  //dress-3
  ShopItem(
    catId: "women",
    title: "Black Piece",
    imageUrl:
        "https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/1556611/2016/9/23/11474622162374-Veni-Vidi-Vici-Women-Dresses-961474622162135-1.jpg",
    price: 3000.00,
    type: 'dress',
    ratings: 4,
  ),
  //dress-4
  ShopItem(
    catId: "women",
    title: "Slay Red",
    imageUrl: "https://m.media-amazon.com/images/I/616iagWl5CL._UY550_.jpg",
    price: 3000.00,
    type: 'dress',
    ratings: 4,
  ),
  //dress-5
  ShopItem(
    catId: "women",
    title: "Cute Pink",
    imageUrl:
        "https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/13581134/2021/11/18/77d98e7f-75f2-4dcf-bea2-443a837e95b71637229080165-SASSAFRAS-Dusty-Pink-Self-Design-Dobby-Weave-Wrap-Dress--Bel-1.jpg",
    price: 4000.00,
    type: 'dress',
    ratings: 5,
  ),
  //pants-1
  ShopItem(
    catId: "women",
    title: "Glossy Black",
    imageUrl:
        "https://assets.ajio.com/medias/sys_master/root/20210403/bceN/606861a7f997dd7b645d11de/-1117Wx1400H-461070618-black-MODEL.jpg",
    price: 2590.00,
    type: "pants",
    ratings: 4,
  ),
  //pants-2
  ShopItem(
    catId: "women",
    title: "Papaya Crush",
    imageUrl:
        "https://assets.ajio.com/medias/sys_master/root/20201223/G4WW/5fe36a0ef997dd8c83df7b60/-1117Wx1400H-441050654-brown-MODEL.jpg",
    price: 3290.00,
    type: "pants",
    ratings: 5,
  ),
  //pants-3
  ShopItem(
    catId: "women",
    title: "Bubble Pink",
    imageUrl:
        "https://www.rw-co.com/on/demandware.static/-/Sites/default/dw8374d7bb/RW_CA/2022/summer/lpvs/w-pants/lpv-women-pants-hero-m.jpg",
    price: 3590.00,
    type: "pants",
    ratings: 5,
  ),
  //pants-4
  ShopItem(
    catId: "women",
    title: "Rusty Woods",
    imageUrl:
        "https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/10856164/2019/11/4/bff61c54-ff18-44e6-9602-d98a4b9407741572850621470-SASSAFRAS-Women-Trousers-1721572850619904-1.jpg",
    price: 2390.00,
    type: "pants",
    ratings: 4,
  ),
  //pants-5
  ShopItem(
    catId: "women",
    title: "Checky Greys",
    imageUrl:
        "https://assets.ajio.com/medias/sys_master/root/20210115/kGf2/6001b6ae7cdb8c1f142a3de3/-473Wx593H-460748536-darkgrey-MODEL.jpg",
    price: 2590.00,
    type: "pants",
    ratings: 3,
  ),

  //ITEMS FOR THE TEEN BOYS
  //shirts-1
  ShopItem(
    catId: "teenboy",
    title: "Funcky Boy",
    imageUrl: "https://m.media-amazon.com/images/I/61zneYkX1hL._UX569_.jpg",
    price: 1000.00,
    type: "shirts",
    ratings: 2,
  ),
  //shirts-2
  ShopItem(
    catId: "teenboy",
    title: "Busy White",
    imageUrl:
        "https://i.pinimg.com/736x/fe/f1/e9/fef1e9233eb888daab4ea63f25840967.jpg",
    price: 1500.00,
    type: "shirts",
    ratings: 3,
  ),
  //shirts-3
  ShopItem(
    catId: "teenboy",
    title: "Danger Black",
    imageUrl:
        "https://i.pinimg.com/236x/fd/48/b9/fd48b923c683adce7a82067532e17ab7--teenage-guys-skull-t-shirts.jpg",
    price: 2000.00,
    type: "shirts",
    ratings: 4,
  ),
  //shirts-4
  ShopItem(
    catId: "teenboy",
    title: "Gant",
    imageUrl:
        "https://xcdn.next.co.uk/COMMON/Items/Default/Default/ItemImages/AltItemShot/315x472/911345s.jpg",
    price: 1000.00,
    type: "shirts",
    ratings: 2,
  ),
  //shirts-5
  ShopItem(
    catId: "teenboy",
    title: "Message",
    imageUrl:
        "https://i.pinimg.com/564x/ac/88/87/ac88876caf496871e89a20c7da77c781.jpg",
    price: 1500.00,
    type: "shirts",
    ratings: 3,
  ),
  //shorts-1
  ShopItem(
    catId: "teenboy",
    title: "Boxers",
    imageUrl: "https://m.media-amazon.com/images/I/71B+2bPzi8L._UL1500_.jpg",
    price: 1000.00,
    type: 'shorts',
    ratings: 3,
  ),
  //shorts-2
  ShopItem(
    catId: "teenboy",
    title: "Cool Summer",
    imageUrl: "https://www.deeluxe-shop.com/54783-thickbox_default/slog.jpg",
    price: 1100.00,
    type: 'shorts',
    ratings: 4,
  ),
  //shorts-3
  ShopItem(
    catId: "teenboy",
    title: "Jeany Blue",
    imageUrl:
        "https://thumbs.dreamstime.com/b/confident-teen-boy-spending-time-outdoors-summer-confident-teen-boy-blue-t-shirt-denim-shorts-spending-time-outdoors-197105962.jpg",
    price: 1200.00,
    type: 'shorts',
    ratings: 4,
  ),
  //shorts-4
  ShopItem(
    catId: "teenboy",
    title: "Classic Short",
    imageUrl:
        "https://www.gant.com.kw/images/teen-boys-chino-shorts-p3557-33763_image.jpg",
    price: 1000.00,
    type: 'shorts',
    ratings: 3,
  ),

  //FOR TEEN GIRLS
  //shirts-1
  ShopItem(
    catId: "teengirl",
    title: "Topper Pink",
    imageUrl: "https://m.media-amazon.com/images/I/6139IFLBl1L._UL1324_.jpg",
    price: 1200.00,
    type: "shirts",
    ratings: 4,
  ),
  //shirts-2
  ShopItem(
    catId: "teengirl",
    title: "Summer White",
    imageUrl:
        "https://i.pinimg.com/736x/95/9d/e6/959de634f08b5cf3308d376456e00b8a.jpg",
    price: 1400.00,
    type: "shirts",
    ratings: 4,
  ),
  //shirts-3
  ShopItem(
    catId: "teengirl",
    title: "Fear Black",
    imageUrl:
        "https://images.unsplash.com/photo-1503342394128-c104d54dba01?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y3JvcCUyMHRvcHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
    price: 2000.00,
    type: "shirts",
    ratings: 5,
  ),
  //shirts-4
  ShopItem(
    catId: "teengirl",
    title: "Whiny Red",
    imageUrl:
        "https://images.unsplash.com/photo-1525550133628-43e58e551e6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y3JvcCUyMHRvcHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
    price: 2000.00,
    type: "shirts",
    ratings: 5,
  ),
  //shirts-5
  ShopItem(
    catId: "teengirl",
    title: "Wooly Grey",
    imageUrl:
        "https://images.unsplash.com/photo-1534126416832-a88fdf2911c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGNyb3AlMjB0b3B8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
    price: 1800.00,
    type: "shirts",
    ratings: 4,
  ),
  //shorts-1
  ShopItem(
    catId: "teengirl",
    title: "Floral Skirt",
    imageUrl:
        "https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/18002892/2022/5/6/6321393c-3576-40e6-ab34-aa92728714291651812493762NohVoh-SASSAFRASKidsGirlsBlueEmbroideredA-LineMiniSkirts1.jpg",
    price: 1500.00,
    type: "shorts",
    ratings: 3,
  ),
  //shorts-2
  ShopItem(
    catId: "teengirl",
    title: "Classic Brown",
    imageUrl:
        "https://images.unsplash.com/photo-1473351528942-b35ae8d43e42?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fHNob3J0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
    price: 1800.00,
    type: "shorts",
    ratings: 4,
  ),
  //shorts-3
  ShopItem(
    catId: "teengirl",
    title: "Sexy Jean",
    imageUrl:
        "https://i.pinimg.com/originals/2d/3d/b3/2d3db3287833e29dddbbf7c562a70d84.jpg",
    price: 1500.00,
    type: "shorts",
    ratings: 3,
  ),
  //shorts-4
  ShopItem(
    catId: "teengirl",
    title: "Sporty One",
    imageUrl:
        "https://images.unsplash.com/photo-1610625088984-b9fe690a52ea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHNleHklMjBzaG9ydHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
    price: 1800.00,
    type: "shorts",
    ratings: 4,
  ),
  //shorts-5
  ShopItem(
    catId: "teengirl",
    title: "Belgian SweetPie",
    imageUrl:
        "https://images.unsplash.com/photo-1590861337998-a4cf4036ccb8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHNraXJ0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
    price: 1900.00,
    type: "shorts",
    ratings: 5,
  ),
  // FOR THE BOYS
  //jeans-1
  ShopItem(
    catId: "boy",
    title: "Light Sky",
    imageUrl:
        "https://n1.sdlcdn.com/imgs/j/d/x/BOYS-JEANS-SDL360243885-3-6afa6.jpg",
    price: 1500.00,
    type: 'jeans',
    ratings: 3,
  ),
  //jeans-2
  ShopItem(
    catId: "boy",
    title: "Deep Ocean",
    imageUrl: "https://m.media-amazon.com/images/I/61FmbtNAo6L._UL1358_.jpg",
    price: 1200.00,
    type: 'jeans',
    ratings: 2,
  ),
  //jeans-3
  ShopItem(
    catId: "boy",
    title: "Rugid Boy",
    imageUrl:
        "https://i.pinimg.com/originals/72/d1/4a/72d14a1a66ba24eb8af1f2c591b24da7.jpg",
    price: 2500.00,
    type: 'jeans',
    ratings: 5,
  ),
  //jeans-4
  ShopItem(
    catId: "boy",
    title: "Slim Boy",
    imageUrl:
        "https://www.justjeans.co.nz/JJ/aurora/images/products/large/164001_bluefin_l.jpg?i10c=img.resize(width:256)",
    price: 2000.00,
    type: 'jeans',
    ratings: 4,
  ),
  //jeans-5
  ShopItem(
    catId: "boy",
    title: "Light Purple",
    imageUrl: "https://media.boohooman.com/i/boohooman/kzz97475_blue_xl",
    price: 2000.00,
    type: 'jeans',
    ratings: 4,
  ),

  //shirts-1
  ShopItem(
    catId: "boy",
    title: "Deep Thaughts",
    imageUrl:
        "https://images.unsplash.com/photo-1592159945470-474d31a87d03?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHRlZW4lMjBib3lzJTIwc2hpcnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
    price: 2000.00,
    type: "shirts",
    ratings: 4,
  ),
  //shirts-2
  ShopItem(
    catId: "boy",
    title: "Cosmic Black",
    imageUrl:
        "https://images.unsplash.com/photo-1590230082075-0fe312bbbab2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHRlZW4lMjBib3lzJTIwc2hpcnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
    price: 1500.00,
    type: "shirts",
    ratings: 3,
  ),
  //shirts-3
  ShopItem(
    catId: "boy",
    title: "Levi White",
    imageUrl:
        "https://images.unsplash.com/photo-1598948982052-50435a6e879c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fHRlZW4lMjBib3lzJTIwc2hpcnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
    price: 1800.00,
    type: "shirts",
    ratings: 4,
  ),
  //shirts-4
  ShopItem(
    catId: "boy",
    title: "Party Black",
    imageUrl:
        "https://images.unsplash.com/photo-1603183282361-8222ed090deb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzd8fHRlZW4lMjBib3lzJTIwc2hpcnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
    price: 1700.00,
    type: "shirts",
    ratings: 4,
  ),
  //shirts-5
  ShopItem(
    catId: "boy",
    title: "Cute Tomato",
    imageUrl:
        "https://images.unsplash.com/photo-1594562093792-7f5adc82ab50?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDB8fHRlZW4lMjBib3lzJTIwc2hpcnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
    price: 2500.00,
    type: "shirts",
    ratings: 5,
  ),
  //FOR THE GIRLS
  //shirts-1
  ShopItem(
    catId: "girl",
    title: "Wild Pink",
    imageUrl:
        "https://www.beyoung.in/api/cache/catalog/w/i/wild_and_free_pink_women_model_700x700.jpg",
    price: 1500.00,
    type: "shirts",
    ratings: 3,
  ),
  //shirts-2
  ShopItem(
    catId: "girl",
    title: "Cuppy WHite",
    imageUrl:
        "https://img.freepik.com/free-psd/t-shirt-mockup-beautiful-young-woman_23-2149292631.jpg?w=2000",
    price: 1700.00,
    type: "shirts",
    ratings: 4,
  ),
  //shirts-3
  ShopItem(
    catId: "girl",
    title: "Town Trail",
    imageUrl:
        "https://images.unsplash.com/photo-1554568218-0f1715e72254?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8dCUyMHNoaXJ0fGVufDB8fDB8fA==&w=1000&q=80",
    price: 2000.00,
    type: "shirts",
    ratings: 5,
  ),
  //shirts-4
  ShopItem(
    catId: "girl",
    title: "Cutey Pink",
    imageUrl: "https://www.vandelaydesign.com/wp-content/uploads/kids-tee.jpg",
    price: 1800.00,
    type: "shirts",
    ratings: 4,
  ),
  //shoes-1
  ShopItem(
    catId: "girl",
    title: "Quircky Heel",
    imageUrl:
        "https://images.meesho.com/images/products/69936055/cddxe_512.jpg",
    price: 3000.00,
    type: "shoes",
    ratings: 4,
  ),
  //shoes-2
  ShopItem(
    catId: "girl",
    title: "Peach Shine",
    imageUrl:
        "https://rukminim1.flixcart.com/image/714/857/k4k7f680/sandal/t/8/r/sd-0015-cream-7-40-7-jiansh-cream-original-imafnf49kdmmugzz.jpeg?q=50",
    price: 2100.00,
    type: "shoes",
    ratings: 3,
  ),
  //shoes-3
  ShopItem(
    catId: "girl",
    title: "Pearl Black",
    imageUrl:
        "https://i.pinimg.com/originals/0f/c4/13/0fc4130224854da3f155c98ae3a1aacb.jpg",
    price: 3500.00,
    type: "shoes",
    ratings: 4,
  ),
  //shoes-4
  ShopItem(
    catId: "girl",
    title: "Comfy Sand",
    imageUrl:
        "https://5.imimg.com/data5/XX/VD/MY-1825349/ladies-footwear-500x500.jpg",
    price: 2000.00,
    type: "shoes",
    ratings: 3,
  ),
];

class DataCollector {
  final List<ShopItem> _favoritesItems = [];
  final List<ShopItem> _cartItems = [];
  final List<PlacedOrder> _previousOrders = [];
  DataCollector._privateConstructor();
  static final DataCollector _instance = DataCollector._privateConstructor();
  factory DataCollector() {
    return _instance;
  }
  void addToFavorites(String title) {
    ShopItem shopitem =
        DUMMY_ITEMS.firstWhere((element) => element.title == title);

    if (!_favoritesItems.contains(shopitem)) {
      _favoritesItems.add(shopitem);
    }
    printFavorites();
  }

  void addToCart(String title) {
    ShopItem shopitem =
        DUMMY_ITEMS.firstWhere((element) => element.title == title);
    if (!_cartItems.contains(shopitem)) {
      _cartItems.add(shopitem);
    }
    printCart();
  }

  void removeFavouriteItem(String title) {
    if (_favoritesItems.isNotEmpty) {
      _favoritesItems.removeWhere((element) => element.title == title);
    }
    printFavorites();
  }

  void removeCartItem(String title) {
    if (_cartItems.isNotEmpty) {
      _cartItems.removeWhere((element) => element.title == title);
    }
    printCart();
  }

  bool favouritesAlreadyHas(String title) {
    ShopItem shopitem =
        DUMMY_ITEMS.firstWhere((element) => element.title == title);
    if (_favoritesItems.contains(shopitem)) {
      return true;
    }
    return false;
  }

  bool cartAlreadyHas(String title) {
    ShopItem shopitem =
        DUMMY_ITEMS.firstWhere((element) => element.title == title);
    if (_cartItems.contains(shopitem)) {
      return true;
    }
    return false;
  }

  void printFavorites() {
    print("favorite Items: ${this.hashCode.toString()}");
    print(_favoritesItems.map((e) => e.title).toList());
  }

  void clearFavorites() {
    _favoritesItems.clear();
  }

  void clearCart() {
    _cartItems.clear();
  }

  void printCart() {
    print("cartItems: ${this.hashCode.toString()}");
    print(_cartItems.map((e) => e.title).toList());
  }

  List<ShopItem> get getFavoritesItems {
    return _favoritesItems;
  }

  List<ShopItem> get getCartItems {
    return _cartItems;
  }

  void addOrderToPreviousOrderList(PlacedOrder order) {
    _previousOrders.add(order);
    printPreviousOrder();
  }

  List<PlacedOrder> get getPreviousOrders {
    return _previousOrders;
  }

  void printPreviousOrder() {
    for (final ele in _previousOrders) {
      print(ele.hashCode);
      print(ele.listofItemsOrdered);
    }
  }
}
