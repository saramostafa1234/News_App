class SourcesModel {
  final String status;

  final List<Source> sources;

  SourcesModel({required this.sources, required this.status});

  factory SourcesModel.fromJson(Map<String, dynamic> json) => SourcesModel(
        status: json["status"],
        sources: List.from(json["sources"]).map(
          (element) {
            return Source.fromJson(element);
          },
        ).toList(),
        //     json["sources"]as List).map(
        //       (element){
        //     return Source.fromJson(element);
        //   },
        // ).toList(),
      );
}

class Source {
  final String id;
  final String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );
}
