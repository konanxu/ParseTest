//
//  HomePageTableViewController.m
//  ParseStarterProject
//
//  Created by Konan on 16/1/11.
//
//

#import "HomePageTableViewController.h"
#import "CommonManager.h"
#import "NSString+Util.h"
#import <MJExtension.h>
#import "BannerModel.h"
#import "InfoModel.h"
#import "ListItemModel.h"
#import "ListItemCollectionReusableView.h"
#import "HomePageTypeOneCollectionViewCell.h"
#import "BannerTableViewCell.h"
#import <SDCycleScrollView.h>
#import "HomeTypeOneTableViewCell.h"
#import "ComicinfoModel.h"
#import "HomeTypeTwoTableViewCell.h"

static NSString  * const bannerCellIdentifier = @"bannerCellIdentifier";
static NSString  * const typeOneCellIdentifier = @"typeOneCellIdentifier";
static NSString  * const typeTwoCellIdentifier = @"typeTwoCellIdentifier";
//static NSString  * const collectionCell1Identifier = @"HomePageTypeOneCollectionViewCell";
//static NSString  * const collectionHeaderIndentifier = @"typeOneHeaderIndentifier";


#define kWebPath @"http://api.zhuizhuiyoyo.com/request.php"
@interface HomePageTableViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_bannerArr;
    NSMutableArray *_listArr;
}


@end

@implementation HomePageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.tableView.estimatedRowHeight = 212;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}
static NSString* form_urlencode_HTTP5_Parameters(NSDictionary* parameters)
{
    NSMutableString* result = [[NSMutableString alloc] init];
    BOOL isFirst = YES;
    NSArray *sortedKeys = [parameters keysSortedByValueUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if (obj1 > obj2) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        if (obj1 < obj2) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    NSArray *keyArr = [[NSArray alloc] init];
    NSArray *valueArr = [[NSArray alloc] init];
    for (NSString *key in sortedKeys) {
        if (!isFirst) {
            [result appendString:@"&"];
        }
        isFirst = NO;
        assert([key isKindOfClass:[NSString class]]);
        NSString* value = parameters[key];
        assert([value isKindOfClass:[NSString class]]);
        NSString* encodedName = form_urlencode_HTTP5_String(key);
        NSString* encodedValue = form_urlencode_HTTP5_String(value);
        [result appendString:encodedName];
        [result appendString:@"="];
        [result appendString:encodedValue];
    }
    
    return [result copy];
}
static NSString* form_urlencode_HTTP5_String(NSString* s) {
    CFStringRef charactersToLeaveUnescaped = CFSTR(" ");
    CFStringRef legalURLCharactersToBeEscaped = CFSTR("!$&'()+,/:;=?@~");
    
    NSString *result = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                 kCFAllocatorDefault,
                                                                                 (__bridge CFStringRef)s,
                                                                                 charactersToLeaveUnescaped,
                                                                                 legalURLCharactersToBeEscaped,
                                                                                 kCFStringEncodingUTF8));
    return [result stringByReplacingOccurrencesOfString:@" " withString:@"+"];
}
- (void)loadData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        CommonManager *manager =[CommonManager shareCommonManager];
        NSMutableDictionary *dic =[[NSMutableDictionary alloc] init];
        
        [dic setObject:@"page/home" forKey:@"method"];
        [dic setObject:@"{\"v\":1}" forKey:@"param"];
        [dic setObject:@"8d419261f526aa22aee78c4e6f17ed5b" forKey:@"sig"];
        [dic setObject:@"1452094966" forKey:@"timestamp"];
        
        NSDictionary *resultDic =@{@"method":@"page/home",@"param":@"{\"v\":1}",@"sig":@"8d419261f526aa22aee78c4e6f17ed5b",@"timestamp":@"1452094966"};
        
        
        manager.httpManager.requestSerializer.queryStringSerializationWithBlock =
        ^NSString*(NSURLRequest *request,
                   NSDictionary *parameters,
                   NSError *__autoreleasing *error) {
            NSString* encodedParams = form_urlencode_HTTP5_Parameters(parameters);
            return encodedParams;
        };
        [manager.httpManager POST:kWebPath parameters:resultDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            
            NSMutableDictionary *headers = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                            @"application/x-www-form-urlencoded; charset=UTF-8",@"Content-Type"
                                            //                                            ,
                                            //                                            @"46002",@"zzOperators",@"iPhone",@"zzlModel",
                                            //                                            @"Apple",@"zzVendor",@"",@"zzOperatorsName",
                                            //                                            @"",@"zzUid",@"640*1136",@"zzResolution",
                                            //                                            @"App Store",@"zzlChannel",@"1.6.7",@"zzlVersion",
                                            //                                            @"8.1.3",@"zzlSystemVersion",@"6532518",@"zzDid",
                                            //                                            @"iPhone OS",@"zzlType",@"WiFi",@"zzNetworking"
                                            , nil];
            
            NSString * bodyString=@"";
            
            [formData appendPartWithHeaders:headers body:[bodyString dataUsingEncoding:NSUTF8StringEncoding]];
        } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            NSLog(@"%@",responseObject);
            [BannerModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
                return @{
                         @"bannerId":@"id",
                         @"infoModel":@"theme_info"
                         };
            }];
            [InfoModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
                return @{
                         @"infoId":@"id"
                         };
            }];
            [ComicinfoModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
                return @{
                         @"infoId":@"id"
                         };
            }];
            
            [ListItemModel mj_setupObjectClassInArray:^NSDictionary *{
                return @{
                         @"theme_list":@"InfoModel",
                         @"comics":@"ComicinfoModel"
                         };
            }];
            
            [ListItemModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
                return @{
                         @"groupId":@"id",
                         @"groupName":@"name",
                         @"infoModel":@"theme_info"
                         };
            }];
            
            
            _bannerArr= [BannerModel mj_objectArrayWithKeyValuesArray:responseObject[@"banners"]];
            _listArr =[ListItemModel mj_objectArrayWithKeyValuesArray:responseObject[@"lists"]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
            
            
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            NSLog(@"%@",error.localizedDescription);
        }];
    });
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configBanner:(SDCycleScrollView *)view{
    // 网络加载图片的轮播器
    NSArray * imagesURLStrings =[[NSArray alloc] init];
    NSArray * titlesURLStrings =[[NSArray alloc] init];
    for (BannerModel *model in _bannerArr) {
        imagesURLStrings= [imagesURLStrings arrayByAddingObject:model.infoModel.cover];
        titlesURLStrings = [titlesURLStrings arrayByAddingObject:model.infoModel.name];
    }
    view.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    view.imageURLStringsGroup = imagesURLStrings;
    view.titlesGroup =titlesURLStrings;
    view.pageControlDotSize= CGSizeMake(6,6);
    // 本地加载图片的轮播器
    //    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame: imagesGroup:图片数组];
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _listArr.count+1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.row==0 ? 140 :UITableViewAutomaticDimension;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BannerTableViewCell *cell = nil;
    HomeTypeOneTableViewCell *cellOne =nil;
    HomeTypeTwoTableViewCell *cellTwo =nil;
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:bannerCellIdentifier forIndexPath:indexPath];
        [self configBanner:cell.bannerView];
        return cell;
    }else{
        ListItemModel *model = _listArr[indexPath.row-1];
        if ([model.obj_type isEqualToString:@"1"]) {
            cellOne = [tableView dequeueReusableCellWithIdentifier:typeOneCellIdentifier forIndexPath:indexPath];
            cellOne.model = _listArr[indexPath.row-1];
            return cellOne;
        }else{
            cellTwo = [tableView dequeueReusableCellWithIdentifier:typeTwoCellIdentifier forIndexPath:indexPath];
            cellTwo.model = _listArr[indexPath.row-1];
            return cellTwo;
        }
    }
}





/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
