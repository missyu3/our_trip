# coding: utf-8


user1 = User.create(
                name: "test_user1",
                email: "test1@example.com",
                password: "password",
                image: nil)

user2 = User.create(
                  name: "test_user2",
                  email: "test2@example.com",
                  password: "password",
                  image: nil)


plan1 = Plan.create(
            name: "北海道",
            content: "新鮮な旬の魚介を食べあるく、食べ歩きの旅です！",
            user_id: user1.id
)

plan2 = Plan.create(
            name: "青森",
            content: "7、8月はねぶた祭で決まり！ルールさえ守れば、祭りに参加できる！！",
            user_id: user1.id
)

plan3 = Plan.create(
            name: "岩手",
            content: "ワンコ蕎麦・前沢牛・牡蠣が有名！肥沃な大地で育った美味がお出迎え",
            user_id: user1.id
)

plan4 = Plan.create(
            name: "金沢",
            content: "美食の街と密かな人気、特に魚介の新鮮さは一押し！",
            user_id: user1.id
)

plan5 = Plan.create(id: 5,
            name: "鳥取",
            content: "鳥取砂丘の静寂で広大な景色は一見の価値あり！",
            user_id: user2.id
)

plan6 = Plan.create(id: 6,
            name: "熊本",
            content: "意外とあっさりしている桜肉は、ダイエットにも最適！その美味しさはハマる人もいるとか！",
            user_id: user2.id
)

plan7 = Plan.create(id: 7,
            name: "沖縄",
            content: "ダイビングや沖縄料理は行きたいランキング１位",
            user_id: user2.id
)

# nothing: 0, move: 1, activity: 2, meal: 3, lodging: 4
PlanItem.create(plan_id: plan1.id,
                title: "新千歳空港",
                category: 1,
                content: "飛行機で札幌空港に降り立つ。今日から美食づくしだ！",
                user_id: user1.id
)

PlanItem.create(plan_id: plan1.id,
                title: "むらかみ",
                category: 3,
                content: "海胆加工会社直送の美味しいウニが味わえる",
                user_id: user1.id
)

PlanItem.create(plan_id: plan1.id,
                title: "開陽亭",
                category: 3,
                content: "活け蟹！新鮮な毛蟹のお刺身を食べよう！",
                user_id: user1.id
)

PlanItem.create(plan_id: plan1.id,
                title: "クルージング",
                category: 2,
                content: "支笏湖でのクルージング、透明度の高い湖でのクルージングは体験する価値あり！",
                user_id: user1.id
)

PlanItem.create(plan_id: plan1.id,
                title: "ワカサギ釣り",
                category: 2,
                content: "札幌市内でも楽しめる！釣りたてのワカサギの美味しさは格別！",
                user_id: user1.id
)

PlanItem.create(plan_id: plan4.id,
                title: "JRタワーホテル日航札幌",
                category: 2,
                content: "JR札幌駅直結！美味しいお食事と天然温泉のスパで疲れを癒そう！",
                user_id: user1.id
)


PlanItem.create(plan_id: plan2.id,
                title: "センチュリーロイヤルホテル",
                category: 2,
                content: "美味しい食事が提供される、評判の良いホテルです",
                user_id: user1.id
)

PlanItem.create(plan_id: plan2.id,
                title: "青森空港",
                category: 1,
                content: "飛行機で青森空港に降り立つ。",
                user_id: user1.id
)

PlanItem.create(plan_id: plan2.id,
                title: "みなと食堂",
                category: 3,
                content: "平目漬け丼とせんべい汁セットが絶品",
                user_id: user2.id
)

PlanItem.create(plan_id: plan2.id,
                title: "八食市場寿司",
                category: 3,
                content: "一度は食べてみよう、いちご煮（ウニとアワビのお吸い物です）",
                user_id: user2.id
)

PlanItem.create(plan_id: plan2.id,
                title: "グリランド",
                category: 2,
                content: "ウォータースポーツ、マリンスポーツなどが楽しめる！",
                user_id: user2.id
)

PlanItem.create(plan_id: plan2.id,
                title: "ねぶた祭",
                category: 2,
                content: "圧巻のパフォーマンスと自由参加の祭り！",
                user_id: user2.id
)

PlanItem.create(plan_id: plan2.id,
                title: "星野リゾート 青森屋",
                category: 4,
                content: "青森を知り尽くす、味わい尽くすのに最適のお宿です。",
                user_id: user1.id
)

PlanItem.create(plan_id: plan3.id,
                title: "花巻空港",
                category: 1,
                content: "飛行機で空港に降り立つ。",
                user_id: user1.id
)


PlanItem.create(plan_id: plan3.id,
                title: "夢乃風",
                category: 3,
                content: "ワンコ蕎麦と餅膳が有名！",
                user_id: user1.id
)

PlanItem.create(plan_id: plan3.id,
                title: "盛岡粋酒場 がむしゃら",
                category: 3,
                content: "バラエティ豊かな肉料理",
                user_id: user1.id
)

PlanItem.create(plan_id: plan3.id,
                title: "浄土ヶ浜",
                category: 2,
                content: "シーカヤックで自然と戯れよう",
                user_id: user1.id
)

PlanItem.create(plan_id: plan3.id,
                title: "トレッキング",
                category: 2,
                content: "茶臼岳から八幡平頂上へのトレッキングは自然豊か",
                user_id: user1.id
)

PlanItem.create(plan_id: plan3.id,
                title: "大船渡温泉",
                category: 4,
                content: "海に面する三星ホテル、大きな窓から見える朝日は絶景！",
                user_id: user1.id
)


PlanItem.create(plan_id: plan4.id,
                title: "金沢駅",
                category: 1,
                content: "巨大なモニュメントが目印",
                user_id: user1.id
)


PlanItem.create(plan_id: plan4.id,
                title: "いたる 本店",
                category: 3,
                content: "日本海の新鮮な魚介が味わえる",
                user_id: user2.id
)

PlanItem.create(plan_id: plan4.id,
                title: "乙女寿司",
                category: 3,
                content: "地元で取れる食材を使ったお寿司は絶品",
                user_id: user1.id
)

PlanItem.create(plan_id: plan4.id,
                title: "兼六園",
                category: 2,
                content: "日本三名園に数えられる。早朝がおすすめ",
                user_id: user1.id
)

PlanItem.create(plan_id: plan4.id,
                title: "白川郷",
                category: 2,
                content: "合掌造りの建物は必見！",
                user_id: user1.id
)

PlanItem.create(plan_id: plan4.id,
                title: "ＡＢホテル金沢",
                category: 4,
                content: "駅近",
                user_id: user2.id
)


PlanItem.create(plan_id: plan5.id,
                title: "鳥取砂丘コナン空港",
                category: 1,
                content: "コナンくんがお出迎え！喫茶アポロやコナン探偵事務所などファン必見！",
                user_id: user1.id
)


PlanItem.create(plan_id: plan5.id,
                title: "鯛喜",
                category: 3,
                content: "予約必須！リーズナブルに海鮮丼が食べられる名店",
                user_id: user1.id
)

PlanItem.create(plan_id: plan5.id,
                title: "味暦あんべ",
                category: 3,
                content: "親がにの内子は絶品！１１月〜１月のみ食べれる美味しさ！",
                user_id: user1.id
)

PlanItem.create(plan_id: plan5.id,
                title: "鳥取砂丘",
                category: 2,
                content: "砂に音が吸われ、静寂が訪れる様は一度体験する価値あり！",
                user_id: user1.id
)

PlanItem.create(plan_id: plan5.id,
                title: "鳥取砂丘ミュージアム",
                category: 2,
                content: "砂で作られた精巧な像がお出迎え",
                user_id: user1.id
)

PlanItem.create(plan_id: plan5.id,
                title: "鳥取グリーンホテルモーリス",
                category: 4,
                content: "駐車場あり、朝食が美味しいと評判！",
                user_id: user1.id
)


PlanItem.create(plan_id: plan6.id,
                title: "熊本空港",
                category: 1,
                content: "自衛隊の分屯地と併設されており、自衛隊機の発着がみれる空港",
                user_id: user2.id
)


PlanItem.create(plan_id: plan6.id,
                title: "むつ五郎",
                category: 3,
                content: "馬刺しや馬ヒレステーキなど熊本名物の桜肉を堪能",
                user_id: user1.id
)

PlanItem.create(plan_id: plan6.id,
                title: "桂花ラーメン 本店",
                category: 3,
                content: "東京で革命を起こしたと言われる本場熊本のラーメン",
                user_id: user1.id
)

PlanItem.create(plan_id: plan6.id,
                title: "球磨川ラフティング",
                category: 2,
                content: "暑い夏こそやりたい！人気の川遊びラフティングを体験！",
                user_id: user1.id
)

PlanItem.create(plan_id: plan6.id,
                title: "ホテル日航熊本",
                category: 4,
                content: "高級ホテル",
                user_id: user1.id
)


PlanItem.create(plan_id: plan7.id,
                title: "那覇空港",
                category: 1,
                content: "空港",
                user_id: user1.id
)


PlanItem.create(plan_id: plan7.id,
                title: "田舎",
                category: 3,
                content: "ソーキソバ専門店、しかもお手軽390円！",
                user_id: user2.id
)

PlanItem.create(plan_id: plan7.id,
                title: "やんばるダイニング松の古民家",
                category: 3,
                content: "沖縄名物のヤグー豚が味わえる！甘味が特徴の美味しい豚肉",
                user_id: user2.id
)

PlanItem.create(plan_id: plan7.id,
                title: "宮古島",
                category: 2,
                content: "明光風靡なビーチで知られる島",
                user_id: user1.id
)

PlanItem.create(plan_id: plan7.id,
                title: "沖縄美ら海水族館",
                category: 2,
                content: "2005年までは世界最大の水族館でも知られ、ジンベイザメなど迫力のある海の生き物が出迎えてくれます。",
                user_id: user1.id
)

PlanItem.create(plan_id: plan7.id,
                title: "ハレクラニ沖縄",
                category: 4,
                content: "ハワイで100年以上続く老舗が沖縄にオープン！窓から見える透明度の高い海に魅了されます",
                user_id: user1.id
)



