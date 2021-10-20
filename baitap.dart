import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nhom2/product.dart';
class MyApp7 extends StatelessWidget {
  const MyApp7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Store1(),
    );
  }
}
class Store1 extends StatefulWidget {
  const Store1({Key? key}) : super(key: key);

  @override
  _Store1State createState() => _Store1State();
}

class _Store1State extends State<Store1> {
  late Future<List<Product>> lsProduct;
  @override
  void initState(){
    super.initState();
    lsProduct = Product.fetchData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
      ),
      body: FutureBuilder(
        future: lsProduct,
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if(snapshot.hasData){
            var data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (BuildContext context, int index) {
                Product p =data[index];
                return ListTile(
                  leading:  Image.network(p.image, width: 40,),
                  title: Text(p.title +" giá "+ p.price +"\$"),
                 trailing: ElevatedButton(
                   child: Text('Mua'),
                   onPressed: (){

                   },
                 ),
                );
              },

            );
          }else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
