import 'package:flutter_filmes/cadastro/cadastro_api.dart';
import 'package:flutter_filmes/utils/simple_bloc.dart';

class CadastroBloc extends SimpleBloc {

  cadastrar(CadastroInput input) async {
    progress.setProgress(true);

    try {
      return await CadastroApi.cadastrar(input);
    } finally {
      progress.setProgress(false);
    }
  }
}