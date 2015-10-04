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
    
    _vocabularyArray1 = @[@"目が痛い",
                          @"I have sore eyes.",
                          @"結膜炎",
                          @"pink eye / conjunctivitis",
                          @"目の周りにできる黒いアザ",
                          @"black eye",
                          @"弱視",
                          @"lazy eye",
                          @"目がかすむ",
                          @"blurry / blurred",
                          @"近視／遠視",
                          @"near-sighted／far-sighted",
                          @"紫外線による目のヤケド",
                          @"snow blindness",
                          @"飛蚊症",
                          @"floaters",
                          @"",
                          @"",
                          @"",
                          @"",
                          @"",
                          @""];
    
    _vocabularyArray2 = @[@"お腹が痛い",
                          @"I have.",
                          @"胃が痛い",
                          @"I have a pain in my upper stomach. ",
                          @"生理痛",
                          @"cramps",
                          @"下痢",
                          @"loose bowels",
                          @"けいれん性の腹痛",
                          @"abdominal cramps ",
                          @"便秘",
                          @"constipation",
                          @"",
                          @"",
                          @"",
                          @"",
                          @"",
                          @""];
    
    _vocabularyArray3 = @[@"吐き気がする",
                          @"I'm nauseated",
                          @"嘔吐しました",
                          @"I vomited.",
                          @"嘔吐と下痢をする",
                          @"to vomit and have loose bowels",
                          @"昨日何回嘔吐しましたか？",
                          @"How many times did you vomit yesterday?",
                          @"ひどい、過度の嘔吐",
                          @"severe and excessive vomiting ",
                          @"",
                          @"",
                          @"",
                          @"",
                          @"",
                          @""];
    
    _vocabularyArray4 = @[@"鼻水",
                          @"runny nose",
                          @"熱",
                          @"fever",
                          @"寒気",
                          @"chill",
                          @"喉が痛い",
                          @"I have a sore throat.",
                          @"だるさ",
                          @"tiredness",
                          @"インフルエンザ",
                          @"Flu / Influenza",
                          @"咳",
                          @"cough",
                          @"",
                          @"",
                          @"",
                          @"",
                          @"",
                          @""];
    
    _vocabularyArray5 = @[@"打撲",
                          @"bruise",
                          @"切り傷",
                          @"cut",
                          @"打撲",
                          @"bruise",
                          @"脱臼する",
                          @"dislocate",
                          @"アキレス腱が切れる",
                          @"tear my achilles heel",
                          @"たんこぶ",
                          @"bump",
                          @"すねをぶつける",
                          @"bang my shin",
                          @"突き指をする",
                          @"jam my finger",
                          @"爪が割れる/剥がれる",
                          @"break my nail",
                          @"つる",
                          @"have a cramp",
                          @"靱帯を切る",
                          @"tear a ligament",
                          @"擦りむく",
                          @"scrape my knee",
                          @"捻挫する",
                          @"sprain",
                          @"足首をひねる",
                          @"twist my ankle",
                          @"骨折",
                          @"broke/fractured ",
                          @"ヒビが入った",
                          @"fracture",
                          @"",
                          @"",
                          @"",
                          @"",
                          @"",
                          @""];
    
    _vocabularyArray6 = @[@"健康保険証",
                          @"health insurance card",
                          @"診察申込書",
                          @"registration form",
                          @"初診",
                          @"first visit",
                          @"再診",
                          @"return visit",
                          @"外来患者",
                          @"outpatient",
                          @"患者",
                          @"patient",
                          @"紹介状",
                          @"reference from other doctor",
                          @"問診票",
                          @"medical questionnaire",
                          @"救急病棟、急患",
                          @"emergency",
                          @"カルテ",
                          @"a medical record",
                          @"支払い",
                          @"payment/co-payment",
                          @"予約",
                          @"appointment",
                          @"家族（血縁関係者）の病気の歴史",
                          @"family history",
                          @"旅行保険",
                          @"travel insurance",
                          @"領収書",
                          @"receipt",
                          @"診断書",
                          @"certificate",
                          @"",
                          @"",
                          @"",
                          @"",
                          @"",
                          @""];
    
    _vocabularyArray7 = @[@"発疹 皮疹",
                          @"rash",
                          @"かゆい、かゆみ",
                          @"itchy/itchiness",
                          @"関節の痛み",
                          @"joint pain",
                          @"めまいがする",
                          @"dizzy",
                          @"肺炎",
                          @"pneumonia",
                          @"アレルギー反応",
                          @"allergic reaction",
                          @"感染",
                          @"infection",
                          @"アレルギー　発音は、アレジー",
                          @"Allergy/allergies",
                          @"激痛",
                          @"severe pain",
                          @"急性の痛み",
                          @"acute pain",
                          @"うずくような痛み",
                          @"cramping pain",
                          @"ずきずきする",
                          @"throbbing pain",
                          @"突っ張り感",
                          @"tension",
                          @"筋肉痛になる",
                          @"have sore muscles",
                          @"生理、月経",
                          @"period",
                          @"",
                          @"",
                          @"",
                          @"",
                          @"",
                          @""];

    
    
    
    
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
      //  cell.textLabel.text = @"";
      //  cell.detailTextLabel.text = @"green";
        cell.backgroundColor = [UIColor colorWithHue:0.45
                                          saturation:0.08
                                          brightness:0.99
                                               alpha:1.0];     // does not work
        
        // does not work
    }
    // For odd
    else {
        //cell.textLabel.text = @"";
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
