// To parse this JSON data, do
//
//     final listPlaylistModel = listPlaylistModelFromJson(jsonString);

import 'dart:convert';

ListPlaylistModel listPlaylistModelFromJson(String str) => ListPlaylistModel.fromJson(json.decode(str));

String listPlaylistModelToJson(ListPlaylistModel data) => json.encode(data.toJson());

class ListPlaylistModel {
  String href;
  List<Playlist> items;
  int limit;
  dynamic next;
  int offset;
  dynamic previous;
  int total;

  ListPlaylistModel({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory ListPlaylistModel.fromJson(Map<String, dynamic> json) => ListPlaylistModel(
    href: json["href"],
    items: List<Playlist>.from(json["items"].map((x) => Playlist.fromJson(x))),
    limit: json["limit"],
    next: json["next"],
    offset: json["offset"],
    previous: json["previous"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "limit": limit,
    "next": next,
    "offset": offset,
    "previous": previous,
    "total": total,
  };
}

class Playlist {
  bool collaborative;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<ImageItem> images;
  String name;
  Owner owner;
  bool public;
  String snapshotId;
  Tracks tracks;
  String type;
  String uri;

  Playlist({
    this.collaborative,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.owner,
    this.public,
    this.snapshotId,
    this.tracks,
    this.type,
    this.uri,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
    collaborative: json["collaborative"],
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    images: List<ImageItem>.from(json["images"].map((x) => ImageItem.fromJson(x))),
    name: json["name"],
    owner: Owner.fromJson(json["owner"]),
    public: json["public"],
    snapshotId: json["snapshot_id"],
    tracks: Tracks.fromJson(json["tracks"]),
    type: json["type"],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "collaborative": collaborative,
    "external_urls": externalUrls.toJson(),
    "href": href,
    "id": id,
    "images": List<ImageItem>.from(images.map((x) => x.toJson())),
    "name": name,
    "owner": owner.toJson(),
    "public": public,
    "snapshot_id": snapshotId,
    "tracks": tracks.toJson(),
    "type": type,
    "uri": uri,
  };



}

class ExternalUrls {
  String spotify;

  ExternalUrls({
    this.spotify,
  });

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
    spotify: json["spotify"],
  );

  Map<String, dynamic> toJson() => {
    "spotify": spotify,
  };
}

class Owner {
  ExternalUrls externalUrls;
  String href;
  String id;
  String type;
  String uri;

  Owner({
    this.externalUrls,
    this.href,
    this.id,
    this.type,
    this.uri,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    type: json["type"],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "external_urls": externalUrls.toJson(),
    "href": href,
    "id": id,
    "type": type,
    "uri": uri,
  };
}

class Tracks {
  String href;
  int total;

  Tracks({
    this.href,
    this.total,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
    href: json["href"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
    "total": total,
  };
}

class ImageItem {
  dynamic height;
  String url;
  dynamic width;

  ImageItem({
    this.height,
    this.url,
    this.width,
  });

  factory ImageItem.fromJson(Map<String, dynamic> json) => ImageItem(
    height: json["height"],
    url: json["url"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "url": url,
    "width": width,
  };
}
