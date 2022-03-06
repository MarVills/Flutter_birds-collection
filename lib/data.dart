/*
  1.Allen's Hummingbird
  2.Anna's Hummingbird
  3.Black Chinned Hummingbird
  4.Blue Throated Hummingbird
  5.Broad Bill Hummingbird
  6.Broad Tail Hummingbird
  7.Calliope Hummingbird
  8.Costa's Hummingbird
  9.Lucifer Hummingbird
  10.Magnificent Hummingbird
  11.Rofous Hummingbird
  12.Ruby Throated Hummingbird
  13.Violet Crowned Hummingbird
  */

class PhotoItem {
  final String image;
  final String name;
  PhotoItem(this.image, this.name);
}

final List<PhotoItem> items = [
  PhotoItem("lib/assets/images/allens.jpg", "Allen's Hummingbird"),
  PhotoItem("lib/assets/images/anna.jpg", "Anna's Hummingbird"),
  PhotoItem("lib/assets/images/black_chinned.jpg", "Black Chinned Hummingbird"),
  PhotoItem("lib/assets/images/blue_throated.jpg", "Blue Throated Hummingbird"),
  PhotoItem("lib/assets/images/broad_bill.jpg", "Broad Bill Hummingbird"),
  PhotoItem("lib/assets/images/broad_tailed.jpg", "Broad Tail Hummingbird"),
  PhotoItem("lib/assets/images/calliope.jpg", "Calliope Hummingbird"),
  PhotoItem("lib/assets/images/costas.jpg", "Costa's Hummingbird"),
  PhotoItem("lib/assets/images/lucifer.jpg", "Lucifer Hummingbird"),
  PhotoItem("lib/assets/images/magnificent.jpg", "Magnificent Hummingbird"),
  PhotoItem("lib/assets/images/rofous.jpg", "Rofous Hummingbird"),
  PhotoItem("lib/assets/images/ruby_throated.jpg", "Ruby Throated Hummingbird"),
  PhotoItem(
      "lib/assets/images/violet_crowned.jpg", "Violet Crowned Hummingbird"),
];

getData() {
  List dataList = [];
  Map<String, String> dataMap = new Map();
  dataMap["sci_name"] = "Selasphorus sasin";
  dataMap["description"] =
      "Summer breeder along coastal California from the southwestern corner of Oregon south to Los Angeles. Year-round residents on the Palos Verdes Peninsula.\n\n Allen's hummingbirds are often confused with rufous hummingbirds because of their similar orange plumage. Close inspection, however, shows a much greener back and head on Allen’s hummingbirds, as well as more extensive orange on the flanks. Females can appear identical to rufous hummingbird females.";
  dataList.add(dataMap);
  //=================================
  dataMap = {};
  dataMap["sci_name"] = "Calypte anna";
  dataMap["description"] =
      "Year-round resident along the western coast of North America from southern British Columbia to southern California. Extensive year-round populations are also found southwestern Arizona.\n\n Anna's hummingbirds are familiar along the west coast. Males are instantly recognizable with a red or pink crown and extensive iridescent gorget, dusky greenish underparts and brighter green upperparts. Females are similar but paler on the underside and lack the extensive gorget, but may show some red or pink spotting on the throat.";
  dataList.add(dataMap);
  //=================================
  dataMap = {};
  dataMap["sci_name"] = "Archilochus alexandri";
  dataMap["description"] =
      "Summer breeder throughout the mountainous west from eastern Washington and Oregon through Idaho and as far south as southwestern Texas. Isolated summer populations also found in central California and along the southern California coast. \n\n The black-chinned hummingbird is one of the most common western hummingbirds. Males are easily identified by the iridescent purple band at the bottom of a dark gorget contrasting with a white collar, though the purple color is only seen in the best light. Females have green upperparts and white underparts, and they may show faint streaking on the throat. Both genders have exceptionally long bills.";
  dataList.add(dataMap);
  //=================================
  dataMap = {};
  dataMap["sci_name"] = "Lampornis clemenciae";
  dataMap["description"] =
      "Uncommon summer visitor to common summer resident in extreme southeastern Arizona and western Texas. Summer ranges may extend slightly further north when populations are high.\n\n The blue-throated hummingbird is another rare visitor to North America, but in some areas, it is becoming a more common seasonal resident. Boldly distinctive, males have a rich blue throat, white brow line, and white throat border with gray underparts and gray-green upperparts. Females have similar markings but lack the blue throat. Both genders have wide white tips on the corner tail feathers. These birds are also easily recognized by their size, with a five inch length that is larger than most other hummingbirds.";
  dataList.add(dataMap);
  //=================================
  dataMap = {};
  dataMap["sci_name"] = "Cynanthus latirostris";
  dataMap["description"] =
      "Summer breeder in south-central and southeastern Arizona and extreme southwestern New Mexico, with a few birds remaining in the same range year-round.\n\n  Broad-billed hummingbirds are often confused with magnificent hummingbirds because they share the same dark green and blue plumage, but the red bill with its broad base and black tip are distinctive. Females have bright green upperparts and gray underparts, with less extensive red on the bill and white post-ocular stripe. Broad-billed hummingbirds are also substantially smaller than magnificent hummingbirds, though size can be difficult to judge.";
  dataList.add(dataMap);
  //=================================
  dataMap = {};
  dataMap["sci_name"] = "Selasphorus platycercus";
  dataMap["description"] =
      "Summer breeder in the southwestern mountains of the United States, with populations as far west as eastern California and north to southern Idaho.\n\n At first glance, the broad-tailed hummingbird may seem identical to the eastern ruby-throated hummingbird, and range is a key characteristic to distinguish between the two species. A closer look, however, reveals that broad-tailed hummingbirds have a rufous patch in their tails that ruby-throats lack. Female broad-tailed hummingbirds also show a light rufous wash on their flanks and streaking on the throat that female ruby-throated hummingbirds do not have.";
  dataList.add(dataMap);
  //=================================
  dataMap = {};
  dataMap["sci_name"] = "Stellula calliope";
  dataMap["description"] =
      "Summer breeder in southern British Columbia and as far south as Idaho and northern Nevada, Utah, and California. Summer range extends east to western Montana and west to eastern and central Washington and Oregon.\n\n  At just 3.25 inches in length, the calliope hummingbird is the smallest North American hummingbird and one of the most beautiful. Males have a streaked pink or magenta gorget that extends to points on the sides. Females lack the gorget but share the bright green upperparts and slight rufous wash on the flanks of white underparts. Males have more extensive green on the flanks.";
  dataList.add(dataMap);
  //=================================
  dataMap = {};
  dataMap["sci_name"] = "Calypte costae";
  dataMap["description"] =
      "Year-round resident in southeastern California and southwestern Arizona as far north as the southern tip of Nevada. Summer breeding range extends further north and east.\n\n Costa’s hummingbirds are distinctive for the males’ bright purple or pinkish crown and gorget that extends into sharp points at the sides of the throat. Females lack the iridescent color but share the green upperparts and whitish underparts with a slight green wash along the flanks.";
  dataList.add(dataMap);
  //=================================
  dataMap = {};
  dataMap["sci_name"] = "Calothorax lucifer";
  dataMap["description"] =
      "Rare summer visitor and occasional breeder in west Texas as well as extreme southeastern Arizona southwestern New Mexico.\n\n The Lucifer hummingbird is a rare but beautiful hummingbird in North America. Males have a boldly iridescent purple throat, green upperparts and flanks, and a dark, forked tail. Females have green upperparts and buff underparts and can be identified by a blurry gray ear streak. Both genders have heavy, long bills that are curved downward.";
  dataList.add(dataMap);
  //=================================
  dataMap = {};
  dataMap["sci_name"] = "Eugenes fulgens";
  dataMap["description"] =
      "Summer breeder in the corners of southeastern Arizona and southwestern New Mexico. Rare summer visitors, occasionally seen in western Texas.\n\n The dark plumage of male magnificent hummingbirds is easily recognizable, as is the long, straight bill. Males have dark green bodies with brighter blue gorgets and violet crowns. Females are plainer with bright green upperparts and grayish-white underparts. Both genders have a bold white spot behind the eye that is easily visible. At 5-5.25 inches in length, this is one of the largest hummingbirds in North America.";
  dataList.add(dataMap);
  //=================================
  dataMap = {};
  dataMap["sci_name"] = "Selasphorus rufus";
  dataMap["description"] =
      "Summer breeder along the northern Pacific coast, including Washington, Oregon, Idaho and British Columbia, with some individuals as far north as Alaska. Some birds winter in the southeastern United States and along the Gulf Coast.\n\n Male rufous hummingbirds are unmistakable with their orange plumage and iridescent orange-red throat. Females are less distinct but have a rufous wash over their green upperparts and along their flanks bordering a white chest and abdomen. Females also have spotting on the throat.";
  dataList.add(dataMap);
  //=================================
  dataMap = {};
  dataMap["sci_name"] = "Archilochus colubris";
  dataMap["description"] =
      " Summer breeder in the eastern and central United States and the southern edge of eastern and central Canada.\n\n  The ruby-throated hummingbird is one of the most common hummingbirds in North America and it is the only one seen regularly in the east, though other vagrants may appear at any time. The males are aptly named for their vibrant strawberry-red gorget, set off by a contrasting white collar on the throat. Females are plainer but share the iridescent green upperparts and white underparts.";
  dataList.add(dataMap);
  //=================================
  dataMap = {};
  dataMap["sci_name"] = "Amazilia violiceps";
  dataMap["description"] =
      "Uncommon summer resident in extreme southeastern Arizona and southwestern corner of New Mexico.\n\n Violet-crowned hummingbirds are relatively uncommon in the United States. Their distinctive white underparts, plain white throat, gray-green upperparts, and blue-purple crown make them instantly recognizable when they are seen. The bill is also a distinctive red with a black tip. Male and female birds look similar, though females are slightly duller.";
  dataList.add(dataMap);
  //=================================
  dataMap = {};
  return dataList;
}
