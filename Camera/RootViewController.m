//
//  RootViewController.m
//  Camera
//
//  Created by wangdehuai on 15/5/10.
//  Copyright (c) 2015年 wangdehuai. All rights reserved.
//

#import "RootViewController.h"
#import<MobileCoreServices/MobileCoreServices.h>

@interface RootViewController ()
{
    UIImagePickerController* Videopicker;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *camera = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 300, 40)];
    [camera setBackgroundColor:[UIColor redColor]];
    [camera setTitle:@"摄像" forState:UIControlStateNormal];
    [self.view addSubview:camera];
    
    UIButton *videoLibrary = [[UIButton alloc] initWithFrame:CGRectMake(10, camera.frame.origin.y + camera.frame.size.height + 20, 300, 40)];
    [videoLibrary setBackgroundColor:[UIColor redColor]];
    [videoLibrary setTitle:@"视频库" forState:UIControlStateNormal];
    [self.view addSubview:videoLibrary];
    
    
    
    UIButton *photo = [[UIButton alloc] initWithFrame:CGRectMake(10, videoLibrary.frame.origin.y + videoLibrary.frame.size.height + 20, 300, 40)];
    [photo setBackgroundColor:[UIColor orangeColor]];
    [photo setTitle:@"照像" forState:UIControlStateNormal];
    [self.view addSubview:photo];
    
    UIButton *photoLibrary = [[UIButton alloc] initWithFrame:CGRectMake(10, photo.frame.origin.y + photo.frame.size.height + 20, 300, 40)];
    [photoLibrary setBackgroundColor:[UIColor orangeColor]];
    [photoLibrary setTitle:@"照片库" forState:UIControlStateNormal];
    [self.view addSubview:photoLibrary];
    
    
    [camera addTarget:self action:@selector(cameraClick:) forControlEvents:UIControlEventTouchUpInside];
    [videoLibrary addTarget:self action:@selector(videoLibraryClick:) forControlEvents:UIControlEventTouchUpInside];
    [photo addTarget:self action:@selector(photoClick:) forControlEvents:UIControlEventTouchUpInside];
    [photoLibrary addTarget:self action:@selector(photoLibraryClick:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 摄像
-(void)cameraClick:(id)sender{
    if (!Videopicker) {
        Videopicker = [[UIImagePickerController alloc] init];
        [Videopicker setDelegate:self];
        [Videopicker setEditing:NO];
    }
    NSArray *sourceTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    if (![sourceTypes containsObject: (NSString *)kUTTypeMovie]) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"设备不支持摄像" message:@"" delegate:sender cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [av show];
    }else{
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == YES) {
            [Videopicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        }else{
            [Videopicker setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
        }
        [Videopicker setMediaTypes:[NSArray arrayWithObject:(NSString *)kUTTypeMovie]];
        [self.navigationController presentViewController:Videopicker animated:YES completion:nil];
    }
}

#pragma mark - 视频库
-(void)videoLibraryClick:(id)sender{
    if (!Videopicker) {
        Videopicker = [[UIImagePickerController alloc] init];
        [Videopicker setDelegate:self];
        [Videopicker setEditing:NO];
    }
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary] == YES) {
        Videopicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        Videopicker.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeMovie];
        [self.navigationController presentViewController:Videopicker animated:YES completion:nil];
    }else{
        [[[UIAlertView alloc] initWithTitle:@"设备不支持视频" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil] show];
    }
}

#pragma mark - 照相
-(void)photoClick:(id)sender{
    if (!Videopicker) {
        Videopicker = [[UIImagePickerController alloc] init];
        [Videopicker setDelegate:self];
        [Videopicker setEditing:NO];
    }
    NSArray *sourceTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    if (![sourceTypes containsObject: (NSString *)kUTTypeImage]) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"设备不支持照相" message:@"" delegate:sender cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [av show];
    }else{
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == YES) {
            [Videopicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        }else{
            [Videopicker setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
        }
        [Videopicker setMediaTypes:[NSArray arrayWithObject:(NSString *)kUTTypeImage]];
        [self.navigationController presentViewController:Videopicker animated:YES completion:nil];
    }
}

#pragma mark - 照片库
-(void)photoLibraryClick:(id)sender{
    if (!Videopicker) {
        Videopicker = [[UIImagePickerController alloc] init];
        [Videopicker setDelegate:self];
        [Videopicker setEditing:NO];
    }
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary] == YES) {
        Videopicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        Videopicker.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeImage];
        [self.navigationController presentViewController:Videopicker animated:YES completion:nil];
    }else{
        [[[UIAlertView alloc] initWithTitle:@"设备不支持照片库" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil] show];
    }
}

#pragma mark - 选择完成
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 取消
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
