
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendNotificacion:(id)sender {
    
    UILocalNotification * notificacion = [[UILocalNotification alloc] init];
    notificacion.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    notificacion.alertBody = @"Abre la aplicacion, tienes un mensaje";
    notificacion.timeZone = [NSTimeZone defaultTimeZone];
    notificacion.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notificacion];
    
    
}























@end
