abstract class InterfaceRepository<T> {
  ///get all data from db
  Future<T?> getAll();

  /// insert data to db
  Future<void> insertItem({required T object});

  Future<bool> isDataAvailable();
}
