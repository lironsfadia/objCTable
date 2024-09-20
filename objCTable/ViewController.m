//
//  ViewController.m
//  objCTable
//
//  Created by Liron on 20/09/2024.
//

#import "ViewController.h"
#import "Course.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray<Course *> *courses;
@end

@implementation ViewController

NSString *cellId = @"cellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"courses";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
   // [self setupCourses];
    [self fetchCoursesUsingJson];
    
    [self.tableView registerClass:UITableViewCell.class 
           forCellReuseIdentifier:cellId];
}

- (void) fetchCoursesUsingJson {
    NSLog(@"Fetching Courses");
    NSString *urlString = @"https://api.letsbuildthatapp.com/jsondecodable/courses";
    NSURL *url = [NSURL URLWithString:urlString];
    [
        [
            NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                NSLog(@"finish fetching courses...");
                
                NSError *err;
                NSArray *courseJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
                if(err){
                    NSLog(@"Failed to serialize into JSON %@...", err);
                    return;
                }
                
                NSMutableArray<Course *> *courses = NSMutableArray.new;
                for(NSDictionary *courseDict in courseJSON)
                {
                    NSLog(@"%@", courseDict);
                    Course *course = Course.new;
                    course.name = courseDict[@"name"];
                    course.numberOfLessons = courseDict[@"numberOfLessons"];
                    [courses addObject:course];
                }
                self.courses = courses;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            }
        ] resume
    ];
}

- (void)setupCourses {
    self.courses = NSMutableArray.new;
    Course *course = Course.new;
    course.name = @"Typescript for kids";
    course.numberOfLessons = @20;
    [self.courses addObject:course];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.courses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // star = pointer for obj
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    
    Course *course = self.courses[indexPath.row];
    cell.backgroundColor = UIColor.redColor;
    cell.textLabel.text = course.name;
    cell.detailTextLabel.text = course.numberOfLessons.stringValue;

    return cell;
}

@end
