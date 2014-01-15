//
//  CreatureViewController.m
//  MythicalCreatureManagementSystem
//
//  Created by Matthew Graham on 1/14/14.
//  Copyright (c) 2014 Matthew Graham. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController () <UITextFieldDelegate>
{
    __weak IBOutlet UILabel *name;
    __weak IBOutlet UITextField *nameTextField;
    __weak IBOutlet UIButton *editButton;
    __weak IBOutlet UIButton *saveButton;
    __weak IBOutlet UITextView *creatureDescriptionTextView;
    __weak IBOutlet UILabel *attackPointsLabelView;
    __weak IBOutlet UILabel *hitPointsLabelView;
    __weak IBOutlet UIImageView *creatureImage;
}

@end

@implementation CreatureViewController


@synthesize creature;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    creatureImage.image
    = [UIImage imageNamed:creature.image];
	name.text = creature.name;
    creatureDescriptionTextView.text = creature.description;
    creatureDescriptionTextView.editable = NO;
    attackPointsLabelView.text = [NSString stringWithFormat:@"%d", creature.attackPoints];
    hitPointsLabelView.text = [NSString stringWithFormat:@"%d",creature.hitPoints];
    saveButton.alpha = 0;
    
}
- (IBAction)onEditButtonPressed:(id)sender
{
    name.alpha = 0;
    editButton.alpha = 0;
    nameTextField.alpha = 1;
    saveButton.alpha = 1;
    nameTextField.text = creature.name;
    creatureDescriptionTextView.editable = YES;
}

- (IBAction)onSaveButtonPressed:(id)sender
{
    creature.name = nameTextField.text;
    creature.description = creatureDescriptionTextView.text;
    [self viewDidLoad];
    name.alpha = 1;
    editButton.alpha = 1;
    nameTextField.alpha = 0;
    
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [nameTextField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
