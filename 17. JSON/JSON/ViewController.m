
#import "ViewController.h"
#import "Usuario.h"

@interface ViewController (){
    Usuario * user;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _userLabel.hidden = YES;
    _jsonLabel.hidden = YES;
    [_animacion1 startAnimating];
    [_animacion2 startAnimating];
    
    user = [[Usuario alloc] init];
    user.id_usuario = [NSNumber numberWithInt:1];
    user.nombre = @"Jose";
    user.edad = @"20";
    user.direccion = @"Poblado";
    user.estado = @"Activo";
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL * url = [NSURL URLWithString:@"http://api.kivaws.org/v1/loans/search.json?status=fundraising"];
        NSData * data = [NSData dataWithContentsOfURL:url];
        [self performSelectorOnMainThread:@selector(imprimirDatos:) withObject:data waitUntilDone:YES];
    });
    
}
-(void)imprimirDatos:(NSData*)responseData{
    _userLabel.hidden = NO;
    _jsonLabel.hidden = NO;
    [_animacion1 stopAnimating];
    [_animacion2 stopAnimating];
    
    _animacion1.hidden= YES;
    _animacion2.hidden=YES;
    NSError * error;
    NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    //NSLog(@"%@", json);
    NSArray * loans = [json objectForKey:@"loans"];
    NSDictionary * registro = [loans objectAtIndex:0];
    //NSLog(@"%@", registro);
    
    NSNumber * registro_id = [registro objectForKey:@"id"];
    NSString * registro_nombre = [registro objectForKey:@"name"];
    NSString * registro_fecha = [registro objectForKey:@"posted_date"];
    NSString * registro_sector = [registro objectForKey:@"sector"];
    
    _userLabel.text = [NSString stringWithFormat:@"El registro %@, a cargo de %@ corresponde al sector de %@ y su fecha de publicacion fue %@", registro_id, registro_nombre, registro_sector, registro_fecha];
    
    
    
    NSDictionary * jsonUser = [NSDictionary dictionaryWithObjectsAndKeys:user.id_usuario, @"id", user.nombre , @"nombre", user.edad , @"edad", user.direccion, @"direccion", user.estado, @"estado", nil];
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:jsonUser options:kNilOptions error:&error];
    _jsonLabel.text = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
