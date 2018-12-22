import 'package:tmdb_dart/tmdb_dart.dart';
import 'package:test/test.dart';
import 'package:tmdb_dart/core/api.dart';
import 'package:tmdb_dart/api_key.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });
  test('getMovie', () {
    var client = TmdbApi(apiKeyV3);
    client.getMovie(297802).then((val) {
      expect(val.id, 297802);
      expect(val.imdbID, "tt1477834");
    });
  });
}
