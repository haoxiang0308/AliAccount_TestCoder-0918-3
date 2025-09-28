// Fill this file with C++ code for an Unreal Engine Player Controller class handling input.
// This file corresponds to the header file MyPlayerController.h

#include "MyPlayerController.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"

AMyPlayerController::AMyPlayerController()
{
}

void AMyPlayerController::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Assuming UEnhancedInputComponent is used for input mapping
	UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(InputComponent);
	if (EnhancedInputComponent)
	{
		// Bind input actions here. Example bindings:
		// EnhancedInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &AMyPlayerController::MoveForward);
		// EnhancedInputComponent->BindAction(MoveRightAction, ETriggerEvent::Triggered, this, &AMyPlayerController::MoveRight);
		// EnhancedInputComponent->BindAction(LookUpAction, ETriggerEvent::Triggered, this, &AMyPlayerController::LookUp);
		// EnhancedInputComponent->BindAction(TurnAction, ETriggerEvent::Triggered, this, &AMyPlayerController::Turn);
		// EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &AMyPlayerController::Jump);
	}
}

void AMyPlayerController::BeginPlay()
{
	Super::BeginPlay();

	// Get the local player subsystem
	if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(GetLocalPlayer()))
	{
		// Add the input mapping context to the local player
		// Subsystem->AddMappingContext(DefaultMappingContext, 0);
	}
}

void AMyPlayerController::MoveForward(float Value)
{
	// Add forward movement logic here
}

void AMyPlayerController::MoveRight(float Value)
{
	// Add right movement logic here
}

void AMyPlayerController::LookUp(float Value)
{
	// Add look up logic here
}

void AMyPlayerController::Turn(float Value)
{
	// Add turn logic here
}

void AMyPlayerController::Jump()
{
	// Add jump logic here
}