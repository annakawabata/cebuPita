//
//  vocabularyViewController.m
//  cebuPita
//
//  Created by 川端杏奈 on 2015/10/02.
//  Copyright (c) 2015年 Anna Kawabata. All rights reserved.
//

#import "vocabularyViewController.h"
#import "vocabularyTableViewCell.h"

@interface vocabularyViewController ()

@end

@implementation vocabularyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor* tableBackgroundColor = [UIColor blackColor];
    tableBackgroundColor = [tableBackgroundColor colorWithAlphaComponent:0.3];
    
    [self.vocabularyTableView setBackgroundColor:tableBackgroundColor];
    
    
    //プロジェクト内のファイルにアクセスするオブジェクトを作成
    NSBundle *bundle = [NSBundle mainBundle];
    
    //読み込むプロパティリストのファイルパス（場所）を指定
    
    NSString *path = [bundle pathForResource:@"words" ofType:@"plist"];
    
    //プロパティリストの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *wordList = [dic objectForKey:@"wordList"];
    
    for (NSDictionary *word in wordList) {
        NSLog(@"title=%@",word[@"title"]);
        if([word[@"title"] isEqualToString:@"目 : Eye" ]){
            _vocabularyArray1 =word[@"words"];
        }
        if([word[@"title"] isEqualToString:@"腹痛 : Stomach" ]){
            _vocabularyArray2 =word[@"words"];
        }
        if([word[@"title"] isEqualToString:@"嘔吐" ]){
            _vocabularyArray3 =word[@"words"];
        }
        if([word[@"title"] isEqualToString:@"風邪" ]){
            _vocabularyArray4 =word[@"words"];
        }
        if([word[@"title"] isEqualToString:@"怪我" ]){
            _vocabularyArray5 =word[@"words"];
        }
        if([word[@"title"] isEqualToString:@"受付" ]){
            _vocabularyArray6 =word[@"words"];
        }
        if([word[@"title"] isEqualToString:@"その他" ]){
            _vocabularyArray7 =word[@"words"];
        }
    }
    
//    _vocabularyArray1 = @[@"目が痛い : I have sore eyes.",
//                          @"紫外線による目のヤケド : snow blindness",
//                          @"結膜炎 : pink eye / conjunctivitis",
//                          @"近視／遠視 : near-sighted／far-sighted",
//                          @"目の周りにできる黒いアザ : black eye",
//                          @"目がかすむ : blurry / blurred",
//                          @"弱視 : lazy eye",
//                          @"飛蚊症 : floaters"
//                          ];
//    
//    _vocabularyArray2 = @[@"腹痛 : stomachache.",
//                          @"下痢 : loose bowels",
//                          @"胃が痛い : I have a pain in my upper stomach.",
//                          @"けいれん性の腹痛 : abdominal cramps",
//                          @"生理痛 : cramps",
//                          @"便秘 : constipation"
//                          ];
//    
//    _vocabularyArray3 = @[@"吐き気がする : I'm nauseated",
//                          @"ひどい、過度の嘔吐 : severe and excessive vomiting",
//                          @"嘔吐しました : I vomited.",
//                          @"昨日何回嘔吐しましたか？ : How many times did you vomit yesterday?",
//                          @"嘔吐と下痢をする :  vomit and have loose bowels"
//                          ];
//    
//    _vocabularyArray4 = @[@"鼻水 : runny nose",
//                          @"喉が痛い : I have a sore throat.",
//                          @"熱 : fever",
//                          @"咳 : cough",
//                          @"寒気 : chill",
//                          @"インフルエンザ : Flu / Influenza",
//                          @"だるさ : tiredness"
//                          ];
//    
//    _vocabularyArray5 = @[@"打撲 : bruise",
//                          @"脱臼する : dislocate",
//                          @"切り傷 : cut",
//                          @"アキレス腱 : achilles heel",
//                          @"打撲 : bruise",
//                          @"骨折 : broke/fractured",
//                          @"ヒビが入った : fracture",
//                          @"足首をひねる : twist my ankle",
//                          @"捻挫する : sprain",
//                          @"擦りむく : scrape my knee",
//                          @"たんこぶ : bump",
//                          @"爪が割れる/剥がれる : break my nail",
//                          @"すねをぶつける : bang my shin",
//                          @"つる : have a cramp",
//                          @"突き指をする : jam my finger",
//                          @"靱帯を切る : tear a ligament"
//                          ];
//    
//    _vocabularyArray6 = @[@"健康保険証 : health insurance card",
//                          @"診察申込書 : registration form",
//                          @"初診 : first visit",
//                          @"再診 : return visit",
//                          @"予約 : appointment",
//                          @"外来患者 : outpatient",
//                          @"紹介状 : reference from other doctor",
//                          @"旅行保険 : travel insurance",
//                          @"問診票 : medical questionnaire",
//                          @"救急病棟、急患 : emergency",
//                          @"患者 : patient",
//                          @"カルテ : a medical record",
//                          @"家族（血縁関係者）の病気の歴史 : family history",
//                          @"診断書 : certificate",
//                          @"支払い : payment/co-payment",
//                          @"領収書 : receipt"
//                          ];
//    
//    _vocabularyArray7 = @[@"発疹 皮疹 : rash",
//                          @"アレルギー : Allergy/allergies",
//                          @"かゆい、かゆみ : itchy/itchiness",
//                          @"アレルギー反応 : allergic reaction",
//                          @"関節の痛み : joint pain",
//                          @"筋肉痛 : have sore muscles",
//                          @"めまいがする : dizzy",
//                          @"感染 : infection",
//                          @"肺炎 : pneumonia",
//                          @"激痛 : severe pain",
//                          @"急性の痛み : acute pain",
//                          @"うずくような痛み : cramping pain",
//                          @"ずきずきする : throbbing pain",
//                          @"突っ張り感 : tension",
//                          @"生理、月経 : period"
//                          ];
    
    self.vocabularyTableView.delegate = self;
    self.vocabularyTableView.dataSource = self;
    
    
    //カスタムセルを設定
    //カスタマイズしたセルをテーブルビューで使えるようにするためnibを宣言する
    //nilとはxibファイルのこと
    UINib *nib=[UINib nibWithNibName:@"vocabularyCell" bundle:nil];
    
    //使用する
    [self.vocabularyTableView registerNib:nib forCellReuseIdentifier:@"Cell"];
    
}


//行数を返す
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int x;
    
    switch (self.selectNum) {
        case 0:
            x= (int)_vocabularyArray1.count;
            break;
        case 1:
            x= (int) _vocabularyArray2.count;
            break;
        case 2:
            x= (int) _vocabularyArray3.count;
            break;
        case 3:
            x= (int) _vocabularyArray4.count;
            break;
        case 4:
            x= (int) _vocabularyArray5.count;
            break;
        case 5:
            x= (int) _vocabularyArray6.count;
            break;
        case 6:
            x= (int) _vocabularyArray7.count;
            break;
        default:
            break;
    }return x;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"hospitalImage03.jpg"] drawInRect:self.view.bounds];
    UIImage *backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    
    vocabularyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil){//セルという定数をつけている
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//    }
    
    
    
    switch (self.selectNum) {
        case 0:
            cell.vocabularyLabel.text = [NSString stringWithFormat:@"%@",_vocabularyArray1[indexPath.row]];
            break;
        case 1:
            cell.vocabularyLabel.text = [NSString stringWithFormat:@"%@",_vocabularyArray2[indexPath.row]];
            break;
        case 2:
            cell.vocabularyLabel.text = [NSString stringWithFormat:@"%@",_vocabularyArray3[indexPath.row]];
            break;
        case 3:
            cell.vocabularyLabel.text = [NSString stringWithFormat:@"%@",_vocabularyArray4[indexPath.row]];
            break;
        case 4:
            cell.vocabularyLabel.text = [NSString stringWithFormat:@"%@",_vocabularyArray5[indexPath.row]];
            break;
        case 5:
            cell.vocabularyLabel.text = [NSString stringWithFormat:@"%@",_vocabularyArray6[indexPath.row]];
            break;
        case 6:
            cell.vocabularyLabel.text = [NSString stringWithFormat:@"%@",_vocabularyArray7[indexPath.row]];
            break;
        default:
            break;
    };
    
    if (indexPath.row % 2 == 0) {
        // cell.textLabel.text = @"";
        // cell.detailTextLabel.text = @"green";
        cell.backgroundColor = [UIColor colorWithHue:0.45
                                          saturation:0.08
                                          brightness:0.99
                                               alpha:1.0];     // does not work
        
        // does not work
    }
    // For odd
    else {
        // cell.textLabel.text = @"";
        // cell.detailTextLabel.text = @"blue";
        cell.backgroundColor = [UIColor colorWithHue:0.65
                                          saturation:0.08
                                          brightness:0.99
                                               alpha:1.0];     // does not work
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
