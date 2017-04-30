/*
Gets the WindowOwnerName, WindowName and WindowNumber for all open windows

Useful for running screencapture to capture just that window:

screencapture -l<windowid> filename.png
*/

#include <Cocoa/Cocoa.h>
#include <CoreGraphics/CGWindow.h>

int main(int argc, char **argv)
{
    NSArray *windows = (NSArray *)CGWindowListCopyWindowInfo(kCGWindowListExcludeDesktopElements|kCGWindowListOptionOnScreenOnly,kCGNullWindowID);

    for(NSDictionary *window in winows){
        NSString* ownerName = [window objectForKey: (NSString *)kCGWindowOwnerName];
        NSString* name = [window objectForKey: (NSString *)kCGWindowName];
        int number = [[window objectForKey: (NSString *)kCGWindowNumber] intValue];
        printf("%s:%s:%d\n", [ownerName UTF8String], [name UTF8String], number);
    }
}
