import 'package:mstoreapp/models/usuarioLoginModel.dart';
import 'package:mstoreapp/routes/authRoute.dart';
import 'package:mstoreapp/routes/baseRoute.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static BaseRoute _route = BaseRoute();
  static AuthRoute _authRoute = AuthRoute();

  static Future<String> autenticar(UsuarioLogin usuarioLogin) async {
    var url = Uri.parse('${_route.routeBaseUrl}${_authRoute.autenticar}');
    var response = await http.post(url);
    if (response.statusCode == 200) {
      return response.body;
    }
    return "";
  }
}
