

class Funcoes{

  String gerson = "";

  Future<List> buscaUsuario(String login, String senha) async {
    await Future.delayed(Duration(milliseconds: 2000));
    List user = ['Isac','Susana','Borges'];
    return user;
  }

  // Future<List> pegarDadosBiblioteca(String livros) async {
  //   await Future.delayed(Duration(milliseconds: 3000));
  //   gerson = '{"Pocahontas", "Imalaia", "Pistão", "Glamour"}';
  // }

  Future<void> fazerLogin() async {
    //Aguarda a função que fará contato para retornar o nome do usuário
    List nomeUsuario = await buscaUsuario("Geringo", "sa123");
    if (nomeUsuario == []) {
      print("Usuário Not FOund!");
    } else {
      print("Achou...");
    }
  }



}