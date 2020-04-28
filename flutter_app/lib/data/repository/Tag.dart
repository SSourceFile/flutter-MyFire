class Tag {
    String name;
    String url;

    Tag({this.name, this.url});

    factory Tag.fromJson(Map<String, dynamic> json) {
        return Tag(
            name: json['name'], 
            url: json['url'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['name'] = this.name;
        data['url'] = this.url;
        return data;
    }
}