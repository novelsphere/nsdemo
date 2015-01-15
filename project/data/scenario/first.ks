;///////////////////////////////////////////////////////////////////////////////
;// 初期設定
;///////////////////////////////////////////////////////////////////////////////
[position layer=message0 page=fore visible=false]
[position layer=message1 page=fore visible=false]
[o2_loadplugin module="extrans.js"]

;///////////////////////////////////////////////////////////////////////////////
;// マクロ定義
;///////////////////////////////////////////////////////////////////////////////

@macro name=bg
[backlay]
[image storage=%storage layer=base page=back]
[trans method=%method|crossfade time=%time|1000]
[wt]
@endmacro

@macro name=x
[p]
[cm]
@endmacro

@macro name=msginit
[position layer=message0 page=fore frame=frame left=0 top=440 marginl=60 marginr=60 margint=10 opacity=255 visible=false]
[deffont face="mplus-1c-regular" size=32 rubysize=14]
[defstyle linespacing=22]
[resetfont]
[resetstyle]
[backlay]
@endmacro

@macro name=msgon
[backlay]
[position layer=message0 page=back visible=true]
[trans method=crossfade time=300]
[wt]
[current layer=message0 page=fore]
@endmacro

@macro name=msgoff
[backlay]
[position layer=message0 page=back visible=false]
[trans method=crossfade time=300]
[wt]
@endmacro

@macro name=fgfront
[backlay]
[image storage=%storage layer=%layer|0 page=back top=%top|0 left=%left|196 visible=true]
[trans time=300]
[wt]
@endmacro

@macro name=fgdiag
[backlay]
[image storage=%storage layer=%layer|0 page=back top=%top|0 left=%left|220 visible=true]
[trans time=300]
[wt]
@endmacro

@macro name=fg_hello
[image storage=%storage layer=%layer|0 page=fore top=%top|0 left=%left|396 opacity=0 visible=true]
[move layer=%layer|0 page=fore path=(196,0,255) time=%time|500 accel=%accel|-5]
[wm]
@endmacro

@macro name=fg_bye
[move layer=%layer|0 page=fore path=(-4,0,0) time=%time|500 accel=%accel|5]
[wm]
[layopt layer=%layer|0 page=fore opacity=255 left=196 visible=false]
@endmacro

@macro name=btninit
[current layer=message1 page=fore][defstyle linespacing=0][resetfont][current layer=message0 page=fore]
[backlay]
[layopt layer=0 page=back visible=false]
[position layer=message0 page=back visible=false]
[position layer=message1 page=back left=0 top=0 width=960 height=640 frame=btn_bg margint=0 marginr=0 marginb=0 marginl=0 opacity=255 visible=true]
@endmacro

@macro name=btn
[current layer=message1 page=%pageforredraw|back]
[locate x=%x y=%y]
[button graphic=%graphic storage=%storage target=%target]
@endmacro

@macro name=btnhide
[layopt layer=0 page=back visible=true]
[position layer=message1 page=back visible=false]
[trans method=toss time=1000]
[wt]
[position layer=message1 page=fore visible=false]
@endmacro

@macro name=btnshow
[trans method=toss time=1000]
[wt]
@endmacro

@macro name=flip
[msgoff]
[position layer=message1 page=fore left=400 top=300 width=960 height=81 frame=%storage opacity=0 visible=true]
[move layer=message1 page=fore path=(0,300,255) time=750 accel=-5]
[wm]
[wait time=1000 canskip=true]
[move layer=message1 page=fore path=(-400,300,0) time=750 accel=5]
[wm]
[position layer=message1 page=fore opacity=255 visible=false]
[msgon]
@endmacro

;///////////////////////////////////////////////////////////////////////////////
;// ゲーム本編
;///////////////////////////////////////////////////////////////////////////////
[msginit]
[image storage=white layer=base page=fore]
[bg storage=bg_01]
[fg_hello storage=front_normal top=0 left=396]
[msgon]
「ノベルスフィアのつかいかた」へようこそ！[x]
俺は[ruby text=さ]早[ruby text=おと]乙[ruby text=め]女[ruby text=なぎ]凪！[l]　とあるゲームから出張してきて、ノベルスフィアの解説をやることになった。[x]
[fgfront storage=front_smile]
ここでは俺が、ノベルスフィアでいったいどんなゲームが作れるのかを説明する。[x]
まずは何について知りたいか、次のメニューの中から選んでくれ。[p]
[msgoff]

*menu
;allModeフラグリセット
[eval o2_exp="f.allMode=0"]

[btninit]
[btnshow]
[btn graphic=btn_cover y=10 x=0 target=*menuAll pageforredraw=fore]
[btn graphic=btn_cover y=100 x=0 target=*menuEnjoy pageforredraw=fore]
[btn graphic=btn_cover y=190 x=0 target=*menuAbout pageforredraw=fore]
[btn graphic=btn_cover y=280 x=0 target=*menuText pageforredraw=fore]
[btn graphic=btn_cover y=370 x=0 target=*menuGraphic pageforredraw=fore]
[btn graphic=btn_cover y=460 x=0 target=*menuSound pageforredraw=fore]
[btn graphic=btn_cover y=550 x=0 target=*menuSave pageforredraw=fore]
[s]

*menuAll
[eval o2_exp="f.allMode=1"]
[btnhide]
[fgfront storage=front_normal]
[msgon]
オーケー、とりあえず全部だな。[x]
ちょっと長くなるが、最後まで聞いてくれよ？[x]
[fgfront storage=front_smile2]
じゃあ早速はじめるぜ。[x]
まずは「ノベルスフィアの楽しみかた」からだ。[x]

*menuEnjoy
[if o2_exp="f.allMode!=1"][btnhide][endif]
[flip storage=flip_01]
[fgfront storage=front_normal]
[msgon]
このコーナーでは、そもそもノベルスフィアはどうやって楽しむものなのかを説明する。[x]
ゲームを作るったって、楽しみかたもわからないんじゃ作りようがないからな！[x]
[fgfront storage=front_happy]
ここまで来た人にはわかると思うが、ノベルスフィアのゲームは普通のノベルゲームのようにプレイできる。[x]
たとえばバックログ。[x]
パソコンからプレイしてる人はマウスのホイールを上に回してみてほしい。[l]ちなみにスマホなら、画面を下にフリックだ。[x]
どうだ？　バックログは表示されたか？[x]
[fgfront storage=front_smile2]
メッセージボックスを消すのは右クリック。[l]スマホなら左右どちらかにフリック。[x]
ま、このあたりの操作はゲームによっても違うから、新しいゲームをプレイするときにはいろいろ試してみてくれ。[x]
[fgdiag storage=diag_grin]
いずれにしても、こういう「フツーのノベルゲーム」をブラウザで楽しめるっていうのが、ノベルスフィアのウリなわけだな。[x]
なんたらtubeやらニコニコなんたらのおかげで、みんな動画をブラウザで楽しむようになっただろ？[x]
だったらノベルゲームだって遊べてもいいじゃないか……ってのがノベルスフィアなんだ。[x]
[fgfront storage=front_smile]
さ、こんなところで、「ノベルスフィアの楽しみかた」のコーナーは終わりだ。[x]
[if o2_exp="f.allMode!=1"]
それじゃ、またどこかで会おうぜ！[x]
[msgoff]
[jump target=*menu]
[else]
次のコーナーに移るぜ！[x]
[endif]

*menuAbout
[if o2_exp="f.allMode!=1"][btnhide][endif]
[flip storage=flip_02]
[fgfront storage=front_normal]
[msgon]
このコーナーでは、O₂ Engineっていうものについて説明するぜ。[x]
[fgdiag storage=diag_smile]
O₂ Engineってのは、ノベルゲームをブラウザ上で動かすためのゲームエンジンだ。[x]
ちなみに、このゲーム自体もO₂ Engineで作られてる。[x]
ノベルスフィアで配信されるゲームは全部、このO₂ Engineで制作されることになる。[x]
逆にいうと、O₂ Engineで制作されたゲームなら、どれでもノベルスフィアで配信できるってわけだ。[x]
[fgfront storage=front_smile]
ノベルスフィア用のO₂ Engineは無料で使える！[x]
もし興味があれば、今すぐにゲームを作りはじめることだってできる。[x]
商業メーカーさんも、同人サークルさんも大歓迎だ。[x]
[fgdiag storage=diag_grin]
さっそく作りたいって人は、ノベルスフィアのサイトからSDK（開発キット）を入手してくれ。[x]
ゲームを作ったら、ノベルスフィアに提出して、配信を申請する。[x]
制作から配信までの流れはこんな感じだな。[l]詳しくはノベルスフィアのサイトを見てみてくれ。[x]
[fgfront storage=front_happy]
ちなみに、O₂ Engineは「吉里吉里」っていうエンジンによく似てる。[x]
吉里吉里はノベルゲームのエンジンの中では有名なほうだし、使い慣れた人も多いはずだ。[x]
[fgdiag storage=diag_smile]
さて、そろそろ「O₂ Engineとは？」のコーナーはおしまいだ。[x]
[if o2_exp="f.allMode!=1"]
それじゃ、またどこかで会おうぜ！[x]
[msgoff]
[jump target=*menu]
[else]
次のコーナーに移るぜ！[x]
[endif]

*menuText
[if o2_exp="f.allMode!=1"][btnhide][endif]
[flip storage=flip_03]
[fgfront storage=front_normal]
[msgon]
ここではノベルゲームのキモ、文書の表示について説明する。[x]
といっても、普通にノベルゲームっぽい文章が表示できるってことは、ここまでのプレイでわかるよな。[x]
[fgdiag storage=diag_think]
他にできることっつーと、そうだな……。[x]
[fgfront storage=front_normal]
[font size=72]文字を大きくしたり、[deffont][x]
[font color=0xffcc00]文字に色を付けたり、[deffont][x]
[delay speed=100]文字の表示速度を変えるってのももちろんできる。[delay speed=30][x]
[backlay]
[position layer=message0 page=back width=960 height=640 left=0 top=0 frame="frame2" margint=60 marginr=60 marginb=60 marginl=60]
[trans method=crossfade time=300]
[wt]
こんなふうに、全画面でテキストを読ませていくこともできる。[l][r]
ルビを振るのも簡単だ。[l][ruby text=きし]既[ruby text=ゅつ]出、[ruby text=そう]巣[ruby text=くつ]窟……こんな感じでな。[l][r]
[fgfront storage=front_smile2]
どうだ？　結構いろんなことができるだろ？[x]
[msgoff]
[msginit]
[msgon]
[fgfront storage=front_normal]
「文章の表示」のコーナーはこんなところでおしまいだ。[x]
[if o2_exp="f.allMode!=1"]
それじゃ、またどこかで会おうぜ！[x]
[msgoff]
[jump target=*menu]
[else]
次のコーナーは画像の表示についてだ。どんどんいくぜ！[x]
[endif]

*menuGraphic
[if o2_exp="f.allMode!=1"][btnhide][endif]
[flip storage=flip_04]
[fgfront storage=front_normal]
[msgon]
それじゃ、画像の表示について説明する。[x]
ノベルスフィアのゲームは、多くの種類のトランジションを扱える。[l]例えば、こんな感じだ。[x]
[msgoff]
[fg_bye]

[bg storage=bg_02 method=toss time=750]
[wait time=500]
[bg storage=bg_03 method=cube time=750]
[wait time=500]
[bg storage=bg_01 method=scroll time=750]
[wait time=500]
[bg storage=bg_02 method=fadethrough time=750]
[wait time=500]
[bg storage=bg_03 method=crossfade time=750]
[wait time=500]
[bg storage=bg_01 method=blinddown time=750]
[wait time=500]

[fg_hello storage=front_smile2 top=0 left=396]
[msgon]

他にもあるから、作りたいゲームの雰囲気に合ったトランジションを選んでくれ。[x]
あとは定番だが、画面全体を揺らすなんてのもできるぜ。[l][fgfront storage=front_smile]それ！
[quake time=1000 hmax=20 vmax=20]
[wq]
[x]
こんな感じだな。[x]
画像を動かすこともできる。[x]
俺が動いてみるから、ちょっと見ててくれよ？[x]

[msgoff]
[image storage=diag_grin layer=1 page=fore left=226 top=0 opacity=0 visible=true]
[move layer=0 page=fore path=(196,-100,255) time=100]
[wm]
[move layer=0 page=fore path=(196,0,255) time=100]
[wm]
[move layer=0 page=fore path=(196,-100,255) time=100]
[wm]
[move layer=0 page=fore path=(196,0,255) time=100]
[wm]
[wait time=1000]
[move layer=0 page=fore path=(-250,0,0) accel=-5 time=750]
[move layer=1 page=fore path=(-220,0,255) accel=-5 time=750]
[wm]
[wm]
[image storage=front_smile layer=0 page=fore left=520 opacity=0]
[move layer=1 page=fore path=(200,0,255) accel=5 time=750]
[wm]
[move layer=1 page=fore path=(396,-300,0) accel=-5 time=500]
[wm]
[image storage=mirror_diag_smile2 layer=1 page=fore left=100 top=0]
[move layer=1 page=fore path=(550,0,255) accel=-10 time=750]
[wm]
[wait time=500]
[move layer=1 page=fore path=(226,0,0) accel=-5 time=500]
[move layer=0 page=fore path=(196,0,255) accel=-5 time=500]
[wm]
[wm]

[msgon]
ご覧の通り、けっこう複雑な動きも制御できるから、演出の幅が広がるぜ。[x]
他にもいろいろできるが、詳しくは開発キットのドキュメントを見てくれ。[x]
[fgfront storage=front_normal]
さて、「画像の表示」のコーナーはこれでおしまいだ。[x]
[if o2_exp="f.allMode!=1"]
またどこかで会おうぜ！[x]
[msgoff]
[jump target=*menu]
[else]
次のコーナーへ行くぞ。[x]
[endif]

*menuSound
[if o2_exp="f.allMode!=1"][btnhide][endif]
[flip storage=flip_05]
[fgfront storage=front_normal]
[msgon]
じゃ、ここでは音声の再生について説明する。[x]
説明のために、これから音が鳴るから注意してくれ！[x]
まずは効果音。[x]
[msgoff]
[playse storage=se_punch]
[wait time=1300]
[playse storage=se_drop]
[wait time=4000]
[stopbgm]
[fgfront storage=front_smile2]
[msgon]
次はBGMだ。[x]
[playbgm storage=bgm_01]
こんな感じだな。[x]
[fgfront storage=front_smile]
特段真新しいこともねぇが、音を付けると一気にゲームっぽくなるから不思議なもんだな。[x]
短いけど、「音声の再生」コーナーはこんなところだ。[x]
[fadeoutbgm time=1000]
[if o2_exp="f.allMode!=1"]
じゃ、また会おうぜ！[x]
[msgoff]
[jump target=*menu]
[else]
じゃ、次のコーナーが最後だ！[x]
[endif]

*menuSave
[if o2_exp="f.allMode!=1"][btnhide][endif]
[flip storage=flip_06]
[fgfront storage=front_normal]
[msgon]
このコーナーでは、GPS機能について説明する。[x]
最近じゃグーグル先生が、自分が今いる場所を知ってたりしてびっくりすることがあるだろ？[x]
あんな感じの機能だ。[x]
[fgfront storage=finger_front_smile2]
いまから俺が、今お前がいる県の名前を言いあててみせる。[x]
もしブラウザから位置情報を使ってもいいかどうか訊かれたら、「OK」とか「許可」と答えてくれ。[x]
じゃ、始めるぞ？[x]
[fgdiag storage=diag_telepathy]
むむむー……。[x]
[o2_geo_get]
[o2_geo_wg canskip=true]
[call target=*gpsFailed o2_cond="!ev.geo"]
[eval o2_exp="tf.geo='y='+ev.geo.coords.latitude+'&x='+ev.geo.coords.longitude;"]
[o2_request method=post url=http://n5.novelsphere.jp/nsapi/requestproxy/request.php req=&tf.geo]
[o2_wr]
[eval o2_exp="tf.geo=ev.req.body"]

[if o2_exp="!tf.geo"]
[call target=*gpsFailed]
[else]
[fgfront storage=front_normal]
よし、わかったぜ！[x]
お前がいるのは…[wait time=500]…[wait time=500]…[wait time=500][fgfront storage=finger_front_smile2]
[ch text="&tf.geo"]だろ！[x]
[eval o2_exp="if(tf.geo!='北海道'){tf.geo=tf.geo.substring(0,tf.geo.length-1);}"]
[fgfront storage=front_smile]
そっかそっか、お前[ch text="&tf.geo"]にいんのかー。[x]
今度遊びに行っていいか？[l]　…なーんてな！[x]
[fgfront storage=front_normal]
ま、ノベルスフィアだとこんなゲームも作れるってわけだぜ。[x]
[endif]

*gpsEnd
[fgfront storage=front_smile2]
[if o2_exp="f.allMode!=1"]
じゃ、そろそろお別れだ。[x]
またどこかで会おうぜ！[x]
[msgoff]
[jump target=*menu]
[else]
さて、そろそろお別れだ。[x]
これで全部の説明が終わったことになる。[x]
[fgfront storage=front_smile2]
よかったらまた読みに来てくれよな！[x]
じゃ、またな！[x]
[msgoff]
[jump target=*menu]
[endif]


;///////////////////////////////////////////////////////////////////////////////
;// ゲーム本編サブルーチン
;///////////////////////////////////////////////////////////////////////////////

*gpsFailed
[fgdiag storage=diag_think]
うーん、悪りィ…うまくできなかったみたいだ。[x]
位置情報がうまくゲットできなかったか、それともお前が日本にいねぇのか、どっちかだな。[x]
[fgfront storage=front_normal]
ま、GPS機能はこんな感じのことができるはずなんだが、端末を選ぶのがちょっとばかし難点だな。[x]
スマホ専用ゲームを作るときなんかはいいかもしれないぜ。[x]
[return target=*gpsEnd]