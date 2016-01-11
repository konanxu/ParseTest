//
//  ChuanGanQiController.m
//  ParseStarterProject
//
//  Created by Konan on 15/10/16.
//
//

#import "ChuanGanQiController.h"

@interface ChuanGanQiController()
@property (weak, nonatomic) IBOutlet UIView *backGroundView;
@property (weak, nonatomic) IBOutlet UIImageView *myMmageView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *stopGunDongBtn;
@property (nonatomic,strong)CMMotionManager *manger;
@end

@implementation ChuanGanQiController

- (void)awakeFromNib{
    [super awakeFromNib];
//    self.view.backgroundColor =[UIColor orangeColor];
}
- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.manger =[[CMMotionManager alloc] init];
    
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    [_backGroundView addGestureRecognizer:tap];
    
    
//    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
//    btn.titleLabel.text =@"停止";
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(tapBarButton)];
    self.navigationItem.rightBarButtonItem=item1;
    
}
- (void)tapBarButton{
    [self.manger stopAccelerometerUpdates];
}
- (void)tapClick:(UITapGestureRecognizer *)tapGes{
    NSOperationQueue *queue =[[NSOperationQueue alloc] init];
    
    [self.manger startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            CGRect imageframe =self.myMmageView.frame;
            imageframe.origin.x += accelerometerData.acceleration.x*2;
            if (!CGRectContainsRect(_backGroundView.bounds, imageframe)) {
                
                NSLog(@"%f",imageframe.origin.x);
                if (imageframe.origin.x >= _backGroundView.frame.size.width-_myMmageView.frame.size.width) {
                    imageframe.origin.x = _backGroundView.frame.size.width-_myMmageView.frame.size.width;
                }else{
                imageframe.origin.x =0;
                }
                
            }
            imageframe.origin.y -= accelerometerData.acceleration.y*2;
            if (!CGRectContainsRect(_backGroundView.bounds, imageframe)) {
                
                if (imageframe.origin.y>=_backGroundView.frame.size.height-_myMmageView.frame.size.height) {
                    imageframe.origin.y = _backGroundView.frame.size.height-_myMmageView.frame.size.height;
                }else{
                    imageframe.origin.y =0;
                }
                
                
                
            }
            self.myMmageView.frame=imageframe;
            
        });
        
    }];
    self.stopGunDongBtn.enabled=YES;
    
    
    
}
- (IBAction)click:(id)sender {
    CMMotionManager *manger =[[CMMotionManager alloc] init];
    //加速度
    BOOL b =manger.accelerometerAvailable;
    NSLog(b?@"加速度可使用":@"加速度不可使用");
    
    //陀螺
    b =manger.gyroAvailable;
    NSLog(b?@"陀螺可使用":@"陀螺不可使用");
    
    /**
     *  磁场
     */
    
    b= manger.magnetometerAvailable;
    
    NSLog(b?@"磁场可使用":@"磁场不可使用");
    /**
     *  设备移动
     */
    b= manger.deviceMotionAvailable;
    NSLog(b?@"设备移动可使用":@"设备移动不可使用");
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.manger stopAccelerometerUpdates];
    
}
- (IBAction)start:(id)sender{

    NSOperationQueue *queue =[[NSOperationQueue alloc] init];
    
    /**
     加速度
     */
    
//    [self.manger startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
//        CMAcceleration a = accelerometerData.acceleration;
//        NSLog(@"[%f,%f,%f]",a.x,a.y,a.z);
//    }];

    /**
     陀螺仪
     */
//    [self.manger startGyroUpdatesToQueue:queue withHandler:^(CMGyroData *gyroData, NSError *error) {
//        CMRotationRate r = gyroData.rotationRate;
//        NSLog(@"[%f,%f,%f]",r.x,r.y,r.z);
//    }];
    /**
     磁场
     */
    [self.manger startMagnetometerUpdatesToQueue:queue withHandler:^(CMMagnetometerData *magnetometerData, NSError *error) {
        CMMagneticField m =magnetometerData.magneticField;
        NSLog(@"[%f,%f,%f]",m.x,m.y,m.z);
    }];
    
    
    [self .manger startDeviceMotionUpdatesToQueue:queue withHandler:^(CMDeviceMotion *motion, NSError *error) {
        CMAttitude *a =motion.attitude;
        double roll =a.roll;
        double pitch = a.pitch;
        double yaw = a.yaw;
        NSLog(@"[%f,%f,%f]",roll,pitch,yaw);
    }];
    
}
- (IBAction)stop:(id)sender{
//    [self.manger stopAccelerometerUpdates];
//    [self.manger stopGyroUpdates];
//    [self.manger stopMagnetometerUpdates];
    [self.manger stopDeviceMotionUpdates];
}
- (IBAction)stopGunDongClick:(id)sender {
    [self.manger stopAccelerometerUpdates];
    self.stopGunDongBtn.enabled=NO;
}

@end
