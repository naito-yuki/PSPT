class Collection {
  int collectionNo;
  int userNo;
  String imageUrl;
  String collectionName;
  String description;
  
  Collection(int collectionNo, int userNo, String imageUrl, String collectionName, String description) {
    this.collectionNo = collectionNo;
    this.userNo = userNo;
    this.imageUrl = imageUrl;
    this.collectionName = collectionName;
    this.description = description;
  }
}