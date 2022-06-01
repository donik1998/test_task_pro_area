import 'dart:convert';

class UserModel {
  UserModel({
    this.id,
    this.updatedAt,
    this.username,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.totalLikes,
    this.totalPhotos,
    this.totalCollections,
    this.followedByUser,
    this.downloads,
    this.uploadsRemaining,
    this.instagramUsername,
    this.email,
    this.links,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    twitterUsername = json['twitter_username'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    totalCollections = json['total_collections'];
    followedByUser = json['followed_by_user'];
    downloads = json['downloads'];
    uploadsRemaining = json['uploads_remaining'];
    instagramUsername = json['instagram_username'];
    email = json['email'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }
  String? id;
  String? updatedAt;
  String? username;
  String? firstName;
  String? lastName;
  String? twitterUsername;
  dynamic portfolioUrl;
  String? bio;
  dynamic location;
  int? totalLikes;
  int? totalPhotos;
  int? totalCollections;
  bool? followedByUser;
  int? downloads;
  int? uploadsRemaining;
  String? instagramUsername;
  String? email;
  Links? links;
  UserModel copyWith({
    String? id,
    String? updatedAt,
    String? username,
    String? firstName,
    String? lastName,
    String? twitterUsername,
    dynamic portfolioUrl,
    String? bio,
    dynamic location,
    int? totalLikes,
    int? totalPhotos,
    int? totalCollections,
    bool? followedByUser,
    int? downloads,
    int? uploadsRemaining,
    String? instagramUsername,
    String? email,
    Links? links,
  }) =>
      UserModel(
        id: id ?? this.id,
        updatedAt: updatedAt ?? this.updatedAt,
        username: username ?? this.username,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        twitterUsername: twitterUsername ?? this.twitterUsername,
        portfolioUrl: portfolioUrl ?? this.portfolioUrl,
        bio: bio ?? this.bio,
        location: location ?? this.location,
        totalLikes: totalLikes ?? this.totalLikes,
        totalPhotos: totalPhotos ?? this.totalPhotos,
        totalCollections: totalCollections ?? this.totalCollections,
        followedByUser: followedByUser ?? this.followedByUser,
        downloads: downloads ?? this.downloads,
        uploadsRemaining: uploadsRemaining ?? this.uploadsRemaining,
        instagramUsername: instagramUsername ?? this.instagramUsername,
        email: email ?? this.email,
        links: links ?? this.links,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['updated_at'] = updatedAt;
    map['username'] = username;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['twitter_username'] = twitterUsername;
    map['portfolio_url'] = portfolioUrl;
    map['bio'] = bio;
    map['location'] = location;
    map['total_likes'] = totalLikes;
    map['total_photos'] = totalPhotos;
    map['total_collections'] = totalCollections;
    map['followed_by_user'] = followedByUser;
    map['downloads'] = downloads;
    map['uploads_remaining'] = uploadsRemaining;
    map['instagram_username'] = instagramUsername;
    map['email'] = email;
    if (links != null) {
      map['links'] = links?.toJson();
    }
    return map;
  }
}

Links linksFromJson(String str) => Links.fromJson(json.decode(str));
String linksToJson(Links data) => json.encode(data.toJson());

class Links {
  Links({
    this.self,
    this.html,
    this.photos,
    this.likes,
    this.portfolio,
  });

  Links.fromJson(dynamic json) {
    self = json['self'];
    html = json['html'];
    photos = json['photos'];
    likes = json['likes'];
    portfolio = json['portfolio'];
  }
  String? self;
  String? html;
  String? photos;
  String? likes;
  String? portfolio;
  Links copyWith({
    String? self,
    String? html,
    String? photos,
    String? likes,
    String? portfolio,
  }) =>
      Links(
        self: self ?? this.self,
        html: html ?? this.html,
        photos: photos ?? this.photos,
        likes: likes ?? this.likes,
        portfolio: portfolio ?? this.portfolio,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['self'] = self;
    map['html'] = html;
    map['photos'] = photos;
    map['likes'] = likes;
    map['portfolio'] = portfolio;
    return map;
  }
}
