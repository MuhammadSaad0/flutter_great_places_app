class LocationHelper {
  static String generatePreview({double latitude, double longitude}) {
    return 'https://static-maps.yandex.ru/1.x/?size=500,350&l=map&ll=$longitude,$latitude&z=15&pt=$longitude,$latitude,round';
  }
}
