import 'package:tmdb_dart/tmdb_dart.dart';
import 'package:test/test.dart';
import 'package:tmdb_dart/core/api.dart';
import 'package:tmdb_dart/api_key.dart';
import 'package:tmdb_dart/core/models.dart';

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
  test('getAccountDetail', () {
    var client = TmdbApi(apiKeyV3);
    client.login(username, password).then((v) {
        client.getAccountDetail().then((val) {
            expect(val.username, "uroybd");
        });
    });
  });

  test('getMovieList', () {
    var client = TmdbApi(apiKeyV3);
    client.login(username, password).then((v) {
        client.getAccountDetail().then((val) {
            client.getMovieList(val.id).then((val) {
              expect(val.page, 1);
            });
        });
    });
  });
  test('instantiateMovie', (){
      var movie = new Movie(title: "A very good movie", id: 1, imdbID: "5");
      expect(movie.id, 1);
      expect(movie.imdbID, "5");
  });
}
