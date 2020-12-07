// To parse this JSON data, do
//
//     final TracksPlaylistModel = TracksPlaylistModelFromJson(jsonString);

import 'dart:convert';

TracksPlaylistModel TracksPlaylistModelFromJson(String str) => TracksPlaylistModel.fromJson(json.decode(str));

String TracksPlaylistModelToJson(TracksPlaylistModel data) => json.encode(data.toJson());

class TracksPlaylistModel {
  String href;
  List<Item> items;
  int limit;
  dynamic next;
  int offset;
  dynamic previous;
  int total;

  TracksPlaylistModel({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory TracksPlaylistModel.fromJson(Map<String, dynamic> json) => TracksPlaylistModel(
    href: json["href"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
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

class Item {
  DateTime addedAt;
  AddedBy addedBy;
  bool isLocal;
  Track track;

  Item({
    this.addedAt,
    this.addedBy,
    this.isLocal,
    this.track,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    addedAt: DateTime.parse(json["added_at"]),
    addedBy: AddedBy.fromJson(json["added_by"]),
    isLocal: json["is_local"],
    track: json["track"] == null ? null : Track.fromJson(json["track"]),
  );

  Map<String, dynamic> toJson() => {
    "added_at": addedAt.toIso8601String(),
    "added_by": addedBy.toJson(),
    "is_local": isLocal,
    "track": track == null ? null : track.toJson(),
  };
}

class AddedBy {
  ExternalUrls externalUrls;
  String href;
  String id;
  String type;
  String uri;
  String name;

  AddedBy({
    this.externalUrls,
    this.href,
    this.id,
    this.type,
    this.uri,
    this.name,
  });

  factory AddedBy.fromJson(Map<String, dynamic> json) => AddedBy(
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    type: json["type"],
    uri: json["uri"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "external_urls": externalUrls.toJson(),
    "href": href,
    "id": id,
    "type": type,
    "uri": uri,
    "name": name == null ? null : name,
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

class Track {
  Album album;
  List<AddedBy> artists;
  List<String> availableMarkets;
  int discNumber;
  int durationMs;
  bool explicit;
  ExternalIds externalIds;
  ExternalUrls externalUrls;
  String href;
  String id;
  String name;
  int popularity;
  String previewUrl;
  int trackNumber;
  String type;
  String uri;

  Track({
    this.album,
    this.artists,
    this.availableMarkets,
    this.discNumber,
    this.durationMs,
    this.explicit,
    this.externalIds,
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.popularity,
    this.previewUrl,
    this.trackNumber,
    this.type,
    this.uri,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
    album: Album.fromJson(json["album"]),
    artists: List<AddedBy>.from(json["artists"].map((x) => AddedBy.fromJson(x))),
    availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
    discNumber: json["disc_number"],
    durationMs: json["duration_ms"],
    explicit: json["explicit"],
    externalIds: ExternalIds.fromJson(json["external_ids"]),
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    name: json["name"],
    popularity: json["popularity"],
    previewUrl: json["preview_url"],
    trackNumber: json["track_number"],
    type: json["type"],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "album": album.toJson(),
    "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
    "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
    "disc_number": discNumber,
    "duration_ms": durationMs,
    "explicit": explicit,
    "external_ids": externalIds.toJson(),
    "external_urls": externalUrls.toJson(),
    "href": href,
    "id": id,
    "name": name,
    "popularity": popularity,
    "preview_url": previewUrl,
    "track_number": trackNumber,
    "type": type,
    "uri": uri,
  };
}

class Album {
  String albumType;
  List<AddedBy> artists;
  List<String> availableMarkets;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<ImageItem> images;
  String name;
  String type;
  String uri;

  Album({
    this.albumType,
    this.artists,
    this.availableMarkets,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.type,
    this.uri,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
    albumType: json["album_type"],
    artists: List<AddedBy>.from(json["artists"].map((x) => AddedBy.fromJson(x))),
    availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
    externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    href: json["href"],
    id: json["id"],
    images: List<ImageItem>.from(json["images"].map((x) => ImageItem.fromJson(x))),
    name: json["name"],
    type: json["type"],
    uri: json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "album_type": albumType,
    "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
    "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
    "external_urls": externalUrls.toJson(),
    "href": href,
    "id": id,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "name": name,
    "type": type,
    "uri": uri,
  };
}

class ImageItem {
  int height;
  String url;
  int width;

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

class ExternalIds {
  String isrc;

  ExternalIds({
    this.isrc,
  });

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
    isrc: json["isrc"],
  );

  Map<String, dynamic> toJson() => {
    "isrc": isrc,
  };
}
