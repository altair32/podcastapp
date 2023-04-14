class model {
  final int? id;
  final string? title, author, imgurl, playbackid;

  PodModel({
    this.id, this.title, this.author, this.imgurl, this.playbackid
  });

  factory PodModel.fromJson(Map<String, dynamic> json){
    return PodModel(
        id: json['id'],
        title: json['attributes']['title'],
        imgurl: json['attributes']['image']['data']?['attributes']['url'] ?? "",
        playbackid: json['attributes']['playbackid'],
        author: json['attributes']['author']);

  }
}