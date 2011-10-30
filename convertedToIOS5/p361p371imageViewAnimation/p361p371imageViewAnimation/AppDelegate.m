

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self performSelector:@selector(animate) withObject:nil afterDelay:1.0];
    return YES;
}

#define which 1 // try 2 and 3 for animated image, new feature in iOS 5

- (void) animate {
    switch (which) {
        case 1: {
            UIImage* mars = [UIImage imageNamed: @"mars.png"];
            UIGraphicsBeginImageContext(mars.size);
            UIImage* empty = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            NSArray* arr = [NSArray arrayWithObjects: mars, empty, mars, empty, mars, nil];
            UIImageView* iv = [[UIImageView alloc] initWithFrame:CGRectMake(56, 63, 208, 208)];
            [self.window addSubview: iv];
            iv.animationImages = arr;
            iv.animationDuration = 2;
            iv.animationRepeatCount = 1;
            [iv startAnimating];
            break;
        }
        case 2: {
            // new feature in iOS 5: animated images
            // the image animates for as long as it is shown
            // in this example, that's forever!
            // The idea here is that you can do this in *any* context where an image is displayed...
            // not just in an image view
            // but I'm using an image view to illustrate anyway
            UIImage* mars = [UIImage imageNamed: @"mars.png"];
            UIGraphicsBeginImageContext(mars.size);
            UIImage* empty = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            NSArray* arr = [NSArray arrayWithObjects: mars, empty, mars, empty, mars, empty, nil];
            UIImage* im = [UIImage animatedImageWithImages:arr duration:2];
            UIImageView* iv = [[UIImageView alloc] initWithFrame:CGRectMake(56, 63, 208, 208)];
            iv.image = im;
            [self.window addSubview: iv];
            break;
        }
        case 3: {
            // even though we haven't formally discussed buttons,
            // here's one with an animated image
            NSMutableArray* arr = [NSMutableArray array];
            float w = 18;
            for (int i = 0; i < 6; i++) {
                UIGraphicsBeginImageContext(CGSizeMake(w,w));
                CGContextRef con = UIGraphicsGetCurrentContext();
                CGContextSetFillColorWithColor(con, [UIColor redColor].CGColor);
                CGContextAddEllipseInRect(con, CGRectMake(0+i,0+i,w-i*2,w-i*2));
                CGContextFillPath(con);
                UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                [arr addObject:im];
            }
            UIImage* im = [UIImage animatedImageWithImages:arr duration:0.5];
            UIButton* b = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [b setTitle:@"Howdy" forState:UIControlStateNormal];
            [b setImage:im forState:UIControlStateNormal];
            b.center = CGPointMake(100,100);
            [b sizeToFit];
            [self.window addSubview:b];
        }
    }
    
    


}


@end
