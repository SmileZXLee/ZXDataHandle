//
//  ViewController.m
//  ZXDataHandleDemo
//
//  Created by 李兆祥 on 2019/1/27.
//  Copyright © 2019 李兆祥. All rights reserved.
//

#import "ViewController.h"
#import "ZXDataHandle.h"

#import "Girl.h"
#import "Boy.h"
#import "Cat.h"
#import "Bird.h"
#import "Apple.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,weak)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initData];
}

#pragma mark - 数据转换部分
#pragma mark 单一字典转模型
-(void)test1{
    NSDictionary *girlDic = @{@"name":@"小红",@"sex":@0,@"sign":@"很高兴认识大家嘻嘻嘻",@"score":@"96.6",@"hasMoney":@"8888.76",@"hasClothes":@"888"};
    Girl *model = [Girl zx_modelWithObj:[girlDic mutableCopy]];
    NSLog(@"model--%@",model);
}
#pragma mark 字典中包含字典转模型
-(void)test2{
    NSDictionary *dogDic = @{@"name":@"汤姆狗",@"sex":@0,@"soldMoney":@76.1};
    NSDictionary *boyDic = @{@"name":@"小明",@"sex":@1,@"sign":@"很高兴认识大家",@"score":@"98.6",@"hasMoney":@"888.76",@"myDog":dogDic};
    Boy *model = [Boy zx_modelWithDic:[boyDic mutableCopy]];
    NSLog(@"model--%@",model);
}

#pragma mark 字典数组转模型数组
-(void)test3{
    NSMutableArray *girlsArr = [NSMutableArray array];
    for (NSUInteger i = 0; i < 5; i++) {
        NSDictionary *girlDic = @{@"name":@"小红",@"sex":@0,@"sign":@"很高兴认识大家嘻嘻嘻",@"score":@"96.6",@"hasMoney":@"8888.76",@"hasClothes":[NSString stringWithFormat:@"88%lu",(unsigned long)i]};
        [girlsArr addObject:girlDic];
    }
    NSMutableArray *modelArr = [Girl zx_modelWithObj:[girlsArr mutableCopy]];
    NSLog(@"modelArr--%@",modelArr);
}

#pragma mark 综合各种情况转模型(字典中存放其他字典，字典中存放数组)
-(void)test4{
    NSMutableArray *boysArr = [NSMutableArray array];
    
    for (NSUInteger i = 0; i < 5; i++) {
        NSDictionary *girlDic = @{@"name":@"小红",@"sex":@0,@"sign":@"很高兴认识大家嘻嘻嘻",@"score":@"96.6",@"hasMoney":@"8888.76",@"hasClothes":@"888"};
        NSDictionary *catDic = @{@"name":@"汤姆猫",@"sex":@1,@"soldMoney":@886.1,@"girls":@[girlDic,girlDic,girlDic]};
         NSDictionary *dogDic = @{@"name":@"汤姆狗",@"sex":@0,@"soldMoney":@76.1};
        NSDictionary *boyDic = @{@"name":@"小明",@"sex":@1,@"sign":@"很高兴认识大家",@"score":@"98.6",@"hasMoney":@"888.76",@"myDog":dogDic,@"myCat":catDic};
        [boysArr addObject:boyDic];
    }
    [boysArr addObject:[boysArr mutableCopy]];
    NSMutableArray *modelArr = [Boy zx_modelWithObj:[boysArr mutableCopy]];
    NSLog(@"modelArr--%@",modelArr);
}
#pragma mark json字符串转模型
-(void)test5{
    NSString * jsonPath = [[NSBundle mainBundle]pathForResource:@"TestJsonStr" ofType:nil];
    NSData * jsonData = [[NSData alloc]initWithContentsOfFile:jsonPath];
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableArray *modelArr = [Boy zx_modelWithObj:jsonStr];
    NSLog(@"modelArr--%@",modelArr);
}
#pragma mark 字典转模型特殊情况，驼峰转下划线
-(void)test6{
    NSDictionary *boyDic = @{@"name":@"小明",@"sex":@1,@"sign":@"很高兴认识大家",@"score":@"98.6",@"hasMoney":@"888.76"};
    NSArray *boysArr = @[boyDic,boyDic,boyDic];
    NSDictionary *birdDic = @{@"id":@"123456",@"like_to_do":@"like singing",@"boys":boysArr};
    Bird *model = [Bird zx_modelWithDic:[birdDic mutableCopy]];
    NSDictionary *modelDic = [model zx_toDic];
    NSLog(@"modelDic--%@",modelDic);
}

#pragma mark 字典或字典数组转json字符串
-(void)test7{
    NSMutableArray *boysArr = [NSMutableArray array];
    NSDictionary *girlDic = @{@"name":@"小红",@"sex":@0,@"sign":@"很高兴认识大家嘻嘻嘻",@"score":@"96.6",@"hasMoney":@"8888.76",@"hasClothes":@"888"};
    
    for (NSUInteger i = 0; i < 5; i++) {
        NSDictionary *girlDic = @{@"name":@"小红",@"sex":@0,@"sign":@"很高兴认识大家嘻嘻嘻",@"score":@"96.6",@"hasMoney":@"8888.76",@"hasClothes":@"888"};
        NSDictionary *catDic = @{@"name":@"汤姆猫",@"sex":@1,@"soldMoney":@886.1,@"girls":@[girlDic,girlDic,girlDic]};
        NSDictionary *dogDic = @{@"name":@"汤姆狗",@"sex":@0,@"soldMoney":@76.1};
        NSDictionary *boyDic = @{@"name":@"小明",@"sex":@1,@"sign":@"很高兴认识大家",@"score":@"98.6",@"hasMoney":@"888.76",@"myDog":dogDic,@"myCat":catDic};
        [boysArr addObject:boyDic];
    }
    
    //字典数组转json
    NSString *jsonArrStr = [boysArr zx_toJsonStr];
    //字典数组转kvStr
    NSString *keValueStr = [boysArr zx_kvStr];
    NSLog(@"jsonArrStr--%@",jsonArrStr);
    NSLog(@"keValueStr--%@",keValueStr);
    //字典转json
    NSString *jsonStr = [girlDic zx_toJsonStr];
    NSLog(@"jsonStr--%@",jsonStr);
}

#pragma mark 模型转Json字符串
-(void)test8{
    Cat *cat = [[Cat alloc]init];
    cat.name = @"嘻哈猫";
    cat.sex = @"0";
    cat.soldMoney = @100;
    NSUInteger i = 0;
    NSMutableArray *girlsArr = [NSMutableArray array];
    while (i < 5) {
        Girl *girl = [[Girl alloc]init];
        girl.name = @"嘻哈女孩";
        girl.sex = @"0";
        girl.sign = @"大家好呀嘻嘻";
        girl.score = @"98";
        girl.hasMoney = @10;
        [girlsArr addObject:girl];
        i++;
    }
    cat.girls = girlsArr;
    NSString *resJson = [cat zx_toJsonStr];
    NSLog(@"resJson--%@",resJson);
    
    NSArray *catsArr = @[cat,cat,cat];
    NSString *resArrJson = [catsArr zx_toJsonStr];
    NSLog(@"resArrJson--%@",resArrJson);
}
#pragma mark 模型转字典
-(void)test9{
    Cat *cat = [[Cat alloc]init];
    cat.name = @"嘻哈猫";
    cat.sex = @"0";
    cat.soldMoney = @100;
    NSUInteger i = 0;
    NSMutableArray *girlsArr = [NSMutableArray array];
    while (i < 5) {
        Girl *girl = [[Girl alloc]init];
        girl.name = @"嘻哈女孩";
        girl.sex = @"0";
        girl.sign = @"大家好呀嘻嘻";
        girl.score = @"98";
        girl.hasMoney = @10;
        [girlsArr addObject:girl];
        i++;
    }
    cat.girls = girlsArr;
    NSDictionary *resDic = [cat zx_toDic];
    NSLog(@"resDic--%@",resDic);
    
    NSArray *catsArr = @[cat,cat,cat];
    NSArray *resDicArr = [catsArr zx_toDic];
    NSLog(@"resDicArr--%@",resDicArr);
}

#pragma mark - 数据储存部分
#pragma mark 自定义对象归档
-(void)test10{
    Apple *apple = [[Apple alloc]init];
    apple.name = @"嘻哈苹果";
    apple.dec = @"很好吃吧234";
    apple.soldMoney = 1001;
    [ZXDataStoreCache arcObj:apple pathComponent:@"apple"];
    
}

#pragma mark 将一条记录存储到数据库
-(void)test11{
    Apple *apple = [[Apple alloc]init];
    apple.name = @"嘻哈苹果";
    apple.dec = @"很好吃哦";
    apple.soldMoney = 100;
    BOOL res = [apple zx_dbSave];
    NSLog(@"结果--%i",res);
}

#pragma mark 将多条记录存储到数据库
-(void)test12{
    NSMutableArray *appleArr = [NSMutableArray array];
    for (NSUInteger i = 0; i < 10; i++) {
        Apple *apple = [[Apple alloc]init];
        apple.name = @"嘻哈苹果";
        apple.dec = @"很好吃哦";
        apple.soldMoney = 100 + i;
        [appleArr addObject:apple];
    }
    BOOL res = [appleArr zx_dbSave];
    NSLog(@"结果--%i",res);
}
#pragma mark 在数据库表中删除一条或多条记录
-(void)test13{
    int dropSoldMoney = 103;
    BOOL res = [Apple zx_dbDropWhereArg:@"soldMoney=",[NSString stringWithFormat:@"%i",dropSoldMoney],nil];
    NSLog(@"结果--%i",res);
}

#pragma mark 通过自定义对象更新数据
-(void)test14{
    NSNumber *updateSoldMoney = @104;
    Apple *updateApp = [[Apple alloc]init];
    updateApp.dec = @"这是通过自定义对象更新的数据测试";
    BOOL res  = [updateApp zx_dbUpdateWhereArg:@"soldMoney=",updateSoldMoney,nil];
    NSLog(@"结果--%i",res);
}

#pragma mark 通过字典更新数据
-(void)test15{
    NSNumber *updateSoldMoney = @104;
    NSDictionary *updateDic = @{@"dec":@"这是通过字典更新的数据测试",@"soldMoney":@"+=66",@"testAdd":@"测试的后来新增的字段"};
    BOOL res  = [Apple zx_dbUpdateDic:updateDic whereArg:@"soldMoney=",updateSoldMoney,nil];
    NSLog(@"结果--%i",res);
}

#pragma mark 查询数据 返回Apple对象数组
-(void)test16{
    NSArray *resArr = [Apple zx_dbQuaryWhere:@"soldMoney > 101"];
    NSLog(@"结果--%@",resArr);
}
#pragma mark 删除Apple同名表
-(void)test17{
    [Apple zx_dbDropTable];
}

#pragma mark 删除数据库
-(void)test18{
    [ZXDataStoreSQlite dropDb];
}



-(void)initUI{
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}
-(void)initData{
    NSMutableArray *selsArr = [NSMutableArray array];
    NSArray *titlesArr = @[@"单一字典转模型",@"字典中包含字典转模型",@"字典数组转模型数组",@"综合各种情况转模型(字典中存放其他字典，字典中存放数组)",@"json字符串转模型",@"字典转模型特殊情况，驼峰转下划线",@"字典或字典数组转json字符串",@"模型转Json字符串",@"模型转字典",@"自定义对象归档",@"将一条记录存储到数据库",@"将多条记录存储到数据库",@"在数据库表中删除一条或多条记录",@"通过自定义对象更新数据",@"通过字典更新数据",@"查询数据 返回Apple对象数组",@"删除Apple同名表",@"删除数据库"];
    for (NSUInteger i = 0; i < 18; i++) {
        NSString *subItem = [NSString stringWithFormat:@"test%lu",(unsigned long)i + 1];
        NSDictionary *subDic = @{@"title":titlesArr[i],@"sel":subItem};
        [selsArr addObject:subDic];
    }
    self.dataArr = [selsArr mutableCopy];
    [self.tableView reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    NSDictionary *dataDic = self.dataArr[indexPath.row];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.textLabel.text = dataDic[@"title"];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dataDic = self.dataArr[indexPath.row];
    NSLog(@"执行[%@]",dataDic[@"title"]);
    SEL sel = NSSelectorFromString(dataDic[@"sel"]);
    [self performSelector:sel withObject:nil afterDelay:0];
    
}

-(NSMutableArray *)dataArr{
    if(!_dataArr){
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
