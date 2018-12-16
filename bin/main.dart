import 'package:tmdb_dart/config/tokens.dart';
import 'package:tmdb_dart/core/api.dart';

main(List<String> arguments) async {
  var key = apiKeyV3;
  var apiCore = TmdbApi(key);
  await apiCore.login("<your-username>", "<your-password>");
  print(apiCore.sessionInformation);

  var apiCoreGuest = TmdbApi(key);
  await apiCoreGuest.loginAsGuest();
  print(apiCoreGuest.sessionInformation);
}
