//
//  ViewController.m
//  WordCount
//
//  Created by Vidya Murthy on 13/10/15.
//  Copyright © 2015 Vidya Murthy. All rights reserved.
//

#import "ViewController.h"
#import "Speech.h"
#import "DetailViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.dataArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initializeData];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - User Defined Methods

-(void)initializeData {
    
    Speech *speech1 = [[Speech alloc] init];
    speech1.speaker = @"Winston Churchill";
    speech1.speakerImage = @"Images/Churchill.png";
    speech1.speechDate = @"June 4 1940";
    speech1.speechFileName = @"SpeechTextFiles/WinstonChurchill.txt";
    
    [self.dataArray addObject:speech1];
    
    Speech *speech2 = [[Speech alloc] init];
    speech2.speaker = @"John F Kennedy";
    speech2.speakerImage = @"Images/JFK.png";
    speech2.speechDate = @"January 20 1961";
    speech2.speechFileName = @"SpeechTextFiles/JohnFKennedy.txt";
    
    [self.dataArray addObject:speech2];
    
    Speech *speech3 = [[Speech alloc] init];
    speech3.speaker = @"Nelson Mandela";
    speech3.speakerImage = @"Images/mandela.png";
    speech3.speechDate = @"April 20 1964";
    speech3.speechFileName = @"SpeechTextFiles/NelsonMandela.txt";
    
    [self.dataArray addObject:speech3];
    
    Speech *speech4 = [[Speech alloc] init];
    speech4.speaker = @"Franklin D Roosevelt";
    speech4.speakerImage = @"Images/Roosevelt.png";
    speech4.speechDate = @"March 4 1933";
    speech4.speechFileName = @"SpeechTextFiles/FranklinDRoosevelt.txt";
    
    [self.dataArray addObject:speech4];
    
    Speech *speech5 = [[Speech alloc] init];
    speech5.speaker = @"Nikita Khrushchev";
    speech5.speakerImage = @"Images/Khrushchev.png";
    speech5.speechDate = @"February 25 1956";
    speech5.speechFileName = @"SpeechTextFiles/NikitaKhrushchev.txt";
    
    [self.dataArray addObject:speech5];
    
    Speech *speech6 = [[Speech alloc] init];
    speech6.speaker = @"Emmeline Pankhurst";
    speech6.speakerImage = @"Images/Pankhurst.png";
    speech6.speechDate = @"November 13 1913";
    speech6.speechFileName = @"SpeechTextFiles/EmmelinePankhurst.txt";

    [self.dataArray addObject:speech6];
    
    Speech *speech7 = [[Speech alloc] init];
    speech7.speaker = @"Martin Luther King";
    speech7.speakerImage = @"Images/MLK.png";
    speech7.speechDate = @"August 28 1963";
    speech7.speechFileName = @"SpeechTextFiles/MartinLutherKing.txt";
    
    [self.dataArray addObject:speech7];
    
    Speech *speech8 = [[Speech alloc] init];
    speech8.speaker = @"Charles de Gaulle";
    speech8.speakerImage = @"Images/DeGaulle.png";
    speech8.speechDate = @"June 18 1940";
    speech8.speechFileName = @"SpeechTextFiles/CharlesdeGaulle.txt";
    
    [self.dataArray addObject:speech8];
    
    Speech *speech9 = [[Speech alloc] init];
    speech9.speaker = @"Margaret Thatcher";
    speech9.speakerImage = @"Images/Thatcher.png";
    speech9.speechDate = @"October 10 1980";
    speech9.speechFileName = @"SpeechTextFiles/MargaretThatcher.txt";
    
    [self.dataArray addObject:speech9];
    
    Speech *speech10 = [[Speech alloc] init];
    speech10.speaker = @"Jawaharlal Nehru";
    speech10.speakerImage = @"Images/Nehru.png";
    speech10.speechDate = @"August 14 1947";
    speech10.speechFileName = @"SpeechTextFiles/JawaharlalNehru.txt";
    
    [self.dataArray addObject:speech10];
    
}

#pragma mark - UITableView Datasource Delegate Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier = @"itemCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    Speech *speech = [self.dataArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = speech.speaker;
    cell.detailTextLabel.text = speech.speechDate;
    UIImage *cellImage = [UIImage imageNamed:speech.speakerImage];
    cell.imageView.image = cellImage;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *detailVC = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    detailVC.speech = [self.dataArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end
