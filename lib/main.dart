import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data/animal_data.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:AnimalListPage(title: 'いきもの図鑑',),
    );
  }
}

class AnimalListPage extends StatefulWidget {
  const AnimalListPage({super.key, required this.title});

  final String title;

  @override
  State<AnimalListPage> createState() => _AnimalListPageState();
}

// 最初のページ
class _AnimalListPageState extends State<AnimalListPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 2, vsync: this);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // animalトップページの表示
  Widget _buildAnimalColum(Map<String,dynamic> animal,BuildContext  context){
    return InkWell(
      onTap: (){
        // // 画面遷移
        Navigator.push(
          context,
          // 遷移先(動物の詳細ページ)
          MaterialPageRoute(
              builder: (context){
                return AnimalDetailPage(animal:animal);
              },
              //   フルスクリーンで表示するかどうかの設定
              fullscreenDialog: true
          ),
        );
      },
      // スクロールが必要な時にスクロールできるようにする
      child: SingleChildScrollView(
        child:Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: [
              // childで指定したウィジェットを四角く切り取るウィジェット
              ClipRRect(
                child: Image.network(animal['image']),
                        // 画像の上の部分を丸くする
                        borderRadius:BorderRadius.vertical(top:  Radius.circular(16.0))
              ),
              Text(animal['name'],
                style: TextStyle(
                  fontSize: 16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(animal['info'],
                style: TextStyle(
                  fontSize: 20,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,),
            ],
          ),
        ),
      ),
    );
  }
  // animalの繰り返し処理
  Widget animalGridView(){
    return   //  繰り返し(スクロールができるから他のスクロースができるウィジェットを親として持つことはできない)
      GridView.builder(
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            // 縦
            mainAxisSpacing: 10,
            // 横
            crossAxisSpacing: 16.0,
            // 一つのアイテムの縦横比
            childAspectRatio: 0.8,
            crossAxisCount: 2,
          ),
          scrollDirection: Axis.vertical,
          primary: false,
          // 縦横すべての間隔
          padding: const EdgeInsets.all(32.0),
          // 繰り返し回数
          itemCount: animals.length,
          // 繰り返し処理
          itemBuilder: (context,index){
            // 普通の処理
            // クリックした時の処理
            // 以下追加
            Map<String,dynamic> animal = animals[index];
            return _buildAnimalColum(animal,context);
          });
  }

  // 植物
  Widget _buildFlowerColum(Map<String,dynamic> flower,BuildContext  context){
    return InkWell(
      onTap: (){
        // // 画面遷移
        Navigator.push(
          context,
          // 遷移先(動物の詳細ページ)
          MaterialPageRoute(
              builder: (context){
                return FlowerDetailPage(flower: flower);
              },
              //   フルスクリーンで表示するかどうかの設定
              fullscreenDialog: true
          ),
        );
      },
      // スクロールが必要な時にスクロールできるようにする
      child: SingleChildScrollView(
        child:Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: [
              // childで指定したウィジェットを四角く切り取るウィジェット
              ClipRRect(
                  child: Image.network(flower['image']),
                  // 画像の上の部分を丸くする
                  borderRadius:BorderRadius.vertical(top:  Radius.circular(16.0))
              ),
              Text(flower['name'],
                style: TextStyle(
                  fontSize: 16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(flower['info'],
                style: TextStyle(
                  fontSize: 20,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,),
            ],
          ),
        ),
      ),
    );
  }

  // 植物の繰り返し処理
  Widget flowerGridView(){
    return GridView.builder(
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          // 縦
          mainAxisSpacing: 10,
          // 横
          crossAxisSpacing: 16.0,
          // 一つのアイテムの縦横比
          childAspectRatio: 0.8,
          crossAxisCount: 2,
        ),
        scrollDirection: Axis.vertical,
        primary: false,
        // 縦横すべての間隔
        padding: const EdgeInsets.all(32.0),
        // 繰り返し回数
        itemCount: flowers.length,
        // 繰り返し処理
        itemBuilder: (context,index){
          // 普通の処理
          // クリックした時の処理
          // 以下追加
          Map<String,dynamic> flower = flowers[index];
          return _buildFlowerColum(flower,context);
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ヘッダー部分
        appBar: AppBar(
          title:Text(widget.title),
          bottom: TabBar(
            // タブのコントローラ
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.pets)),
              Tab(icon: Icon(Icons.local_florist),)
            ],
          ),
        ),
        // https://x.gd/FqLak
        body:TabBarView(
          // タブのコントローラー
          controller: _tabController,
          children: <Widget>[
            animalGridView(),
            flowerGridView(),

        ],
        ),
    );
  }
}


// 二ページ目動物----------------------------------------------------------------

class AnimalDetailPage extends StatelessWidget {
  // final String animalName;
  // final String animalImage;
  // final String animalInfo;
  // final String animalCass;
  // final String animalLin;
  // final String animalLength;
  final Map<String,dynamic> animal;
   const AnimalDetailPage({Key? key,required this.animal}):super(key: key);

  // アイコン画像表示処理---------------------------ここから
  Widget IconBook(){
    return  // book
      Column(
        children: [
          const Icon(Icons.book,
            color: Colors.green,),
          Text('分類',
            style: TextStyle(
              fontSize: 16,
            ),),
          Text(animal['type']),
        ],
      );
  }
  // 生息地のアイコン
  Widget IconMap(){
    return  Column(
      children: [
        const Icon(Icons.map,
          color: Colors.green,),
        Text('生息地',
          style: TextStyle(
            fontSize: 16,
          ),),
        Text(animal['from']),
      ],
    );
  }
  // 全長のアイコン
  Widget IconHeight(){
    return Column(
      children:<Widget> [
        const Icon(
          Icons.height,
          color: Colors.green,
        ),
        Text('全長',style: TextStyle(
          fontSize: 16,

        ),
        ),
        Text(animal['height']),
      ],
    );
  }
  // アイコン画像表示処理-------------------------------ここまで

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bodyに対して背景色を指定する
      // backgroundColor: Colors.blue,
      appBar: AppBar(title:  Text(animal['name']),),
      // 二ページ目ボディー
      // カラムのsizeを超えたらスクロールできるようにする
      body:SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child:
        Column(
          children: <Widget>[
            // 動物画像
            Image.network(animal['image']),
            //   高さ
            Container(height: 20,),
            // タイトル
            Text('説明',
              style: TextStyle(
                color: Colors.red,
                //   text太文字
                  fontWeight: FontWeight.bold
              ),
            ),
            Container(height: 20,),
            Text(animal['info'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),),
            //   高さ
            Container(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //  分類アイコン
                IconBook(),
                //  生息地アイコン
                IconMap(),
                //  全長アイコン
                IconHeight(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// ここまでーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

// 花のページーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
class FlowerDetailPage extends StatelessWidget {
  // final String animalName;
  // final String animalImage;
  // final String animalInfo;
  // final String animalCass;
  // final String animalLin;
  // final String animalLength;
  final Map<String,dynamic> flower;
  const FlowerDetailPage({Key? key,required this.flower}):super(key: key);

  // アイコン画像表示処理---------------------------ここから

  // 生息地のアイコン
  Widget IconMap(){
    return  Column(
      children: [
        const Icon(Icons.map,
          color: Colors.green,),
        Text('花の咲く季節',
          style: TextStyle(
            fontSize: 16,
          ),),
        Text(flower['season']),
      ],
    );
  }
  // 全長のアイコン
  Widget IconHeight(){
    return Column(
      children:<Widget> [
        const Icon(
          Icons.height,
          color: Colors.green,
        ),
        Text('全長',style: TextStyle(
          fontSize: 16,

        ),
        ),
        Text(flower['height']),
      ],
    );
  }
  // アイコン画像表示処理-------------------------------ここまで
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bodyに対して背景色を指定する
      // backgroundColor: Colors.blue,
      appBar: AppBar(title:  Text(flower['name']),),
      // 二ページ目ボディー
      // カラムのsizeを超えたらスクロールできるようにする
      body:SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child:
        Column(
          children: <Widget>[
            // 動物画像
            Image.network(flower['image']),
            //   高さ
            Container(height: 20,),
            // タイトル
            Text('説明',
              style: TextStyle(
                  color: Colors.red,
                  //   text太文字
                  fontWeight: FontWeight.bold
              ),
            ),
            Container(height: 20,),
            Text(flower['info'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),),
            //   高さ
            Container(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //  季節アイコン
                IconMap(),
                //  全長アイコン
                IconHeight(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//ここまでーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー