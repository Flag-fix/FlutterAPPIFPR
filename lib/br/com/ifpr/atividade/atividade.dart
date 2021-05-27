

void main(List<String> args) {

  List<String> batata = ['Ração','Comida','Legume','Carne', "Vegetação"];


  while(batata.length > 1){
    //Adicioonando Var na Lista Batata
    batata.add("Rinoceronte");
    batata.add("Ornitorrinco");

    //Removendo Itens da Lista Batata
    batata.forEach((element) {
      batata.remove(element);
      print("Removendo Itens da Lista Batata");
    });
  }

}