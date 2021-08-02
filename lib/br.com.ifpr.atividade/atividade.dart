

void main(List<String> args){
  //funcao1("Teste");
  // String msg = funcao2();
  // print(msg);
  // funcao3();
  // funcao4();
  // funcao7(8, 2);
  imprimirNumero((){;
  });
}

void funcao1(String obj){
  print("Printando $obj");
}

String funcao2(){
  return "Salve Salve";
}

void funcao3(){
  print("Sem Parametro e Sem Retorno");
}

void funcao4(){
  var um = 5045004;
  print("Sem Parametro e Sem Retorno $um");
}

void funcao5(String nome, int opcao){
  print("Welcome to the Jungle!!!");

  if(opcao > 0){
    print("$nome informou que $opcao é maior q 0");
  }else{
    print("$nome opção é menor q 0");
  }
}

void funcao6(String nome, int opcao){
  print("Loteria!!!");

  if(opcao > 0){
    print("$nome informou que $opcao é numero da SORTE");
  }else{
    print("$nome vc perdeu!");
  }
}

void funcao7(int num, int num2){
  print("Calculadora Fácil");
  var calc = num + num2;
  print("A soma de $num + $num2 é $calc");
}

void imprimirNome(Function f){
  f();
  print("Salveeee");
}

void imprimirNumero(Function f){
  var num = 1123;
  var num2 = 111231233;
  var calc = num + num2;
  print("A soma de $num + $num2 é $calc");
  print(calc);
}

void imprimirLista(Function f){
  List batata = ['Arroz','Feijão'];
  print(batata);
}