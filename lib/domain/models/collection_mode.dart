import 'package:new_test_stuff/domain/models/user_model.dart';

class CollectionModel {
  CollectionModel({
    this.id,
    this.title,
    this.description,
    this.publishedAt,
    this.lastCollectedAt,
    this.updatedAt,
    this.totalPhotos,
    this.private,
    this.shareKey,
    this.user,
    this.links,
  });

  CollectionModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    publishedAt = json['published_at'];
    lastCollectedAt = json['last_collected_at'];
    updatedAt = json['updated_at'];
    totalPhotos = json['total_photos'];
    private = json['private'];
    shareKey = json['share_key'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }
  int? id;
  String? title;
  String? description;
  String? publishedAt;
  String? lastCollectedAt;
  String? updatedAt;
  int? totalPhotos;
  bool? private;
  String? shareKey;
  UserModel? user;
  Links? links;
  CollectionModel copyWith({
    int? id,
    String? title,
    String? description,
    String? publishedAt,
    String? lastCollectedAt,
    String? updatedAt,
    int? totalPhotos,
    bool? private,
    String? shareKey,
    UserModel? user,
    Links? links,
  }) =>
      CollectionModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        publishedAt: publishedAt ?? this.publishedAt,
        lastCollectedAt: lastCollectedAt ?? this.lastCollectedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        totalPhotos: totalPhotos ?? this.totalPhotos,
        private: private ?? this.private,
        shareKey: shareKey ?? this.shareKey,
        user: user ?? this.user,
        links: links ?? this.links,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['published_at'] = publishedAt;
    map['last_collected_at'] = lastCollectedAt;
    map['updated_at'] = updatedAt;
    map['total_photos'] = totalPhotos;
    map['private'] = private;
    map['share_key'] = shareKey;

    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (links != null) {
      map['links'] = links?.toJson();
    }
    return map;
  }
}
