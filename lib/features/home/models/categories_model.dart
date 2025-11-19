// List of categories
List<String> categoriesModelFromJson(categoriesJson) {
  return ['All', ...List<String>.from(categoriesJson.map((x) => x))];
}

  // Traditional version (same functionality)

  // List<String> categoriesModelFromJsonTraditional(categoriesJson) {
  //   List<String> categories = [];
  //   categories.add('All');
  //   for (var category in categoriesJson) {
  //     categories.add(category);
  //   }
  //   return categories;
  // }


