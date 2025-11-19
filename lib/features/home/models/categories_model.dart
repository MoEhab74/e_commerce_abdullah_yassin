  // List of categories
  List<String> categoriesModelFromJson(categoriesJson) {
    return List<String>.from(categoriesJson.map((x) => x));
  }

  // Traditional version (same functionality)

  // List<String> categoriesModelFromJsonTraditional(categoriesJson) {
  //   List<String> categories = [];
  //   for (var category in categoriesJson) {
  //     categories.add(category);
  //   }
  //   return categories;
  // }


