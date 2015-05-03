# NewFeature
APP新特性启动页面 
    
说明 
-----------------------------------  
  NewFeature 是通过UICollectionView + UIPageControl 配合完成的APP新特性启动引导页面 \<h2\><br />  
  之前做项目时候写的，代码基本都已经独立分离在外部的类扩展，尽量做到简单干净，通俗易懂！
          
### 使用方法    
    使用时只要直接替换Demo中的图片即可. 
    UIPageControl 指示器的颜色可在新特性控制器里自行根据启动图片风格调整所需颜色
    判断是否需要启动新特性页面在UIWindow分类扩展的- (void)chooseRootViewController 方法修改.
  
### 进入控制器在自定义Cell的方法里修改：
    - (void)start 
    {
	      UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
         UIViewController *vc = sb.instantiateInitialViewController;
         [UIApplication sharedApplication].keyWindow.rootViewController = vc;
	   }

### 联系  
1，如果在使用过程中遇到BUG，希望你能Issues我，谢谢<br /> 
2，我的博客：[iosplus.cn](http://www.iosplus.cn)<br />  
