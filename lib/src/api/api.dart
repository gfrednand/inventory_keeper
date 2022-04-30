/// API interface
/// Types A is Item type, Type B is for one item
/// Type C is the output of get all
/// Type D is the output of remove One
abstract class Api<A, B, C, D> {
  /// Get Single Data
  D oneItem(B one);

  /// Add Single Data
  A addOne(B one);

  /// Update Single Data
  A updateOne(B one);

  /// Remove Single Data
  A removeOne(B one);

  /// Get All Data
  C allItems();
}
