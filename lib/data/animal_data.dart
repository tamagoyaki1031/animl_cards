// 連想配列で作る
Map<String,dynamic> animal1= {
  'image': 'https://x.gd/3rg9B',
  'name':'シベリアン・ハスキー',
  'info':'団体でそりを引く作業犬だったこともあり、複数で飼育すると個性が出て、それぞれの中で暗黙の役割分担ができたりするので、興味がつきません。もちろん単独飼育でも、心を許した飼い主には、実に陽気で人なつこくて従順です。もともとがなんとかなるさといった楽天的な性格なので、苦しいことやつらい現実には目をそらして、早く忘れてしまおうとするところがあります。そのため、訓練やしつけにはかなりてこずります。「迷子になると家に帰れないほど頭が悪い」などと言われますが、実はそうではなく、苦労して家に帰るよりも、居心地のいい所を見つけて「ここもなかなかいいな」と、居候を決め込んで住み着いてしまうためで、これも執着心のない楽天的な性格の表れのようです。',
  'type':'イヌ - 大型',
  'from':'アメリカ',
  'height':'54～60cm',
};
Map<String,dynamic> animal2= {
  'image': 'https://x.gd/VcGAa',
  'name': 'アラスカン・マラミュート',
  'info': 'オオカミを連想させる精悍な容姿に似合わず、平和主義で物静かな愛情溢れる従順な犬です。人が大好きで、特に一度信頼した主人には、ひたすら献身的に尽くします。とても忍耐強いので、子どもの遊び相手もできますし、また長時間の留守番にもじっとがまんして耐えてくれます。でも実はとても甘えん坊なので、帰って来たらめいっぱいほめてあげましょう。感情表現がとても豊かです。',
  'type':'イヌ - 大型',
  'from':'アメリカ（アラスカ地方）',
  'height':'58～71cm',
};
Map<String,dynamic> animal3= {
  'image': 'https://x.gd/D1NWN',
  'name': 'オッターハウンド',
  'info': '勇敢で粘り強くて、そして頑固です。しかし、飼い主や家族に対しては親切で、穏和で、情愛が深い遊び好きな犬種です。水浴びが大好きで、被毛は防水効果満点なのです。「オッター」とはカワウソのことで、1970年代にイギリスでカワウソ猟が禁止され、オッターハウンドは頭数が激減しました。その後、アメリカなどでアライグマ、ミンク、クマなどの猟に使われるようになりました。',
  'type':'イヌ - 大型',
  'from':'イギリス',
  'height':'61～69cm',
};
Map<String,dynamic> animal4= {
  'image': 'https://x.gd/TtRZL',
  'name': 'オールド・イングリッシュ・シープドッグ',
  'info': '一見、優雅でおっとりして見えますが、実はいたずら大好きのわんぱく坊主です。何かをしかけようとしているときは、子犬のように瞳を輝かせています。また、いくぶん短気でわがままです。長い毛で目が被われているので、表情が読み取りにくく、喜んでいるのか怒っているのがわかりにくい面があります。声をかけて反応を見ながら接しないと、突然かみつかれたり、ほえかけられたりします。',
  'type':'イヌ - 大型',
  'from':'イギリス',
  'height':'56cm以上',
};
Map<String,dynamic> animal5= {
  'image': 'https://x.gd/zJC5B',
  'name': 'コモンドール',
  'info': 'とても俊敏な動きはできなさそうなコモンドールですが、実際にはオオカミにも立ち向かい、家畜を守ってきた立派な犬種です。その特徴であるドレッドヘアーのような被毛は、長い時間をかけてできあがったもので、牧羊犬としての仕事には欠かせないものです。その被毛は、オオカミなどの牙が、皮膚に届きにくく、さらには寒さからも身を守っているのです。',
  'type':'イヌ - 大型',
  'from':'ハンガリー',
  'height':'65～80cm',
};
late List<Map<String,dynamic>> animals= [animal1,animal2,animal3,animal4,animal5];

// 植物データ　https://x.gd/jtUxK、https://x.gd/iY5Uh
Map<String,dynamic> flower1 = {
  'name':'ソメイヨシノ（サクラ）',
  'image':'https://x.gd/jtUxK',
  'info':'全国各地で植えられていて、花見の時期にだれもが眼にする木として最もよく知られているサクラである。ソメイヨシノは、オオシマザクラとエドヒガンの雑種起源の園芸品種と考えられていて、明治初年頃に染井村から広がっていったのでこの名がある。',
  'season':'3～4月',
  'height':'10～15m',
};

Map<String,dynamic> flower2 = {
  'name':'ひまわり',
  'image':'https://x.gd/iY5Uh',
  'info':'ヒマワリが線路わきなどで大きな頭花をもたげている姿は、盛夏そのものだ。園芸品種には、花が単生のもの、分枝して咲くものなどいろいろな種類がある。ロシアヒマワリは、60センチメートルもある大きな花をつける。花は明るいほうに向かって咲く。',
  'season':'7～8月 ',
  'height':'2～4m',
};

Map<String,dynamic> flower3 = {
  'name':'バラ',
  'image':'https://x.gd/SI5Rg',
  'info':'バラの栽培の歴史は古く、今では1万をこえる品種が栽培されているという。大きくいくつかの種類に分けると、木の形状になるもの、つる性のもの、その中間型の三つになる。これがさらに四季咲き大輪系、中輪房咲き、小輪咲きなどと分かれる。',
  'season':'四季咲き',
  'height':'データなし',
};

late List<Map<String,dynamic>> flowers= [flower1,flower2,flower3];
