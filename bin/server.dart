import 'dart:io';

Future main() async {
  int port = int.parse(Platform.environment['PORT'] ?? '4567');
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    request.response.write('Hello, world!');
    await request.response.close();
  }
}