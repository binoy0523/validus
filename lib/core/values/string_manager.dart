/// Base class containing the configurable strings of the app.
class StringManager {
  /// Basic const constructor
  const StringManager();

  /// Title of the app.
  String get appTitle => "ValidusCoin";

  /// Title for stocks tab.
  String get stocksTabTitle => "Stocks";

  /// Title for watchlist screen.
  String get watchListTitle => "My watchlist";

  // Title for profile tab.
  String get profileTabTitle => "Profile";

  String get defaultErrorText => "An error has occurred";

  /// Retry button title
  String get retry => "Retry";

  /// No watchlist available text
  String get noWatchList => "No watchlist available";

  /// List item fields.

  String get priceField => "Price";

  String get dayGain => "Day gain";

  String get lastTrade => "Last trade";

  String get extendedHrs => "Extended hrs";

  String get percentageChange => "%Change";

  String editProfileScreeTitle(String fieldName) => "Edit $fieldName";

  /// name required error text.
  String get nameRequiredErrorText => 'Name is required';

  /// Email required error text.
  String get emailRequiredErrorText => 'Email is required';

  /// Email validation text.
  String get emailValidationText => 'Enter valid email';

  /// Save button title.
  String get saveButtonTitle => 'Save';

  /// Edit button title.
  String get editButtonTitle => 'Edit';
}
