import 'package:flutter/material.dart';

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
      home: const AnimalListPage(title: '動物図鑑'),
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
class _AnimalListPageState extends State<AnimalListPage> {
  // 動物画像
  final List<String> animals=['https://x.gd/3rg9B','https://x.gd/VcGAa','https://x.gd/D1NWN','https://x.gd/TtRZL','https://x.gd/zJC5B'];
  // 動物名
  final List<String> animalName =['シベリアン・ハスキー','アラスカン・マラミュート','オッターハウンド','オールド・イングリッシュ・シープドッグ','コモンドール'];
  // 動物詳細
  final List<String> animalInfo = ['団体でそりを引く作業犬だったこともあり、複数で飼育すると個性が出て、それぞれの中で暗黙の役割分担ができたりするので、興味がつきません。もちろん単独飼育でも、心を許した飼い主には、実に陽気で人なつこくて従順です。もともとがなんとかなるさといった楽天的な性格なので、苦しいことやつらい現実には目をそらして、早く忘れてしまおうとするところがあります。そのため、訓練やしつけにはかなりてこずります。「迷子になると家に帰れないほど頭が悪い」などと言われますが、実はそうではなく、苦労して家に帰るよりも、居心地のいい所を見つけて「ここもなかなかいいな」と、居候を決め込んで住み着いてしまうためで、これも執着心のない楽天的な性格の表れのようです。'
    ,'オオカミを連想させる精悍な容姿に似合わず、平和主義で物静かな愛情溢れる従順な犬です。人が大好きで、特に一度信頼した主人には、ひたすら献身的に尽くします。とても忍耐強いので、子どもの遊び相手もできますし、また長時間の留守番にもじっとがまんして耐えてくれます。でも実はとても甘えん坊なので、帰って来たらめいっぱいほめてあげましょう。感情表現がとても豊かです。'
    ,'勇敢で粘り強くて、そして頑固です。しかし、飼い主や家族に対しては親切で、穏和で、情愛が深い遊び好きな犬種です。水浴びが大好きで、被毛は防水効果満点なのです。「オッター」とはカワウソのことで、1970年代にイギリスでカワウソ猟が禁止され、オッターハウンドは頭数が激減しました。その後、アメリカなどでアライグマ、ミンク、クマなどの猟に使われるようになりました。'
    ,'一見、優雅でおっとりして見えますが、実はいたずら大好きのわんぱく坊主です。何かをしかけようとしているときは、子犬のように瞳を輝かせています。また、いくぶん短気でわがままです。長い毛で目が被われているので、表情が読み取りにくく、喜んでいるのか怒っているのがわかりにくい面があります。声をかけて反応を見ながら接しないと、突然かみつかれたり、ほえかけられたりします。'
    ,'とても俊敏な動きはできなさそうなコモンドールですが、実際にはオオカミにも立ち向かい、家畜を守ってきた立派な犬種です。その特徴であるドレッドヘアーのような被毛は、長い時間をかけてできあがったもので、牧羊犬としての仕事には欠かせないものです。その被毛は、オオカミなどの牙が、皮膚に届きにくく、さらには寒さからも身を守っているのです。'
  ];
  // 分類
  final List<String> animalClassification =['イヌ - 大型','イヌ - 大型','イヌ - 大型','イヌ - 大型','イヌ - 大型',];
  // 生息地
  final List<String> animalinhabitation =['アメリカ','アメリカ（アラスカ地方）','イギリス','イギリス','ハンガリー'];
  // 全長
  final List<String> animalLength=['54～60cm','58～71cm','61～69cm','56cm以上','65～80cm'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ヘッダー部分
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        // https://x.gd/FqLak
        body:
        //  繰り返し(スクロールができるから他のスクロースができるウィジェットを親として持つことはできない)
        GridView.builder(
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              // 縦
              mainAxisSpacing: 8,
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
              return InkWell(
                onTap: (){
                  // // 画面遷移
                  Navigator.push(
                    context,
                    // 遷移先(動物の詳細ページ)
                    MaterialPageRoute(
                        builder: (context) {
                          return AnimalDetailPage(animalName[index],animals[index],animalInfo[index],animalClassification[index],animalinhabitation[index],animalLength[index]);
                        },
                        //   フルスクリーンで表示するかどうかの設定
                        fullscreenDialog: true
                    ),
                  );
                },
                // スクロールが必要な時にスクロールできるようにする
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // 下のイメージリストで持つ
                      Image.network(animals[index]),
                      Text(animalName[index],
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(animalInfo[index],
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ),
              );
            })
    );
  }
}


// 二ページ目
class AnimalDetailPage extends StatelessWidget {
  final String animalName;
  final String animalImage;
  final String animalInfo;
  final String animalCass;
  final String animalLin;
  final String animalLength;
  AnimalDetailPage(this.animalName,this.animalImage,this.animalInfo,this.animalCass,this.animalLin,this.animalLength);

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
          Text(animalCass),
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
        Text(animalLin),
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
        Text(animalLength),
      ],
    );
  }
  // アイコン画像表示処理-------------------------------ここまで
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bodyに対して背景色を指定する
      // backgroundColor: Colors.blue,
      appBar: AppBar(title:  Text(animalName),),
      // 二ページ目ボディー
      // カラムのsizeを超えたらスクロールできるようにする
      body:SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child:
        Column(
          children: <Widget>[
            // 動物画像
            Image.network(animalImage),
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
            Text(animalInfo,
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
