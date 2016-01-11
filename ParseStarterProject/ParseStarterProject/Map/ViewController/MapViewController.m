//
//  MapViewController.m
//  ParseStarterProject
//
//  Created by Konan on 15/10/16.
//
//

#import "MapViewController.h"
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Location/BMKLocationService.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>

@interface MapViewController() <BMKLocationServiceDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *startBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *stopBtn;


@end
@implementation MapViewController

{
    UISearchBar *_search;
    BMKMapView *_mapView;
    BMKLocationService *_locService;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    BMKMapView* mapView1 = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.view = mapView1;
    _mapView = mapView1;
    _search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, 320, 44)];
    [self.view addSubview: _search];
    //初始化BMKLocationService
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    //启动LocationService
//    [_locService startUserLocationService];
    
    _startBtn.enabled = YES;
    _stopBtn.enabled = NO;
    
//    UITapGestureRecognizer *tapGes =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
//    
//    [_mapView addGestureRecognizer:tapGes];
}
//- (void)tapClick:(UITapGestureRecognizer *)tapGes{
//    [_search endEditing:YES];
//}
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
    NSLog(@"heading is %@",userLocation.heading);
}
//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    
    _mapView.showsUserLocation = YES;//显示定位图层
    [_mapView updateLocationData:userLocation];
}


-(void)viewWillAppear:(BOOL)animated
{
    [(BMKMapView *)self.view viewWillAppear];
//    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
-(void)viewWillDisappear:(BOOL)animated
{
    [(BMKMapView *)self.view viewWillDisappear];
    ((BMKMapView *)self.view).delegate = nil; // 不用时，置nil
}

- (IBAction)stopLocation:(id)sender {
    [_locService stopUserLocationService];
    _mapView.showsUserLocation = NO;
    
    _startBtn.enabled = YES;
    _stopBtn.enabled = NO;
//    CLLocationCoordinate2D coordinate;
//    CLLocationDegrees a = 1.0;
//    BMKCoordinateRegion viewRegion = (coordinate)
//    
//    BMKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];
//    
//    [_mapView setRegion:adjustedRegion animated:YES];
    
}
- (IBAction)startLocation:(id)sender {
    [_locService startUserLocationService];
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;//设置定位的状态
    _mapView.showsUserLocation = YES;
    
    _startBtn.enabled = NO;
    _stopBtn.enabled = YES;
}

@end
